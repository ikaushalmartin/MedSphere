import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/product_commonscreen/Common%20Screen.dart';

import 'Models/popularcategories_model.dart';
import 'Models/topdeals_model.dart';

class shopbyconcern extends StatefulWidget {
  String heading3;

  shopbyconcern({Key? key, required this.heading3}) : super(key: key);

  @override
  State<shopbyconcern> createState() => _shopbyconcernState();
}

class _shopbyconcernState extends State<shopbyconcern> {
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
  Color textcolor_light = Color(0xffACAEBA);

  List shopbycenern_images = [];
  List<topdeals> shopbycenern_items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_conern_items();
    concern_images();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: white,
                height: MediaQuery.of(context).size.height / 16,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                        widget.heading3,
                        style: TextStyle(
                          fontFamily: 'medium',
                          fontSize: 16,
                          color: textcolor,
                        ),
                      ),
                    ],
                  ), //toprow
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
                    "All ${widget.heading3} Products",
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
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height / 60,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: shopbycenern_images.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                        () => product_common_screen(
                                              heading: "Product Detail",
                                              image_url:
                                                  shopbycenern_images[index],
                                              name: shopbycenern_items[index]
                                                  .name,
                                              precaution_and_warning:
                                                  shopbycenern_items[index]
                                                      .precaution_and_warning,
                                              sideeffect:
                                                  shopbycenern_items[index]
                                                      .sideeffect,
                                              doses: shopbycenern_items[index]
                                                  .doses,
                                              uses: shopbycenern_items[index]
                                                  .uses,
                                              medicaldiscription:
                                                  shopbycenern_items[index]
                                                      .medicaldiscription,
                                              company: shopbycenern_items[index]
                                                  .company,
                                              quantity:
                                                  shopbycenern_items[index]
                                                      .quantity,
                                              cuttopdeals:
                                                  shopbycenern_items[index]
                                                      .cuttopdeals,
                                              price: shopbycenern_items[index]
                                                  .price,
                                              ingredients:
                                                  shopbycenern_items[index]
                                                      .salts,
                                            ),
                                        transition: Transition.rightToLeft);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height /
                                          80,
                                      left: MediaQuery.of(context).size.height /
                                          60,
                                      right:
                                          MediaQuery.of(context).size.height /
                                              60,
                                      bottom:
                                          MediaQuery.of(context).size.height /
                                              80,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          foregroundImage: NetworkImage(
                                            "${shopbycenern_images[index]}",
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
                                                shopbycenern_items[index].name,
                                                style: TextStyle(
                                                  fontFamily: 'semibold',
                                                  fontSize: 16,
                                                  color: textcolor,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "₹${shopbycenern_items[index].price}",
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
                                                  "MRP ₹${shopbycenern_items[index].cuttopdeals}",
                                                  style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
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
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  fetch_conern_items() async {
    var _essential_data = await FirebaseFirestore.instance
        .collection('/shop by concern')
        .doc(widget.heading3)
        .collection("items")
        .get();
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));
    map_category_data(_essential_data);
  }

  map_category_data(QuerySnapshot<Map<String, dynamic>> data) {
    var cart_item = data.docs
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
      shopbycenern_items = cart_item;
    });
    print(shopbycenern_items);
    return shopbycenern_items;
  }

  Future concern_images() async {
    ListResult result = await FirebaseStorage.instance
        .ref()
        .child("/shop by concern/${widget.heading3}")
        .list();
    List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      shopbycenern_images.add(fileUrl);
    });

    setState(() {
      shopbycenern_images;
    });
    print(shopbycenern_images);
    Navigator.of(context).pop();
    return shopbycenern_images;
  }
}
