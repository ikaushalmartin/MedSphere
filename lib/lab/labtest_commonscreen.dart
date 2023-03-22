import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:readmore/readmore.dart';

import '../Models/lab_cart_model.dart';
import '../Models/popularcategories_model.dart';
import '../buy and cart/cart.dart';
import 'lab_cart.dart';
import '../main.dart';

class labtest_commonscreen extends StatefulWidget {
  labtest_commonscreen(
      {Key? key,
      required this.heading,
      required this.name,
      required this.cutprice,
      required this.info,
      required this.price,
      required this.sampletype,
      required this.fastingrequired,
      required this.tubetype,
      required this.packagesinclude,
      required this.description})
      : super(key: key);

  String heading;
  String cutprice;
  String info;
  String price;
  String sampletype;
  String fastingrequired;
  String tubetype;
  String packagesinclude;
  String description;
  String name;

  @override
  State<labtest_commonscreen> createState() => _labtest_commonscreenState();
}

class _labtest_commonscreenState extends State<labtest_commonscreen> {
  Color light_red = Color(0xffdae1ff);
  Color white = Color(0xffffffff);
  Color textcolor = Color(0xff1D1D1F);
  Color textcolor_white = Color(0xff949494);
  Color bluecolor = Color(0xff007AFF);
  Color bluecolor_bg = Color(0xffDAE1FF);
  Color redcolor = Color(0xffFE2D54);
  Color background = Color(0xffF2F1F6);
  bool enable = true;

  List<lab_cartmodel> deliveryandminval_list_for_checkforlab = [];

