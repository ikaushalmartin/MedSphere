import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/const.dart';
import 'package:readmore/readmore.dart';

import '../buy and cart/cart.dart';

class product_common_screen extends StatefulWidget {
  String heading;
  String image_url;
  String cuttopdeals;
  String name;
  String price;
  String quantity;
  String company;
  String medicaldiscription;
  String uses;
  String doses;
  String sideeffect;
  String precaution_and_warning;

  product_common_screen({
    Key? key,
    required this.heading,
    required this.image_url,
    required this.name,
    required this.precaution_and_warning,
    required this.sideeffect,
    required this.doses,
    required this.uses,
    required this.medicaldiscription,
    required this.company,
    required this.quantity,
    required this.cuttopdeals,
    required this.price,
  }) : super(key: key);

  @override
  State<product_common_screen> createState() => _product_common_screenState();
}

class _product_common_screenState extends State<product_common_screen> {
  Color bluecolor = Color(0xff5093FE);
  Color bluecolor_bg = Color(0xffDAE1FF);
  Color textcolor = Color(0xD9181818);
  Color textcolor_light = Color(0x99181818);
  Color background = Color(0xffD9D9D9);
  Color white = Color(0xffffffff);
  Color search_bg = Color(0x1A000000);
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
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      // top: MediaQuery.of(context).size.height / 50,
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
                              "${widget.heading}",
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
                                Get.to(() => const cart(),
                                    transition: Transition.rightToLeft);
                              },
                              icon: Icon(Icons.shopping_cart_outlined),
                              color: textcolor,
                            ),
                          )
                        ],
                      ), //toprow

                      SizedBox(
                          height: MediaQuery.of(context).size.height / 100),
                      //searchbar
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 150,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3,
                        color: white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            "${widget.image_url}",
                            scale: 2,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 150,
                      ),
                      Container(
                        //  height: MediaQuery.of(context).size.height / 4.5,
                        width: MediaQuery.of(context).size.width,
                        color: white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                    MediaQuery.of(context).size.height / 450,
                              ), //name
                              Text(
                                "${widget.quantity},",
                                style: TextStyle(
                                  fontFamily: 'bold',
                                  fontSize: 11,
                                  color: textcolor_light,
                                ),
                              ), //quantity
                              Text("${widget.company}",
                                  style: TextStyle(
                                    fontFamily: 'semibold',
                                    fontSize: 14,
                                    color: bluecolor,
                                  )),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 120,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "MRP ₹${widget.price}",
                                            style: TextStyle(
                                              fontFamily: 'medium',
                                              fontSize: 16,
                                              color: textcolor,
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                30,
                                          ),
                                          Text(
                                            "₹${widget.cuttopdeals}",
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontFamily: 'medium',
                                              fontSize: 16,
                                              color: textcolor_light,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Inclusive all taxes",
                                        style: TextStyle(
                                          fontFamily: 'medium',
                                          fontSize: 12,
                                          color: textcolor_light,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    //  height: 50.0,
                                    child: MaterialButton(
                                      onPressed: () {
                                        addtocart(widget.name, widget.price,
                                            widget.company);
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.0)),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xff07DAEB),
                                                Color(0xff5093FE)
                                              ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0)),
                                        child: Container(
                                          constraints: BoxConstraints(
                                              maxWidth: 130.0, minHeight: 35.0),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Add to cart",
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
                              ), //price
                            ],
                          ),
                        ),
                      ), //buyandadd to cart
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 150,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Medical Discription",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                      fontSize: 18,
                                      color: textcolor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 250,
                              ),
                              ReadMoreText(
                                "${widget.medicaldiscription}",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 13,
                                  color: textcolor_light,
                                ),
                                trimLines: 2,
                                colorClickableText: bluecolor,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'Show more',
                                trimExpandedText: 'Show less',
                                moreStyle: TextStyle(
                                    fontSize: 14,
                                    color: bluecolor,
                                    fontFamily: "medium"),
                              ),
                            ],
                          ),
                        ),
                      ), //medicical disription
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 150,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dose",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 18,
                                  color: textcolor,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 300,
                              ),
                              Text(
                                "${widget.doses}",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 13,
                                  color: textcolor_light,
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 50,
                              ),
                              Text(
                                "Uses",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 18,
                                  color: textcolor,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 300,
                              ),
                              Text(
                                "${widget.uses}",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 13,
                                  color: textcolor_light,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ), //dose
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 150,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Precautions And Warning",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 18,
                                  color: textcolor,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 300,
                              ),
                              Text(
                                "${widget.precaution_and_warning}",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 13,
                                  color: textcolor_light,
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 50,
                              ),
                              Text(
                                "Side Effects",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 18,
                                  color: textcolor,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 300,
                              ),
                              Text(
                                "${widget.sideeffect}",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 13,
                                  color: textcolor_light,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ), //Precautions And Warning
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Future addtocart(String productname, String price, String company) async {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));
    await FirebaseFirestore.instance.collection('medicine_cart').add({
      'company': company,
      'price': price,
      'productname': productname,
      'imageurl': widget.image_url
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
}

/* padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height / 60,
                    left: MediaQuery.of(context).size.height / 60,
                    right: MediaQuery.of(context).size.height / 60),*/
