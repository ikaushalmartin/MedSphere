import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/dashboard.dart';

import '../Medicine/medicine_final.dart';
import '../Models/cart_model.dart';
import '../Models/lab_cart_model.dart';
import '../Models/popularcategories_model.dart';
import '../const.dart';
import '../main.dart';

class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
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

  List<cartmodel> cartdata = [];
  List<Item> deliveryandminval_list = [];
  int selected_tab = 1;
  int selected_quantity = 1;
  double totalmrp = 0;
  double discountedprice = 0;
  double deliverycharges = 0;
  double totalamount = 0;
  double discountpercentage = 0;
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
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
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
                                itemCount: cartdata.length,
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
                                                CircleAvatar(
                                                  backgroundColor: white,
                                                  radius: 30,
                                                  child: Image.network(
                                                    "${cartdata[index].url}",
                                                    scale: 8,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            20),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      child: Text(
                                                        "${cartdata[index].productname}",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: textcolor,
                                                            fontFamily:
                                                                "medium"),
                                                      ),
                                                    ),
                                                    Text(
                                                      "${cartdata[index].company}",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: bluecolor,
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
                                                GestureDetector(
                                                  onTap: () {
                                                    deleteDocument(
                                                        cartdata[index].id);
                                                    deliverycharges_updation();
                                                  },
                                                  child: Icon(
                                                    Icons
                                                        .delete_outline_outlined,
                                                    color: redcolor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      100,
                                                ),
                                                Container(
                                                  width: 100,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                      color: search_bg,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border: Border.all(
                                                          color:
                                                              textcolor_light2,
                                                          width: 1.1)),
                                                  child: MaterialButton(
                                                    onPressed: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: Text(
                                                              'Quantity',
                                                              style: TextStyle(
                                                                  color:
                                                                      textcolor,
                                                                  fontFamily:
                                                                      "medium"),
                                                            ),
                                                            content: Container(
                                                              height: 500,
                                                              width: 1,
                                                              child: ListView
                                                                  .builder(
                                                                physics:
                                                                    const BouncingScrollPhysics(),
                                                                shrinkWrap:
                                                                    true,
                                                                itemCount: 30,
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
                                                                            cartdata[index].id);

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
                                                      'Qty - ${cartdata[index].quantity}',
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
                                      "₹${discountedprice.toStringAsFixed(2)}",
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
                                  height:
                                      MediaQuery.of(context).size.height / 60,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Discount Percentage :",
                                      style: TextStyle(
                                        fontFamily: 'medium',
                                        fontSize: 14,
                                        color: redcoloe,
                                      ),
                                    ),
                                    Text(
                                      "%${discountpercentage.toStringAsFixed(2)}",
                                      style: TextStyle(
                                        fontFamily: 'medium',
                                        fontSize: 14,
                                        color: redcoloe,
                                      ),
                                    ),
                                  ],
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
                                      "₹${(discountedprice + deliverycharges).toStringAsFixed(2)}",
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
                            "₹${(discountedprice + deliverycharges).toStringAsFixed(2)}",
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
                          onPressed: () {
                            Get.to(
                                () => medicine_final(
                                      discount: discountpercentage,
                                      cart_items: cartdata,
                                      totalamount:
                                          discountedprice + deliverycharges,
                                    ),
                                transition: Transition.rightToLeft);
                          },
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
        .collection('medicine_cart')
        .doc(uid)
        .collection("cartitems")
        .doc(documentId)
        .update({
      "quantity": selected_quantity,
    });

    fetch_cart_data();
    fetch_discount_and_minimumvalue();
    Navigator.of(context).pop();
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
        .collection('medicine_cart')
        .doc(uid)
        .collection("cartitems")
        .doc(documentId)
        .delete();

    fetch_cart_data();
    fetch_discount_and_minimumvalue();
    Navigator.of(context).pop();
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
            price: item['price'],
            quantity: item['quantity']))
        .toList();

    setState(() {
      cartdata = cart_item;
    });
    calculateamount();
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
    deliverycharges_updation();
    return deliveryandminval_list;
  }

  calculateamount() async {
    totalmrp = 0;
    discountedprice = 0;

    for (int i = 0; i < cartdata.length; i++) {
      totalmrp = totalmrp +
          (double.parse(cartdata[i].cutprice) * cartdata[i].quantity);
      discountedprice = discountedprice +
          (double.parse(cartdata[i].price) * cartdata[i].quantity);
    }
    deliverycharges_updation();
    print("-------------------------${deliveryandminval_list[1].name}");
  }

  deliverycharges_updation() {
    if (discountedprice >= double.parse(deliveryandminval_list[3].name)) {
      deliverycharges = 0;
    } else {
      deliverycharges = double.parse(deliveryandminval_list[0].name);
    }
    discountpercentage = (totalmrp - discountedprice) / totalmrp * 100;
    setState(() {
      discountpercentage;
      deliverycharges;
    });
  }
}