  int quantity = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_cart_data_for_checklab();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: background,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: white,
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
                      Theme(
                        data: ThemeData(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Get.to(() => lab_cart(),
                                transition: Transition.rightToLeft);
                          },
                          icon: Icon(Icons.shopping_cart_outlined),
                          color: textcolor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.175,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 35,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height / 60,
                            right: MediaQuery.of(context).size.height / 60),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 40,
                                spreadRadius: 3,
                                color: Color(0xffD2D1D5),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 80,
                              bottom: MediaQuery.of(context).size.height / 80,
                              left: MediaQuery.of(context).size.height / 80,
                              right: MediaQuery.of(context).size.height / 80),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.name}",
                                style: TextStyle(
                                  fontFamily: 'semibold',
                                  fontSize: 20,
                                  color: textcolor,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 200,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Text(
                                  "${widget.packagesinclude}...",
                                  style: TextStyle(
                                    fontFamily: 'regular',
                                    fontSize: 13,
                                    color: bluecolor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 70,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "₹${widget.cutprice}",
                                            style: TextStyle(
                                              fontFamily: 'semibold',
                                              fontSize: 16,
                                              color: textcolor,
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                40,
                                          ),
                                          Text(
                                            "MRP₹${widget.price}",
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontFamily: 'medium',
                                              fontSize: 14,
                                              color: textcolor_white,
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                9,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Inclusive all taxes",
                                        style: TextStyle(
                                          fontFamily: 'medium',
                                          fontSize: 12,
                                          color: textcolor_white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    //  height: 50.0,
                                    child: MaterialButton(
                                      onPressed: () {
                                        print("enablie------->$enable");
                                        fetch_cart_data_for_checklab();
                                        if (deliveryandminval_list_for_checkforlab
                                            .isEmpty) {
                                          enable = true;
                                        }
                                        setState(() {
                                          enable;
                                        });

                                        if (enable == true) {
                                          addtocart(
                                            widget.heading,
                                            widget.name,
                                            widget.cutprice,
                                            widget.price,
                                          );
                                        } else {
                                          var checksnackbar = SnackBar(
                                            content: const Text(
                                                "Item Already Added!"),
                                            backgroundColor: textcolor,
                                            shape: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(1)),
                                            duration:
                                                Duration(milliseconds: 2000),
                                            behavior: SnackBarBehavior.floating,
                                          );
                                          setState(() {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(checksnackbar);
                                          });
                                        }
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.0)),
                                      padding: EdgeInsets.all(0.0),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                            color: bluecolor,
                                            borderRadius:
                                                BorderRadius.circular(30.0)),
                                        child: Container(
                                          constraints: BoxConstraints(
                                            minHeight: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                18,
                                            minWidth: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                6,
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Book Test",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "medium"),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                            right: MediaQuery.of(context).size.height / 60),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 60,
                              bottom: MediaQuery.of(context).size.height / 60,
                              left: MediaQuery.of(context).size.height / 60,
                              right: MediaQuery.of(context).size.height / 60),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 40,
                                spreadRadius: 3,
                                color: Color(0xffD2D1D5),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 8,
                                    color: bluecolor,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 70,
                                  ),
                                  Text(
                                    "Sample Type :",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                      fontSize: 16,
                                      color: textcolor,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                  ),
                                  Text(
                                    "${widget.sampletype}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: textcolor_white,
                                        fontFamily: "medium"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 8,
                                    color: bluecolor,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 70,
                                  ),
                                  Text(
                                    "Fasting Required :",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                      fontSize: 16,
                                      color: textcolor,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                  ),
                                  Text("${widget.fastingrequired}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: textcolor_white,
                                          fontFamily: "medium"))
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 8,
                                    color: bluecolor,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 70,
                                  ),
                                  Text(
                                    "Tube Type :",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                      fontSize: 16,
                                      color: textcolor,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.9,
                                    child: Text("${widget.tubetype}",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: textcolor_white,
                                            fontFamily: "medium")),
                                  )
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        size: 8,
                                        color: bluecolor,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                70,
                                      ),
                                      Text(
                                        "Test Includes :",
                                        style: TextStyle(
                                          fontFamily: 'medium',
                                          fontSize: 16,
                                          color: textcolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.2,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.9,
                                      child: ReadMoreText(
                                        "${widget.packagesinclude} ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: textcolor_white,
                                            fontFamily: "medium"),
                                        trimLines: 3,
                                        colorClickableText: bluecolor,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: 'Show more',
                                        trimExpandedText: 'Show less',
                                        moreStyle: TextStyle(
                                            fontSize: 14,
                                            color: bluecolor,
                                            fontFamily: "medium"),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        size: 8,
                                        color: bluecolor,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                70,
                                      ),
                                      Text(
                                        "Description :",
                                        style: TextStyle(
                                          fontFamily: 'medium',
                                          fontSize: 16,
                                          color: textcolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        120,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: ReadMoreText(
                                      "${widget.description} ",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: textcolor_white,
                                          fontFamily: "regular"),
                                      trimLines: 4,
                                      colorClickableText: bluecolor,
                                      trimMode: TrimMode.Line,
                                      trimCollapsedText: 'Show more',
                                      trimExpandedText: 'Show less',
                                      moreStyle: TextStyle(
                                          fontSize: 13,
                                          color: bluecolor,
                                          fontFamily: "regular"),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 150,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Future addtocart(
      String heading, String productname, String price, String cutprice) async {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));
    await FirebaseFirestore.instance
        .collection('lab_cart')
        .doc(uid)
        .collection("lab_cartitems")
        .add({
      'package': heading,
      'name': productname,
      'price': price,
      'cutprice': cutprice,
      'quantity': quantity,
      'sampletype': widget.sampletype,
      'fastingrequired': widget.fastingrequired,
      'tubetype': widget.tubetype,
      'packagesinclude': widget.packagesinclude,
      'description': widget.description,
      'info': widget.info
    });
    Navigator.of(context).pop();
    var vpasswordsnackbar = SnackBar(
      content: const Text("Item Added To Cart!"),
      backgroundColor: textcolor,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),
      duration: Duration(milliseconds: 2000),
      behavior: SnackBarBehavior.floating,
    );
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(vpasswordsnackbar);
    });
  }

  fetch_cart_data_for_checklab() async {
    var _cart_data = await FirebaseFirestore.instance
        .collection('lab_cart')
        .doc(uid)
        .collection("lab_cartitems")
        .get();
    map_cart_dataforchecklab(_cart_data);
  }

  map_cart_dataforchecklab(QuerySnapshot<Map<String, dynamic>> data) {
    var cart_item = data.docs
        .map((item) => lab_cartmodel(
            id: item.id,
            cutprice: item['cutprice'],
            packages: item['package'],
            name: item['name'],
            price: item['price'],
            quantity: item['quantity']))
        .toList();
    setState(() {
      deliveryandminval_list_for_checkforlab = cart_item;
    });
    checkButtonlab();
    return deliveryandminval_list_for_checkforlab;
  }

  void checkButtonlab() {
    for (int i = 0; i < deliveryandminval_list_for_checkforlab.length; i++) {
      print(
          '${widget.name}---------------${deliveryandminval_list_for_checkforlab[i].name}');
      if (widget.heading ==
              deliveryandminval_list_for_checkforlab[i].packages &&
          widget.name == deliveryandminval_list_for_checkforlab[i].name) {
        enable = false;
        break;
      } else {
        enable = true;
      }
    }

    setState(() {
      enable;
    });
  }
}
