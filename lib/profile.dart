import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/main.dart';

import 'package:unicons/unicons.dart';

import 'Models/orders.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  Color bluecolor_bg = Color(0xffDAE1FF);

  Color textcolor_light = Color(0x99181818);

  Color search_bg = Color(0x1A000000);
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color textcolor_white = Color(0xff42474e);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
  List<order> orderd_items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_orders();
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
                color: white,
                height: MediaQuery.of(context).size.height / 16,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 70),
                    Padding(
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
                                    // FirebaseAuth.instance.signOut();
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: textcolor,
                                    size: 20,
                                  )),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.height / 80),
                              Text(
                                "Profile",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 16,
                                  color: textcolor,
                                ),
                              ),
                            ],
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
                              "Hey! $emailofuser",
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 16,
                                color: textcolor,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 80,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: orderd_items.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                color: white,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    //top: MediaQuery.of(context).size.height / 60,
                                    left:
                                        MediaQuery.of(context).size.height / 60,
                                    right:
                                        MediaQuery.of(context).size.height / 60,
                                    bottom:
                                        MediaQuery.of(context).size.height / 60,
                                  ),
                                  child: Column(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                150,
                                      ),
                                      Divider(
                                        color: background,
                                        thickness: 2,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "${orderd_items[index].name}",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontFamily: 'semibold',
                                                  fontSize: 19,
                                                  color: textcolor,
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    350,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "${orderd_items[index].price}",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          fontFamily: 'medium',
                                                          fontSize: 16,
                                                          color:
                                                              textcolor_light,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            15,
                                                      ),
                                                      Text(
                                                        "MRP${orderd_items[index].cutprice}",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          fontFamily: 'medium',
                                                          fontSize: 16,
                                                          color:
                                                              textcolor_light,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    "${orderd_items[index].status}",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontFamily: 'medium',
                                                      fontSize: 16,
                                                      color: textcolor_light,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
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
                      onPressed: () {},
                      icon: Icon(UniconsLine.capsule),
                      color: textcolor,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(UniconsLine.flask),
                      color: textcolor,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(UniconsLine.estate),
                      color: textcolor,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(UniconsLine.ambulance),
                      color: textcolor,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(UniconsLine.book_medical),
                      color: textcolor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  fetch_orders() async {
    var doctor_details = await FirebaseFirestore.instance
        .collection('Order_Status')
        .doc(uid)
        .collection('oders')
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
    map_rental_details(doctor_details);
  }

  map_rental_details(QuerySnapshot<Map<String, dynamic>> data) {
    var _doctor_deatils_list = data.docs
        .map((item) => order(
              id: item.id,
              cutprice: item['Cutprice'],
              company: item['Info'],
              name: item['Name'],
              price: item['Price'],
              status: item['Status'],
              quantity: item['Quantity'],
            ))
        .toList();
    Navigator.of(context).pop();
    setState(() {
      orderd_items = _doctor_deatils_list;
    });
  }
}
