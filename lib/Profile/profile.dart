import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/Medicine/medicine_forbutton.dart';
import 'package:medicineapp2/lab/labtest.dart';
import 'package:medicineapp2/main.dart';

import 'package:unicons/unicons.dart';

import '../Models/orders.dart';
import 'Order_status.dart';
import '../dashboard.dart';
import '../Search_screen/dashboard_search.dart';
import 'address.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  Color bluecolor_bg = Color(0xffDAE1FF);

  Color textcolor_light = Color(0xffACAEBA);
  Color oncolor = Color(0xff01BDF3);
  Color offcolor = Color(0xffE6E6EC);
  Color button1color = Color(0xff01BDF3);
  Color button2color = Color(0xffE6E6EC);
  Color lightblue = Color(0xff01BDF3);
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);

  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);

  Color bottom1 = Color(0xff575F75);
  Color bottom2 = Color(0xff575F75);
  Color bottom3 = Color(0xff575F75);
  Color bottom4 = Color(0xff575F75);
  Color bottom5 = Color(0xff01BDF3);

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
                color: white,
                height: MediaQuery.of(context).size.height / 16,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 70),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height / 60,
                          right: MediaQuery.of(context).size.height / 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Profile",
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 16,
                              color: textcolor,
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    FirebaseAuth.instance.signOut();
                                    // FirebaseAuth.instance.signOut();
                                  },
                                  child: Icon(
                                    Icons.logout,
                                    color: textcolor,
                                    size: 20,
                                  )),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.height / 80),
                            ],
                          ),
                        ],
                      ),
                    ), //toprow
                    SizedBox(height: MediaQuery.of(context).size.height / 80),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      color: white,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height / 60,
                          right: MediaQuery.of(context).size.height / 60,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 80,
                            ),
                            Text(
                              "Hi! There",
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 22,
                                color: textcolor,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 80,
                            ),
                            Text(
                              "Email : $emailofuser",
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 16,
                                color: textcolor,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 80,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const address(),
                            transition: Transition.rightToLeft);
                      },
                      child: Container(
                          color: white,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 15,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height / 60,
                              right: MediaQuery.of(context).size.height / 60,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Your Address",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 16,
                                  color: textcolor,
                                ),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const order_status(),
                            transition: Transition.rightToLeft);
                      },
                      child: Container(
                          color: white,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 15,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height / 60,
                              right: MediaQuery.of(context).size.height / 60,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Order Status",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 16,
                                  color: textcolor,
                                ),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    Container(
                        color: white,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 15,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height / 60,
                            right: MediaQuery.of(context).size.height / 60,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Terms and Conditions",
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 16,
                                color: textcolor,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 15,
                decoration: BoxDecoration(
                  color: white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.off(() => const medicineforbutton(),
                            transition: Transition.noTransition);
                      },
                      icon: Icon(UniconsLine.capsule),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      color: bottom1,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.off(() => const labtest(),
                            transition: Transition.noTransition);
                      },
                      icon: Icon(UniconsLine.flask),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      color: bottom2,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.off(dashboard(),
                            transition: Transition.noTransition);
                      },
                      icon: Icon(UniconsLine.home_alt),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      color: bottom3,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(() => SearchScreen(),
                            transition: Transition.rightToLeft);
                      },
                      icon: Icon(UniconsLine.search),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      color: bottom4,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(UniconsLine.user),
                      color: bottom5,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
