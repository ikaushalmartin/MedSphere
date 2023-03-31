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
import '../Models/cart_model2.dart';
import '../Models/lab_cart_model.dart';
import '../Models/popularcategories_model.dart';
import '../const.dart';
import '../main.dart';
import '../product_commonscreen/Common Screen.dart';

class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color textcolor_white = Color(0xffACAEBA);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
  Color redcoloe = Color(0xffFE2D54);

  List<cartmodel> cartdata = [];
  List<cartmodel2> cartdata2 = [];
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
    fetch_cart_data2();
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
                color: white,
                height: MediaQuery.of(context).size.height / 16,
                child: Padding(
                  padding: EdgeInsets.only(
                      // top: MediaQuery.of(context).size.height / 50,
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 200),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: textcolor,
                          size: 20,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height / 60,
                      ),
                      Align(
                        child: Text(
                          "Cart",
                          style: TextStyle(
                            fontFamily: 'medium',
                            fontSize: 16,
                            color: textcolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: white,
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: cartdata.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                        () => product_common_screen(
                                              heading: "Medicine Detail",
                                              image_url: cartdata2[index].url,
                                              name:
                                                  cartdata2[index].productname,
                                              precaution_and_warning:
                                                  cartdata2[index]
                                                      .precaution_and_warning,
                                              sideeffect:
                                                  cartdata2[index].sideeffect,
                                              doses: cartdata2[index].doses,
                                              uses: cartdata2[index].uses,
                                              medicaldiscription:
                                                  cartdata2[index]
                                                      .medicaldiscription,
                                              company: cartdata2[index].company,
                                              cuttopdeals:
                                                  cartdata2[index].cutprice,
                                              price: cartdata2[index].price,
                                              ingredients:
                                                  cartdata2[index].salts,
                                              quantity:
                                                  (cartdata2[index].quantity)
                                                      .toString(),
                                            ),
                                        transition: Transition.rightToLeft);
                                  },
                                  child: Padding(
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
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      child: Text(
                                                        cartdata[index]
                                                            .productname,
                                                        style: TextStyle(
                                                          fontFamily: 'medium',
                                                          fontSize: 12,
                                                          color: textcolor,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      child: Text(
                                                        cartdata[index].company,
                                                        style: TextStyle(
                                                          fontFamily: 'medium',
                                                          fontSize: 12,
                                                          color: bluecolor,
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "₹${cartdata[index].price}    ",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'medium',
                                                            fontSize: 12,
                                                            color: textcolor,
                                                          ),
                                                        ),
                                                        Text(
                                                          "MRP ₹${cartdata[index].cutprice}",
                                                          style: TextStyle(
                                                              fontSize: 12,
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
                                                        cartdata[index].id);
                                                    deliverycharges_updation();
                                                  },
                                                  child: Icon(
                                                    Icons
                                                        .delete_outline_outlined,
                                                    color: redcolor,
                                                    size: 20,
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
                                                    color: background,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                  ),
                                                  child: Theme(
                                                    data: ThemeData(
                                                      splashColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                    ),
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
                                                                        "medium",
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                              content: SizedBox(
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
                                                                            SizedBox(
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          height:
                                                                              50,
                                                                          child:
                                                                              Text('${x + 1}'),
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
                                                            fontSize: 12,
                                                            fontFamily:
                                                                "medium"),
                                                      ),
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
                                  ),
                                );
                              })),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    Container(
                      color: white,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 40,
                            left: MediaQuery.of(context).size.height / 60,
                            right: MediaQuery.of(context).size.height / 50,
                            bottom: MediaQuery.of(context).size.height / 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Check Available Coupons!",
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 16,
                                color: redcoloe,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: textcolor,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
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
                                      fontSize: 13,
                                      color: textcolor,
                                    ),
                                  ),
                                  Text(
                                    "₹$totalmrp",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                      fontSize: 13,
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
                                      fontSize: 13,
                                      color: textcolor,
                                    ),
                                  ),
                                  Text(
                                    "₹${discountedprice.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                      fontSize: 13,
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
                                      fontSize: 13,
                                      color: textcolor,
                                    ),
                                  ),
                                  Text(
                                    "₹$deliverycharges",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                      fontSize: 13,
                                      color: textcolor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 60,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Discount Percentage :",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                      fontSize: 13,
                                      color: redcoloe,
                                    ),
                                  ),
                                  Text(
                                    "%${discountpercentage.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                      fontSize: 13,
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
                                      fontSize: 13,
                                      color: textcolor,
                                    ),
                                  ),
                                  Text(
                                    "₹${(discountedprice + deliverycharges).toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                      fontSize: 13,
                                      color: textcolor,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                color: white,
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                        child: Theme(
                          data: ThemeData(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
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
                            child: Ink(
                              decoration: BoxDecoration(
                                  color: bluecolor,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 200),
                                alignment: Alignment.center,
                                child: Text(
                                  "Add Delivery Address",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "medium"),
                                ),
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
    showDialog(
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));
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
    Navigator.of(context).pop();
    return cartdata;
  }

  fetch_cart_data2() async {
    var _cart_data = await FirebaseFirestore.instance
        .collection('medicine_cart')
        .doc(uid)
        .collection("cartitems")
        .get();
    map_cart_data2(_cart_data);
  }

  map_cart_data2(QuerySnapshot<Map<String, dynamic>> data) {
    var cart_item = data.docs
        .map((item) => cartmodel2(
            id: item.id,
            cutprice: item['cutprice'],
            url: item['imageurl'],
            company: item['company'],
            productname: item['productname'],
            price: item['price'],
            quantity: item['quantity'],
            medicaldiscription: item['Medical_Discription'],
            uses: item['Uses'],
            doses: item['Doses'],
            sideeffect: item['Side_Effect'],
            precaution_and_warning: item['Precaution_and_warning'],
            salts: item['Salts']))
        .toList();

    setState(() {
      cartdata2 = cart_item;
    });
    calculateamount();
    return cartdata2;
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
