import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../const.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({Key? key}) : super(key: key);

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  Color bluecolor = Color(0xff6588E6);
  Color bluecolor_bg = Color(0xffDAE1FF);
  Color textcolor = Color(0xff1D1D1F);
  Color textcolor_light = Color(0x99181818);
  Color background = Color(0xffF2F1F6);
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
                                "Doctors Corner",
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
                              color: background,
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
                                color: background,
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
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 60,
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                        bottom: MediaQuery.of(context).size.height / 60,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 40,
                              spreadRadius: 3,
                              color: Color(0xffD2D1D5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),
        ));
  }
}
