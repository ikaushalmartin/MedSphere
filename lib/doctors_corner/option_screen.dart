import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'categories/injectable.dart';
import 'categories/medicine.dart';
import 'categories/surgicalInstruments.dart';
import 'categories/surgicals.dart';

class option_screen extends StatefulWidget {
  String itemname;
  option_screen({Key? key, required this.itemname}) : super(key: key);

  @override
  State<option_screen> createState() => _option_screenState();
}

class _option_screenState extends State<option_screen> {
  Color bluecolor_bg = Color(0xffDAE1FF);
  Color textcolor = Color(0xD9181818);
  Color textcolor_light = Color(0x99181818);
  Color bluecolor = Color(0xff5093FE);
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                                "Categories",
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
                                onPressed: () {},
                                icon: Icon(Icons.shopping_cart_outlined),
                                color: textcolor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ), //toprow

                    SizedBox(height: MediaQuery.of(context).size.height / 70),
                    //searchbar
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 150,
              ),
              Expanded(
                child: Container(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 5.5,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(
                                () => medicine_for_doctors_corner(
                                      itemname: widget.itemname,
                                      category: 'Medicine',
                                    ),
                                transition: Transition.rightToLeft);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: white,
                            child: Padding(
                              padding: EdgeInsets.only(
                                //top: MediaQuery.of(context).size.height / 60,
                                left: MediaQuery.of(context).size.height / 60,
                                right: MediaQuery.of(context).size.height / 60,
                                bottom: MediaQuery.of(context).size.height / 60,
                              ),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        150,
                                  ),
                                  Divider(
                                    color: background,
                                    thickness: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Medicine",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'semibold',
                                              fontSize: 19,
                                              color: textcolor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                                () => injectables(
                                      itemname: widget.itemname,
                                      category: 'Injectable',
                                    ),
                                transition: Transition.rightToLeft);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: white,
                            child: Padding(
                              padding: EdgeInsets.only(
                                //top: MediaQuery.of(context).size.height / 60,
                                left: MediaQuery.of(context).size.height / 60,
                                right: MediaQuery.of(context).size.height / 60,
                                bottom: MediaQuery.of(context).size.height / 60,
                              ),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        150,
                                  ),
                                  Divider(
                                    color: background,
                                    thickness: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Injectable",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'semibold',
                                              fontSize: 19,
                                              color: textcolor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                                () => doctors_surgicals(
                                      itemname: widget.itemname,
                                      category: 'Surgicals',
                                    ),
                                transition: Transition.rightToLeft);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: white,
                            child: Padding(
                              padding: EdgeInsets.only(
                                //top: MediaQuery.of(context).size.height / 60,
                                left: MediaQuery.of(context).size.height / 60,
                                right: MediaQuery.of(context).size.height / 60,
                                bottom: MediaQuery.of(context).size.height / 60,
                              ),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        150,
                                  ),
                                  Divider(
                                    color: background,
                                    thickness: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Surgicals",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'semibold',
                                              fontSize: 19,
                                              color: textcolor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                                () => surgical_instruments(
                                      itemname: widget.itemname,
                                      category: 'Surgical Instruments',
                                    ),
                                transition: Transition.rightToLeft);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: white,
                            child: Padding(
                              padding: EdgeInsets.only(
                                //top: MediaQuery.of(context).size.height / 60,
                                left: MediaQuery.of(context).size.height / 60,
                                right: MediaQuery.of(context).size.height / 60,
                                bottom: MediaQuery.of(context).size.height / 60,
                              ),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        150,
                                  ),
                                  Divider(
                                    color: background,
                                    thickness: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Surgical Instruments",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'semibold',
                                              fontSize: 19,
                                              color: textcolor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
