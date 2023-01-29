import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/dashboard.dart';

import '../Models/cart_model.dart';
import '../Models/popularcategories_model.dart';
import '../const.dart';
import '../main.dart';

class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  Color bluecolor = Color(0xff5093FE);
  Color bluecolor_bg = Color(0xffDAE1FF);
  Color textcolor = Color(0xD9181818);
  Color textcolor_light = Color(0x99181818);
  Color textcolor_light2 = Color(0x4D181818);
  Color background = Color(0xffD9D9D9);
  Color white = Color(0xffffffff);
  Color search_bg = Color(0x1A000000);

  Color medicine_colour_button_1 = Color(0xff07DAEB);
  Color medicine_colour_button_2 = Color(0xff5093FE);
  Color lab_colour_button_1 = Color(0xffBDC4C9);
  Color lab_colour_button_2 = Color(0x80181818);
  Color doc_colour_button_1 = Color(0xffBDC4C9);
  Color doc_colour_button_2 = Color(0x80181818);
  List<cartmodel> cartdata = [];
  List<Item> deliveryandminval_list = [];
  List quantity = [];
  double totalmrp = 0;
  double discountedprice = 0;
  double deliverycharges = 0;
  double totalamount = 0;
  Timer? timer2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_cart_data();
    fetch_discount_and_minimumvalue();
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
                              "Cart",
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
                      ), //toprow
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 100),
                      //searchbar
                    ],
                  ),
                ),
              ),
              Container(
                color: white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      //  height: 50.0,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            medicine_colour_button_1 = Color(0xff07DAEB);
                            medicine_colour_button_2 = Color(0xff5093FE);

                            lab_colour_button_1 = Color(0xffBDC4C9);
                            lab_colour_button_2 = Color(0x80181818);
                            doc_colour_button_1 = Color(0xffBDC4C9);
                            doc_colour_button_2 = Color(0x80181818);
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  medicine_colour_button_1,
                                  medicine_colour_button_2
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            constraints:
                                BoxConstraints(maxWidth: 90.0, minHeight: 33.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Medicine",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontFamily: "medium"),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      //  height: 50.0,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            medicine_colour_button_1 = Color(0xffBDC4C9);
                            medicine_colour_button_2 = Color(0x80181818);
                            lab_colour_button_1 = Color(0xff07DAEB);
                            lab_colour_button_2 = Color(0xff5093FE);
                            doc_colour_button_1 = Color(0xffBDC4C9);
                            doc_colour_button_2 = Color(0x80181818);
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  lab_colour_button_1,
                                  lab_colour_button_2
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            constraints:
                                BoxConstraints(maxWidth: 90.0, minHeight: 33.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Lab Test",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: white, fontFamily: "medium"),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      //  height: 50.0,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            medicine_colour_button_1 = Color(0xffBDC4C9);
                            medicine_colour_button_2 = Color(0x80181818);
                            lab_colour_button_1 = Color(0xffBDC4C9);
                            lab_colour_button_2 = Color(0x80181818);
                            doc_colour_button_1 = Color(0xff07DAEB);
                            doc_colour_button_2 = Color(0xff5093FE);
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  doc_colour_button_1,
                                  doc_colour_button_2
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            constraints:
                                BoxConstraints(maxWidth: 90.0, minHeight: 33.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Doctor",
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
              Expanded(
                child: Container(
                    child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 150,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: white,
                      child: SizedBox(
                          //height: MediaQuery.of(context).size.height / 5,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: cartdata.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height /
                                          80,
                                      left: MediaQuery.of(context).size.height /
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
                                              Image.network(
                                                "${cartdata[index].url}",
                                                scale: 8,
                                              ),
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      20),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "${cartdata[index].productname}",
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
                                                        "MRP ₹${cartdata[index].price}    ",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: textcolor,
                                                            fontFamily:
                                                                "medium"),
                                                      ),
                                                      Text(
                                                        "₹${cartdata[index].cutprice}",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                            color:
                                                                textcolor_light,
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
                                              Icon(
                                                Icons.delete_outline_outlined,
                                                color: textcolor_light,
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    100,
                                              ),
                                              Container(
                                                width: 40,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: search_bg,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    border: Border.all(
                                                        color: textcolor_light2,
                                                        width: 1.1)),
                                                child: TextField(
                                                    onChanged: (value) {},
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <
                                                        TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly,
                                                      LengthLimitingTextInputFormatter(
                                                          2)
                                                    ],
                                                    style: TextStyle(
                                                        color: textcolor),
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      hintText: 'Qty',
                                                      hintStyle: TextStyle(
                                                          color: Color(
                                                              0x80181818)),
                                                      contentPadding:
                                                          EdgeInsets.all(5),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Color(
                                                                0x33000000),
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20.0)),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Color(
                                                                0x33000000),
                                                            width: 0.2),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20.0)),
                                                      ),
                                                    )),
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
                    Container(
                      color: white,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 80,
                            left: MediaQuery.of(context).size.height / 60,
                            right: MediaQuery.of(context).size.height / 60,
                            bottom: MediaQuery.of(context).size.height / 80),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 18,
                          decoration: BoxDecoration(
                            color: search_bg,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: textcolor_light2,
                              width:
                                  1.1, //                   <--- border width here
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 50,
                                  ),
                                  Image.asset(
                                    "images/discount.png",
                                    scale: 19,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 30,
                                  ),
                                  Text(
                                    "Apply Coupon!",
                                    style: TextStyle(
                                      fontFamily: 'semibold',
                                      fontSize: 16,
                                      color: textcolor_light,
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
                      height: MediaQuery.of(context).size.height / 150,
                    ),
                    Container(
                      color: white,
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 80,
                              left: MediaQuery.of(context).size.height / 60,
                              right: MediaQuery.of(context).size.height / 60,
                              bottom: MediaQuery.of(context).size.height / 80),
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
                                    "Delivery Charges :",
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
                                height: MediaQuery.of(context).size.height / 60,
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
                  ],
                )),
              ),
            ],
          ),
        ));
  }

  fetch_cart_data() async {
    var _cart_data = await FirebaseFirestore.instance
        .collection('medicine_cart')
        .doc(uid)
        .collection("cartitems")
        .get();
    map_cart_data(_cart_data);
  }

  map_cart_data(QuerySnapshot<Map<String, dynamic>> data) {
    var cart_item = data.docs
        .map((item) => cartmodel(
            id: item.id,
            cutprice: item['cutprice'],
            url: item['imageurl'],
            company: item['company'],
            productname: item['productname'],
            price: item['price']))
        .toList();

    setState(() {
      cartdata = cart_item;
    });

    return cartdata;
  }

  fetch_discount_and_minimumvalue() async {
    var _map_deli_min = await FirebaseFirestore.instance
        .collection('deliverycharges and minimum value')
        .get();
    map_deliverychargesandminimumvalue(_map_deli_min);
  }

  map_deliverychargesandminimumvalue(QuerySnapshot<Map<String, dynamic>> data) {
    var deliveryandminval = data.docs
        .map((item) => Item(id: item.id, name: item['amount']))
        .toList();
    setState(() {
      deliveryandminval_list = deliveryandminval;
    });
    calculateamount();
    return deliveryandminval_list;
  }

  calculateamount() async {
    for (int i = 0; i < cartdata.length; i++) {
      totalmrp = totalmrp + double.parse(cartdata[i].cutprice);
      discountedprice = discountedprice + double.parse(cartdata[i].price);
    }

    print("-------------------------${deliveryandminval_list[1].name}");
    if (discountedprice >= double.parse(deliveryandminval_list[1].name)) {
      deliverycharges = 0;
    } else {
      deliverycharges = double.parse(deliveryandminval_list[0].name);
    }
    setState(() {
      deliverycharges;
    });
  }
}
