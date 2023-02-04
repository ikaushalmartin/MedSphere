import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/dashboard.dart';

import '../Models/cart_model.dart';
import '../Models/lab_cart_model.dart';
import '../Models/popularcategories_model.dart';
import '../const.dart';
import '../main.dart';

List<lab_cartmodel> lab_cartdata = [];

class lab_cart extends StatefulWidget {
  const lab_cart({Key? key}) : super(key: key);

  @override
  State<lab_cart> createState() => _lab_cartState();
}

class _lab_cartState extends State<lab_cart> {
  Color bluecolor = Color(0xff007AFF);
  Color redcoloe = Color(0xffFE2D54);
  Color textcolor_light2 = Color(0x4D181818);
  Color search_bg = Color(0xffF2F1F6);
  Color heading_bluecolor_bg = Color(0xD9181818);
  Color textcolor = Color(0xff1D1D1F);
  Color textcolor_white = Color(0xff949494);
  Color textcolor_light = Color(0x4D181818);
  Color bluecolor_bg = Color(0x1A000000);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF2F1F6);

  List<Item> _deliveryandminval_list = [];
  int selected_tab = 1;
  int selected_quantity = 1;
  double totalmrp = 0;
  double discountedprice = 0;
  double deliverycharges = 0;
  double totalamount = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_lab_cart_data();
    fetch_discount_and_minimumvalueforlab();
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
                      // top: MediaQuery.of(context).size.height / 50,
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
                          "Lab Cart",
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
                            Get.offAll(() => const dashboard(),
                                transition: Transition.rightToLeft);
                          },
                          icon: Icon(Icons.home_outlined),
                          color: textcolor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 35,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        //  top: MediaQuery.of(context).size.height / 60,
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                        // bottom: MediaQuery.of(context).size.height / 60,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
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
                        child: SizedBox(
                            //height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: lab_cartdata.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height /
                                                80,
                                        left:
                                            MediaQuery.of(context).size.height /
                                                60,
                                        right:
                                            MediaQuery.of(context).size.height /
                                                60,
                                        bottom:
                                            MediaQuery.of(context).size.height /
                                                80),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "${lab_cartdata[index].packages}",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: textcolor,
                                                          fontFamily:
                                                              "semibold"),
                                                    ),
                                                    SizedBox(
                                                      height: 12,
                                                    ),
                                                    Text(
                                                      "${lab_cartdata[index].name}",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: textcolor,
                                                          fontFamily: "medium"),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "MRP ₹${lab_cartdata[index].price}    ",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: textcolor,
                                                              fontFamily:
                                                                  "medium"),
                                                        ),
                                                        Text(
                                                          "₹${lab_cartdata[index].cutprice}",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                              color:
                                                                  textcolor_white,
                                                              fontFamily:
                                                                  "medium"),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    deleteDocument(
                                                        lab_cartdata[index].id);
                                                    deliverycharges_updationforlab();
                                                  },
                                                  child: Icon(
                                                    Icons
                                                        .delete_outline_outlined,
                                                    color: textcolor_white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      100,
                                                ),
                                                Container(
                                                  width: 130,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                      color: search_bg,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border: Border.all(
                                                          color:
                                                              textcolor_white,
                                                          width: 1.1)),
                                                  child: MaterialButton(
                                                    onPressed: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: Text(
                                                              'Patients',
                                                              style: TextStyle(
                                                                  color:
                                                                      textcolor,
                                                                  fontFamily:
                                                                      "medium"),
                                                            ),
                                                            content: Container(
                                                              height: 350,
                                                              width: 1,
                                                              child: ListView
                                                                  .builder(
                                                                physics:
                                                                    const BouncingScrollPhysics(),
                                                                shrinkWrap:
                                                                    true,
                                                                itemCount: 6,
                                                                itemBuilder:
                                                                    (BuildContext
                                                                            context,
                                                                        int x) {
                                                                  return ListTile(
                                                                    title:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        selected_quantity =
                                                                            x + 1;
                                                                        updateDocument(
                                                                            lab_cartdata[index].id);

                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        height:
                                                                            50,
                                                                        child: Text(
                                                                            '${x + 1}'),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      'Patients - ${lab_cartdata[index].quantity}',
                                                      style: TextStyle(
                                                          color: textcolor,
                                                          fontFamily: "medium"),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          color: textcolor,
                                          thickness: 0.2,
                                        )
                                      ],
                                    ),
                                  );
                                })),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 35,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                      ),
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
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 40,
                              left: MediaQuery.of(context).size.height / 60,
                              right: MediaQuery.of(context).size.height / 60,
                              bottom: MediaQuery.of(context).size.height / 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Check Available Coupons!",
                                    style: TextStyle(
                                      fontFamily: 'semibold',
                                      fontSize: 18,
                                      color: redcoloe,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: textcolor,
                                      size: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 50,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 35,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                      ),
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
                        child: Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 80,
                                left: MediaQuery.of(context).size.height / 60,
                                right: MediaQuery.of(context).size.height / 60,
                                bottom:
                                    MediaQuery.of(context).size.height / 80),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total MRP :",
                                      style: TextStyle(
                                        fontFamily: 'medium',
                                        fontSize: 14,
                                        color: textcolor,
                                      ),
                                    ),
                                    Text(
                                      "₹$totalmrp",
                                      style: TextStyle(
                                        fontFamily: 'medium',
                                        fontSize: 14,
                                        color: textcolor,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 100,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Discounted Price :",
                                      style: TextStyle(
                                        fontFamily: 'medium',
                                        fontSize: 14,
                                        color: textcolor,
                                      ),
                                    ),
                                    Text(
                                      "₹$discountedprice",
                                      style: TextStyle(
                                        fontFamily: 'medium',
                                        fontSize: 14,
                                        color: textcolor,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 100,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Addition Charges :",
                                      style: TextStyle(
                                        fontFamily: 'medium',
                                        fontSize: 14,
                                        color: textcolor,
                                      ),
                                    ),
                                    Text(
                                      "₹$deliverycharges",
                                      style: TextStyle(
                                        fontFamily: 'medium',
                                        fontSize: 14,
                                        color: textcolor,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 60,
                                ),
                                Divider(
                                  color: textcolor,
                                  thickness: 0.2,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Amount To Be Paid :",
                                      style: TextStyle(
                                        fontFamily: 'medium',
                                        fontSize: 14,
                                        color: textcolor,
                                      ),
                                    ),
                                    Text(
                                      "₹${discountedprice + deliverycharges}",
                                      style: TextStyle(
                                        fontFamily: 'medium',
                                        fontSize: 14,
                                        color: textcolor,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 35,
                    ),
                  ],
                ),
              ),
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
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 13,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width / 80,
                      left: MediaQuery.of(context).size.width / 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Amount",
                            style: TextStyle(
                              fontFamily: 'regular',
                              fontSize: 16,
                              color: textcolor,
                            ),
                          ),
                          Text(
                            "₹${discountedprice + deliverycharges}",
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 16,
                              color: bluecolor,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 20,
                        child: MaterialButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          child: Ink(
                            decoration: BoxDecoration(
                                color: bluecolor,
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 200),
                              alignment: Alignment.center,
                              child: Text(
                                "Add Delivery Address",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontFamily: "medium"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void updateDocument(String documentId) async {
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
        .doc(documentId)
        .update({
      "quantity": selected_quantity,
    });

    fetch_lab_cart_data();
    fetch_discount_and_minimumvalueforlab();
    Navigator.of(context).pop();
  }

  void fetch_lab_cart_data() async {
    var _cart_data = await FirebaseFirestore.instance
        .collection('lab_cart')
        .doc(uid)
        .collection("lab_cartitems")
        .get();
    map_lab_cart_data(_cart_data);
  }

  void deleteDocument(String documentId) async {
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
        .doc(documentId)
        .delete();

    fetch_lab_cart_data();
    fetch_discount_and_minimumvalueforlab();
    Navigator.of(context).pop();
  }

  map_lab_cart_data(QuerySnapshot<Map<String, dynamic>> data) {
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
      lab_cartdata = cart_item;
    });
    calculateamountforlab();
    return lab_cartdata;
  }

  fetch_discount_and_minimumvalueforlab() async {
    var _map_deli_min = await FirebaseFirestore.instance
        .collection('deliverycharges and minimum value')
        .get();
    map_deliverychargesandminimumvalueforlab(_map_deli_min);
  }

  map_deliverychargesandminimumvalueforlab(
      QuerySnapshot<Map<String, dynamic>> data) {
    var deliveryandminval = data.docs
        .map((item) => Item(id: item.id, name: item['amount']))
        .toList();
    setState(() {
      _deliveryandminval_list = deliveryandminval;
    });
    deliverycharges_updationforlab();
    return _deliveryandminval_list;
  }

  calculateamountforlab() async {
    totalmrp = 0;
    discountedprice = 0;

    for (int i = 0; i < lab_cartdata.length; i++) {
      totalmrp = totalmrp +
          (double.parse(lab_cartdata[i].cutprice) * lab_cartdata[i].quantity);
      discountedprice = discountedprice +
          (double.parse(lab_cartdata[i].price) * lab_cartdata[i].quantity);
    }
    deliverycharges_updationforlab();
  }

  deliverycharges_updationforlab() {
    if (discountedprice >= double.parse(_deliveryandminval_list[2].name)) {
      deliverycharges = 0;
    } else {
      deliverycharges = double.parse(_deliveryandminval_list[1].name);
    }
    setState(() {
      deliverycharges;
    });
  }
}
