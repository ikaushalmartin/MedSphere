import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/dashboard.dart';

import '../Models/cart_model.dart';
import '../const.dart';

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
  Color background = Color(0xffD9D9D9);
  Color white = Color(0xffffffff);
  Color search_bg = Color(0x1A000000);

  List<cartmodel> cartdata = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_cart_data();
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
                                          Image.network(
                                            "${cartdata[index].url}",
                                            scale: 8,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${cartdata[index].productname}",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: textcolor,
                                                    fontFamily: "medium"),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    180,
                                              ),
                                              Text(
                                                "MRP ₹${cartdata[index].price}",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: textcolor_light,
                                                    fontFamily: "medium"),
                                              )
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
                                                    60,
                                              ),
                                              Container(
                                                width: 60,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: light_red,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
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
                  ],
                )),
              ),
            ],
          ),
        ));
  }

  fetch_cart_data() async {
    var _cart_data =
        await FirebaseFirestore.instance.collection('medicine_cart').get();
    map_cart_data(_cart_data);
  }

  map_cart_data(QuerySnapshot<Map<String, dynamic>> data) {
    var cart_item = data.docs
        .map((item) => cartmodel(
            id: item.id,
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
}
