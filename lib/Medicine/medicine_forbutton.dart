import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Models/topdeals_model.dart';
import '../buy and cart/cart.dart';
import '../const.dart';

import '../orderbyprescription.dart';
import '../product_commonscreen/Common Screen.dart';

class medicineforbutton extends StatefulWidget {
  const medicineforbutton({Key? key}) : super(key: key);

  @override
  State<medicineforbutton> createState() => _medicineforbuttonState();
}

class _medicineforbuttonState extends State<medicineforbutton> {
  List top_images_list_images = [];
  List<topdeals> top_deals_deatils_list = [];

  Color bluecolor = Color(0xff6588E6);
  Color bluecolor_bg = Color(0xffDAE1FF);
  Color textcolor = Color(0xD9181818);
  Color textcolor_light = Color(0x99181818);
  Color background = Color(0xffD9D9D9);
  Color white = Color(0xffffffff);
  Color search_bg = Color(0x1A000000);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_topdeals();
    topdeals_images();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: background,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            //   top: MediaQuery.of(context).size.height / 80,
                            left: MediaQuery.of(context).size.height / 60,
                            right: MediaQuery.of(context).size.height / 200),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: textcolor,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Medicine",
                                style: TextStyle(
                                  fontFamily: 'semibold',
                                  fontSize: 24,
                                  color: textcolor,
                                ),
                              ),
                            ),
                            Theme(
                              data: ThemeData(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Get.to(() => cart(),
                                      transition: Transition.rightToLeft);
                                },
                                icon: Icon(Icons.shopping_cart_outlined),
                                color: textcolor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ), //toprow
                    SizedBox(height: MediaQuery.of(context).size.height / 200),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height / 60,
                          right: MediaQuery.of(context).size.height / 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.35,
                            decoration: BoxDecoration(
                              color: search_bg,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              onChanged: (value) {},
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: textcolor),
                              textAlign: TextAlign.left,
                              decoration: kTextFieldDecoration.copyWith(
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintText: "Search"),
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 6,
                              decoration: BoxDecoration(
                                color: search_bg,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Theme(
                                data: ThemeData(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.search),
                                  color: textcolor,
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 70),
                    //searchbar
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    // height: MediaQuery.of(context).size.height / 1.451,
                    //  width: MediaQuery.of(context).size.width,
                    // color: Colors.white,
                    child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 150,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 60,
                          left: MediaQuery.of(context).size.height / 60,
                          right: MediaQuery.of(context).size.height / 60,
                          bottom: MediaQuery.of(context).size.height / 60,
                        ),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 4.8,
                              decoration: BoxDecoration(
                                color: bluecolor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: orderbyprescription_medicinepage(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 150,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 60,
                                left: MediaQuery.of(context).size.height / 60,
                                right: MediaQuery.of(context).size.height / 200,
                                bottom: MediaQuery.of(context).size.height / 60,
                              ),
                              child: Text(
                                "Top Deals",
                                style: TextStyle(
                                  fontFamily: 'semibold',
                                  fontSize: 20,
                                  color: textcolor,
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  //top:MediaQuery.of(context).size.height / 50,
                                  left: MediaQuery.of(context).size.height / 60,
                                  right:
                                      MediaQuery.of(context).size.height / 200),
                              child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: top_images_list_images.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Get.to(
                                                () => product_common_screen(
                                                      heading:
                                                          "Medicine Detail",
                                                      image_url:
                                                          top_images_list_images[
                                                              index],
                                                      name:
                                                          top_deals_deatils_list[
                                                                  index]
                                                              .name,
                                                      precaution_and_warning:
                                                          top_deals_deatils_list[
                                                                  index]
                                                              .precaution_and_warning,
                                                      sideeffect:
                                                          top_deals_deatils_list[
                                                                  index]
                                                              .sideeffect,
                                                      doses:
                                                          top_deals_deatils_list[
                                                                  index]
                                                              .doses,
                                                      uses:
                                                          top_deals_deatils_list[
                                                                  index]
                                                              .uses,
                                                      medicaldiscription:
                                                          top_deals_deatils_list[
                                                                  index]
                                                              .medicaldiscription,
                                                      company:
                                                          top_deals_deatils_list[
                                                                  index]
                                                              .company,
                                                      quantity:
                                                          top_deals_deatils_list[
                                                                  index]
                                                              .quantity,
                                                      cuttopdeals:
                                                          top_deals_deatils_list[
                                                                  index]
                                                              .cuttopdeals,
                                                      price:
                                                          top_deals_deatils_list[
                                                                  index]
                                                              .price,
                                                    ),
                                                transition:
                                                    Transition.rightToLeft);
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: textcolor_light,
                                                      width:
                                                          1.1, //                   <--- border width here
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: Image.network(
                                                      "${top_images_list_images[index]}",
                                                      scale: 5),
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    100,
                                              ),
                                              Text(
                                                "${top_deals_deatils_list[index].name}",
                                                style: TextStyle(
                                                  fontFamily: 'medium',
                                                  fontSize: 15,
                                                  color: textcolor,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    250,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "₹${top_deals_deatils_list[index].price}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: 'medium',
                                                      fontSize: 16,
                                                      color: textcolor,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            20,
                                                  ),
                                                  Text(
                                                    "₹${top_deals_deatils_list[index].cuttopdeals}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      fontFamily: 'medium',
                                                      fontSize: 16,
                                                      color: textcolor_light,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      }))),
                        ],
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),
        ));
  }

  fetch_topdeals() async {
    var _packages_name =
        await FirebaseFirestore.instance.collection('medicine top deals').get();
    map_top_deals(_packages_name);
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

  map_top_deals(QuerySnapshot<Map<String, dynamic>> data) {
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
            precaution_and_warning: item['Precaution_and_warning']))
        .toList();

    setState(() {
      top_deals_deatils_list = topdeal_name;
    });
  }

  Future topdeals_images() async {
    ListResult result = await FirebaseStorage.instance
        .ref()
        .child("/Medicine_top_deals")
        .list();
    List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      top_images_list_images.add(fileUrl);
    });

    setState(() {
      top_images_list_images;
    });
    Navigator.of(context).pop();
    return top_images_list_images;
  }
}
