import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:readmore/readmore.dart';

import '../buy and cart/cart.dart';

class labtest_commonscreen extends StatefulWidget {
  labtest_commonscreen(
      {Key? key,
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
  Color textcolor = Color(0xD9181818);
  Color textcolor_light = Color(0x99181818);
  Color bluecolor = Color(0xff5093FE);
  Color white = Color(0xffffffff);

  Color background = Color(0xffD9D9D9);

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
              ),
              Container(
                color: background,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.175,
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
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 60,
                            bottom: MediaQuery.of(context).size.height / 60,
                            left: MediaQuery.of(context).size.height / 20,
                            right: MediaQuery.of(context).size.height / 20),
                        color: white,
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
                              height: MediaQuery.of(context).size.height / 100,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: Text(
                                "${widget.packagesinclude}...",
                                style: TextStyle(
                                  fontFamily: 'regular',
                                  fontSize: 13,
                                  color: textcolor_light,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 70,
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
                                          "₹${widget.price}",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontFamily: 'medium',
                                            fontSize: 14,
                                            color: textcolor_light,
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
                                        color: textcolor_light,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  //  height: 50.0,
                                  child: MaterialButton(
                                    onPressed: () {},
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(80.0)),
                                    padding: EdgeInsets.all(0.0),
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 150,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 60,
                            bottom: MediaQuery.of(context).size.height / 60,
                            left: MediaQuery.of(context).size.height / 60,
                            right: MediaQuery.of(context).size.height / 60),
                        color: white,
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
                                  width: MediaQuery.of(context).size.width / 70,
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
                                  width: MediaQuery.of(context).size.width / 15,
                                ),
                                Text(
                                  "${widget.sampletype}",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: textcolor_light,
                                      fontFamily: "medium"),
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
                                  size: 8,
                                  color: bluecolor,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 70,
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
                                  width: MediaQuery.of(context).size.width / 15,
                                ),
                                Text("${widget.fastingrequired}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: textcolor_light,
                                        fontFamily: "medium"))
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 100,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 8,
                                  color: bluecolor,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 70,
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
                                  width: MediaQuery.of(context).size.width / 15,
                                ),
                                Text("${widget.tubetype}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: textcolor_light,
                                        fontFamily: "medium"))
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
                                      size: 8,
                                      color: bluecolor,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
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
                                  width: MediaQuery.of(context).size.width / 15,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.9,
                                  child: ReadMoreText(
                                    "${widget.packagesinclude} ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: textcolor_light,
                                        fontFamily: "medium"),
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
                                      size: 8,
                                      color: bluecolor,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
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
                                  height:
                                      MediaQuery.of(context).size.height / 120,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: ReadMoreText(
                                    "${widget.description} ",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: textcolor_light,
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
              )
            ],
          ),
        ));
  }
}
