import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Models/cart_model.dart';
import '../Models/cart_model2.dart';
import '../Models/popularcategories_model.dart';
import '../const.dart';
import '../dashboard.dart';
import '../main.dart';
import '../surgical/surgical_finalscreen.dart';
import '../surgical/surgical_productscreen.dart';

class surgical_cart extends StatefulWidget {
  const surgical_cart({Key? key}) : super(key: key);

  @override
  State<surgical_cart> createState() => _surgical_cartState();
}

class _surgical_cartState extends State<surgical_cart> {
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
                          //height: MediaQuery.of(context).size.height / 5,
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
                                        () => surgical_productscreen(
                                            imageurl: cartdata2[index].url,
                                            category: cartdata2[index].doses,
                                            company: cartdata2[index].company,
                                            cutprice: cartdata2[index].cutprice,
                                            description: cartdata2[index]
                                                .medicaldiscription,
                                            name: cartdata2[index].productname,
                                            price: cartdata2[index].price,
                                            size: cartdata2[index].sideeffect,
                                            sterile: cartdata2[index].salts,
                                            use: cartdata2[index].uses),
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
                                                          "MRP₹${cartdata[index].cutprice}",
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
                                                            20),
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
                                                                  fontSize: 14,
                                                                  fontFamily:
                                                                      "medium"),
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
                                                          fontSize: 12,
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
                                    "₹$discountedprice",
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
                                height:
                                    MediaQuery.of(context).size.height / 100,
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
                                    "%${(discountpercentage).toStringAsFixed(2)}",
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
                                thickness: 0.5,
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
                                    "₹${discountedprice + deliverycharges}",
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
                            "₹${discountedprice + deliverycharges}",
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
                                  () => surgical_final(
                                        cart_items: cartdata,
                                        totalamount:
                                            (discountedprice + deliverycharges),
                                        discount: discountpercentage,
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
        .collection('CARTS')
        .doc(uid)
        .collection("Surgical Cart")
        .doc(documentId)
        .update({
      "Quantity": selected_quantity,
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
        .collection('CARTS')
        .doc(uid)
        .collection("Surgical Cart")
        .doc(documentId)
        .delete();

    fetch_cart_data();
    fetch_discount_and_minimumvalue();
    Navigator.of(context).pop();
  }

  fetch_cart_data() async {
    var _cart_data = await FirebaseFirestore.instance
        .collection('CARTS')
        .doc(uid)
        .collection("Surgical Cart")
        .get();
    map_cart_data(_cart_data);
  }

  fetch_cart_data2() async {
    var _cart_data = await FirebaseFirestore.instance
        .collection('CARTS')
        .doc(uid)
        .collection("Surgical Cart")
        .get();
    map_cart_data2(_cart_data);
  }

  map_cart_data(QuerySnapshot<Map<String, dynamic>> data) {
    var cart_item = data.docs
        .map((item) => cartmodel(
            id: item.id,
            cutprice: item['Cutprice'],
            url: item['Imageurl'],
            company: item['Company'],
            productname: item['Name'],
            price: item['Price'],
            quantity: item['Quantity']))
        .toList();

    setState(() {
      cartdata = cart_item;
    });
    calculateamount();
    return cartdata;
  }

  map_cart_data2(QuerySnapshot<Map<String, dynamic>> data) {
    var cart_item = data.docs
        .map((item) => cartmodel2(
            id: item.id,
            cutprice: item['Cutprice'],
            url: item['Imageurl'],
            company: item['Company'],
            productname: item['Name'],
            price: item['Price'],
            medicaldiscription: item['Description'],
            uses: item['Use'],
            doses: item['Category'],
            sideeffect: item['Size'],
            precaution_and_warning: item['Precaution_and_warning'],
            salts: item['Sterlie'],
            quantity: item['Quantity']))
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
    if (discountedprice >= double.parse(deliveryandminval_list[5].name)) {
      deliverycharges = 0;
    } else {
      deliverycharges = double.parse(deliveryandminval_list[4].name);
    }
    discountpercentage = (totalmrp - discountedprice) / totalmrp * 100;

    setState(() {
      discountpercentage;
      deliverycharges;
    });
  }
}
