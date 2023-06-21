import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../Models/topdeals_model.dart';
import '../../buy and cart/cart.dart';
import '../../product_commonscreen/Common Screen.dart';

class medicine_for_doctors_corner extends StatefulWidget {
  String itemname, category;
  medicine_for_doctors_corner(
      {Key? key, required this.itemname, required this.category})
      : super(key: key);

  @override
  State<medicine_for_doctors_corner> createState() =>
      _medicine_for_doctors_cornerState();
}

class _medicine_for_doctors_cornerState
    extends State<medicine_for_doctors_corner> {
  List top_images_list_images = [];
  List<topdeals> top_deals_deatils_list = [];

  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);

  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
  Color textcolor_light = Color(0xffACAEBA);
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: textcolor,
                              size: 20,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height / 60,
                          ),
                          Text(
                            "Medicine",
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 16,
                              color: textcolor,
                            ),
                          ),
                        ],
                      ),
                      Theme(
                        data: ThemeData(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Get.to(() => const cart(),
                                transition: Transition.rightToLeft);
                          },
                          icon: Icon(Icons.shopping_cart_outlined),
                          color: textcolor,
                          iconSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
              Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height / 60,
                    right: MediaQuery.of(context).size.height / 60,
                  ),
                  child: Text(
                    "Available Medicine",
                    style: TextStyle(
                      fontFamily: 'medium',
                      fontSize: 16,
                      color: textcolor,
                    ),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height / 60,
                    right: MediaQuery.of(context).size.height / 60,
                  ),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: top_images_list_images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                                () => product_common_screen(
                                      heading: "Medicine Detail",
                                      image_url: top_images_list_images[index],
                                      name: top_deals_deatils_list[index].name,
                                      precaution_and_warning:
                                          top_deals_deatils_list[index]
                                              .precaution_and_warning,
                                      sideeffect: top_deals_deatils_list[index]
                                          .sideeffect,
                                      doses:
                                          top_deals_deatils_list[index].doses,
                                      uses: top_deals_deatils_list[index].uses,
                                      medicaldiscription:
                                          top_deals_deatils_list[index]
                                              .medicaldiscription,
                                      company:
                                          top_deals_deatils_list[index].company,
                                      quantity: top_deals_deatils_list[index]
                                          .quantity,
                                      cuttopdeals: top_deals_deatils_list[index]
                                          .cuttopdeals,
                                      price:
                                          top_deals_deatils_list[index].price,
                                      ingredients:
                                          top_deals_deatils_list[index].salts,
                                    ),
                                transition: Transition.rightToLeft);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height / 60,
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 80,
                                  left: MediaQuery.of(context).size.height / 60,
                                  right:
                                      MediaQuery.of(context).size.height / 60,
                                  bottom:
                                      MediaQuery.of(context).size.height / 80,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      foregroundImage: NetworkImage(
                                        top_images_list_images[index],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.6,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              23,
                                          child: Text(
                                            top_deals_deatils_list[index].name,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'medium',
                                              fontSize: 12,
                                              color: textcolor,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "₹${top_deals_deatils_list[index].price}",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                                fontSize: 12,
                                                color: bluecolor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  20,
                                            ),
                                            Text(
                                              "MRP₹${top_deals_deatils_list[index].cuttopdeals}",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                fontFamily: 'medium',
                                                fontSize: 12,
                                                color: textcolor_light,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ));
  }

  fetch_topdeals() async {
    var _packages_name = await FirebaseFirestore.instance
        .collection('/doctor_corners_items')
        .doc(widget.itemname)
        .collection(widget.category)
        .get();
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
            precaution_and_warning: item['Precaution_and_warning'],
            salts: item['Salts']))
        .toList();

    setState(() {
      top_deals_deatils_list = topdeal_name;
    });
  }

  Future topdeals_images() async {
    ListResult result = await FirebaseStorage.instance
        .ref()
        .child("/doctors_corner/${widget.itemname}/${widget.category}")
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
