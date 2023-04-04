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

import 'Models/orders.dart';
import 'dashboard.dart';
import 'Search_screen/dashboard_search.dart';

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

  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);

  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
  List<order> orderd_items = [];
  List<order> orderd_items2 = [];

  Color bottom1 = Color(0xff575F75);
  Color bottom2 = Color(0xff575F75);
  Color bottom3 = Color(0xff575F75);
  Color bottom4 = Color(0xff575F75);
  Color bottom5 = Color(0xff01BDF3);

  bool button1 = true;
  bool button2 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_orders();
    fetch_prescription_data();
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      height: MediaQuery.of(context).size.height / 80,
                    ),
                    Container(
                        color: white,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height / 60,
                              right: MediaQuery.of(context).size.height / 60),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 80,
                              ),
                              Text(
                                "Order Status",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 16,
                                  color: textcolor,
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 80,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ButtonTheme(
                                    child: Center(
                                      child: MaterialButton(
                                        onPressed: () {
                                          setState(() {
                                            button1 = true;
                                            button2 = false;
                                            button1color = oncolor;
                                            button2color = offcolor;
                                          });
                                        },
                                        elevation: 0,
                                        hoverElevation: 0,
                                        focusElevation: 0,
                                        highlightElevation: 0,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                22,
                                        minWidth:
                                            MediaQuery.of(context).size.height /
                                                6,
                                        color: button1color,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: Text(
                                          "Normal Orders",
                                          style: TextStyle(
                                              color: white,
                                              fontFamily: 'medium',
                                              fontSize: 13),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ButtonTheme(
                                    child: Center(
                                      child: MaterialButton(
                                        onPressed: () {
                                          setState(() {
                                            button1 = false;
                                            button2 = true;
                                            button1color = offcolor;
                                            button2color = oncolor;
                                          });
                                        },
                                        elevation: 0,
                                        hoverElevation: 0,
                                        focusElevation: 0,
                                        highlightElevation: 0,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                22,
                                        minWidth:
                                            MediaQuery.of(context).size.height /
                                                6,
                                        color: button2color,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: Text(
                                          "Prescription Orders",
                                          style: TextStyle(
                                              color: white,
                                              fontFamily: 'medium',
                                              fontSize: 13),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 60,
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 80,
                    ),
                    button1 == true
                        ? Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: orderd_items.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).size.height /
                                              60,
                                      left: MediaQuery.of(context).size.height /
                                          60,
                                      right:
                                          MediaQuery.of(context).size.height /
                                              60,
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              10,
                                      decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${orderd_items[index].name}",
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                                fontSize: 16,
                                                color: textcolor,
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  100,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Price: ${orderd_items[index].price}",
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontFamily: 'medium',
                                                        fontSize: 14,
                                                        color: textcolor_light,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              20,
                                                    ),
                                                    Text(
                                                      "MRP: ${orderd_items[index].cutprice}",
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        fontFamily: 'medium',
                                                        fontSize: 14,
                                                        color: textcolor_light,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Status: ",
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontFamily: 'medium',
                                                        fontSize: 14,
                                                        color: textcolor_light,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${orderd_items[index].status}",
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontFamily: 'medium',
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xffEA7D6B),
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
                                  );
                                }),
                          )
                        : Expanded(
                            //height: MediaQuery.of(context).size.height / 1.7,
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 3.4 / 2.6,
                                  mainAxisSpacing: 0,
                                  crossAxisCount: 2,
                                ),
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: orderd_items2.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).size.height /
                                              60,
                                      left: MediaQuery.of(context).size.height /
                                          60,
                                      right:
                                          MediaQuery.of(context).size.height /
                                              60,
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5,
                                      decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text('Prescription'),
                                                  content: Image.network(
                                                    "${orderd_items2[index].company}",
                                                    scale: 2,
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.network(
                                                "${orderd_items2[index].company}",
                                                scale: 8,
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    60,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Status: ",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontFamily: 'medium',
                                                      fontSize: 16,
                                                      color: textcolor_light,
                                                    ),
                                                  ),
                                                  Text(
                                                    "${orderd_items2[index].status}",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontFamily: 'medium',
                                                      fontSize: 16,
                                                      color: Color(0xffEA7D6B),
                                                    ),
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
                          )
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

  fetch_prescription_data() async {
    var doctor_details = await FirebaseFirestore.instance
        .collection('/ORDERS')
        .doc('/prescription_orders')
        .collection(uid)
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
    map_precription_details(doctor_details);
  }

  map_precription_details(QuerySnapshot<Map<String, dynamic>> data) {
    var _doctor_deatils_list = data.docs
        .map((item) => order(
              id: item.id,
              cutprice: item['Cutprice'],
              company: item['Url'],
              name: item['Coustmer Name'],
              price: item['phone'],
              status: item['status'],
              quantity: int.parse(item['pincode']),
            ))
        .toList();
    Navigator.of(context).pop();
    setState(() {
      orderd_items2 = _doctor_deatils_list;
    });
  }
}
