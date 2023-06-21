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
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color textcolor_white = Color(0xffACAEBA);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
  Color light_red = Color(0xffdae1ff);

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
                color: white,
                child: Padding(
                  padding: EdgeInsets.only(
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
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Package Detail",
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 16,
                                color: textcolor,
                              ),
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
                            Get.to(() => lab_cart(),
                                transition: Transition.rightToLeft);
                          },
                          icon: Icon(Icons.shopping_cart_outlined),
                          color: textcolor,
                          iconSize: 20,
                        ),
                      )
                    ],
                  ), //toprow
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    Container(
                      color: white,
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 80,
                          bottom: MediaQuery.of(context).size.height / 80,
                          left: MediaQuery.of(context).size.height / 60,
                          right: MediaQuery.of(context).size.height / 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.name}",
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 16,
                              color: textcolor,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 200,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Text(
                              "${widget.packagesinclude}...",
                              style: TextStyle(
                                fontFamily: 'regular',
                                fontSize: 12,
                                color: bluecolor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 150,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "₹${widget.cutprice}",
                                        style: TextStyle(
                                          fontFamily: 'medium',
                                          fontSize: 14,
                                          color: textcolor,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                40,
                                      ),
                                      Text(
                                        "MRP₹${widget.price}",
                                        style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontFamily: 'regular',
                                          fontSize: 13,
                                          color: textcolor_white,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                9,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Inclusive all taxes",
                                    style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 10,
                                      color: textcolor_white,
                                    ),
                                  ),
                                ],
                              ),
                              MaterialButton(
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
                                      content:
                                          const Text("Item Already Added!"),
                                      backgroundColor: textcolor,
                                      shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(1)),
                                      duration: Duration(milliseconds: 2000),
                                      behavior: SnackBarBehavior.floating,
                                    );
                                    setState(() {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(checksnackbar);
                                    });
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80.0)),
                                padding: EdgeInsets.all(0.0),
                                child: Ink(
                                  decoration: BoxDecoration(
                                      color: bluecolor,
                                      borderRadius: BorderRadius.circular(6.0)),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      minHeight:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      minWidth:
                                          MediaQuery.of(context).size.height /
                                              7,
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
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 80,
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                        bottom: MediaQuery.of(context).size.height / 80,
                      ),
                      color: white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 6,
                                color: bluecolor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 70,
                              ),
                              Text(
                                "Sample Type :",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 12,
                                  color: textcolor,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 45,
                              ),
                              Text(
                                "${widget.sampletype}",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: textcolor_white,
                                    fontFamily: "regular"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 100,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 6,
                                color: bluecolor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 70,
                              ),
                              Text(
                                "Fasting Required :",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 12,
                                  color: textcolor,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 45,
                              ),
                              Text("${widget.fastingrequired}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: textcolor_white,
                                      fontFamily: "regular"))
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 100,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.circle,
                                size: 6,
                                color: bluecolor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 70,
                              ),
                              Text(
                                "Tube Type :",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 12,
                                  color: textcolor,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 45,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.9,
                                child: Text("${widget.tubetype}",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: textcolor_white,
                                        fontFamily: "regular")),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 100,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 6,
                                    color: bluecolor,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 70,
                                  ),
                                  Text(
                                    "Test Includes :",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                      fontSize: 12,
                                      color: textcolor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 45,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.2,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.9,
                                  child: ReadMoreText(
                                    "${widget.packagesinclude} ",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: textcolor_white,
                                        fontFamily: "regular"),
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
                            height: MediaQuery.of(context).size.height / 100,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 6,
                                    color: bluecolor,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 70,
                                  ),
                                  Text(
                                    "Description :",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                      fontSize: 12,
                                      color: textcolor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 120,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ReadMoreText(
                                  "${widget.description} ",
                                  style: TextStyle(
                                      fontSize: 12,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 150,
                    ),
                  ],
                ),
              ),
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
    Get.to(() => const lab_cart(), transition: Transition.rightToLeft);
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
