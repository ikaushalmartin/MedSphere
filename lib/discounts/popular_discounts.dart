import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Models/topdeals_model.dart';
import '../const.dart';
import '../dashboard.dart';
import 'discount_products.dart';

class populardiscounts extends StatefulWidget {
  const populardiscounts({Key? key}) : super(key: key);

  @override
  State<populardiscounts> createState() => _populardiscountsState();
}

class _populardiscountsState extends State<populardiscounts> {
  List popular_discount_images = [];
  List deals_of_the_day_image_list2 = [];
  List<topdeals> top_deals_deatils_list = [];
  List<topdeals> deal_ofthedayitems = [];
  List item_images = [];
  List dealoftheday_items = [];

  @override
  Color bluecolor = Color(0xff2c64e3);
  Color textcolor = Color(0xff1D1D1F);
  Color prescription = Color(0xff8353AA);
  Color noprescription = Color(0xffE091C9);
  Color buttontextcolor = Color(0xff273238);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    deals_of_the_day_image();
    popular_discount_images_fetch();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 50,
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 200),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              FirebaseAuth.instance.signOut();
                            },
                            child: CircleAvatar(
                              child: Image.asset("images/1.png"),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Discounts",
                              style: TextStyle(
                                fontFamily: 'semibold',
                                fontSize: 24,
                                color: bluecolor,
                              ),
                            ),
                          ),
                          Theme(
                            data: ThemeData(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.shopping_cart_outlined),
                              color: textcolor,
                            ),
                          )
                        ],
                      ), //toprow

                      SizedBox(height: MediaQuery.of(context).size.height / 70),
                      //searchbar
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 40,
                      spreadRadius: 3,
                      color: Color(0xffD2D1D5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 60,
                    left: MediaQuery.of(context).size.height / 60,
                    right: MediaQuery.of(context).size.height / 60,
                    bottom: MediaQuery.of(context).size.height / 40,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Deals of the day",
                        style: TextStyle(
                          fontFamily: 'semibold',
                          fontSize: 21,
                          color: textcolor,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 60,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 5.5,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: deals_of_the_day_image_list2.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      deal_ofthedayitems.clear();
                                      dealoftheday_items.clear();
                                      fetch_deal_of_the_day(index + 1);
                                      dealofthedayimages(index + 1);
                                    },
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "${deals_of_the_day_image_list2[index]}")))),
                                  ),
                                );
                              })),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 35,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height / 60,
                  right: MediaQuery.of(context).size.height / 60,
                ),
                child: Text(
                  "On Going Deals",
                  style: TextStyle(
                    fontFamily: 'semibold',
                    fontSize: 21,
                    color: textcolor,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 60,
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 60,
                      bottom: MediaQuery.of(context).size.height / 80,
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 5.5,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: popular_discount_images.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 180,
                                left: MediaQuery.of(context).size.height / 60,
                                right: MediaQuery.of(context).size.height / 60,
                                bottom:
                                    MediaQuery.of(context).size.height / 180,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  top_deals_deatils_list.clear();
                                  item_images.clear();

                                  fetch_topdeals(index + 1);
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    popular_discount_images[index],
                                    scale: 2,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future deals_of_the_day_image() async {
    ListResult result =
        await FirebaseStorage.instance.ref().child("/deals of the day").list();
    List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      deals_of_the_day_image_list2.add(fileUrl);
    });

    setState(() {
      deals_of_the_day_image_list2;
    });

    return deals_of_the_day_image_list2;
  }

  Future popular_discount_images_fetch() async {
    ListResult result =
        await FirebaseStorage.instance.ref().child("/popular_discount").list();
    List<Reference> allFiles = result.items;

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      popular_discount_images.add(fileUrl);
    });

    setState(() {
      popular_discount_images;
    });
    Navigator.of(context).pop();
    return popular_discount_images;
  }

  fetch_topdeals(int x) async {
    var _packages_name = await FirebaseFirestore.instance
        .collection('POPULAR_DISCOUNTS')
        .doc('$x')
        .collection('discount_items')
        .get();
    map_top_deals(_packages_name, x);
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));
  }

  map_top_deals(QuerySnapshot<Map<String, dynamic>> data, int x) {
    var topdeal_name = data.docs
        .map((item) => topdeals(
            id: item.id,
            cuttopdeals: item['Cutprice'],
            name: item['Name'],
            price: item['Price'],
            quantity: item['Quantity'],
            company: item['Company'],
            medicaldiscription: item['Medical_Discription'],
            uses: item['Uses'],
            doses: item['Doses'],
            sideeffect: item['Side_Effect'],
            precaution_and_warning: item['Precaution_and_warning'],
            salts: item['Salts']))
        .toList();

    setState(() {
      top_deals_deatils_list = topdeal_name;
    });
    popular_discount_product_images(x);
  }

  Future popular_discount_product_images(int x) async {
    ListResult result = await FirebaseStorage.instance
        .ref()
        .child("/popular_discount/$x")
        .list();
    List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      item_images.add(fileUrl);
    });

    setState(() {
      item_images;
    });
    Navigator.of(context).pop();

    Get.to(
        () => discount_products(
            productlist: top_deals_deatils_list, item_image: item_images),
        transition: Transition.rightToLeft);
    return item_images;
  }

  fetch_deal_of_the_day(int x) async {
    var _packages_name = await FirebaseFirestore.instance
        .collection('DEAL_OFTHE_DAY')
        .doc('$x')
        .collection('discount_items')
        .get();
    map_dealsoftheday(_packages_name, x);
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));
  }

  map_dealsoftheday(QuerySnapshot<Map<String, dynamic>> data, int x) {
    var topdeal_name = data.docs
        .map((item) => topdeals(
            id: item.id,
            cuttopdeals: item['Cutprice'],
            name: item['Name'],
            price: item['Price'],
            quantity: item['Quantity'],
            company: item['Company'],
            medicaldiscription: item['Medical_Discription'],
            uses: item['Uses'],
            doses: item['Doses'],
            sideeffect: item['Side_Effect'],
            precaution_and_warning: item['Precaution_and_warning'],
            salts: item['Salts']))
        .toList();

    setState(() {
      deal_ofthedayitems = topdeal_name;
    });
  }

  Future dealofthedayimages(int x) async {
    ListResult result = await FirebaseStorage.instance
        .ref()
        .child("/deals of the day/$x")
        .list();
    List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      dealoftheday_items.add(fileUrl);
    });

    setState(() {
      dealoftheday_items;
    });
    Navigator.of(context).pop();

    Get.to(
        () => discount_products(
            productlist: deal_ofthedayitems, item_image: dealoftheday_items),
        transition: Transition.rightToLeft);
    return dealoftheday_items;
  }
}
