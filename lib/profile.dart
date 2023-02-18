import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'Models/orders.dart';
import 'buy and cart/cart.dart';
import 'main.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  Color bluecolor_bg = Color(0xffDAE1FF);
  Color textcolor = Color(0xD9181818);
  Color textcolor_light = Color(0x99181818);
  Color bluecolor = Color(0xff5093FE);
  Color background = Color(0xffD9D9D9);
  Color white = Color(0xffffffff);
  Color search_bg = Color(0x1A000000);

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                                "Your Orders",
                                style: TextStyle(
                                  fontFamily: 'semibold',
                                  fontSize: 24,
                                  color: textcolor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ), //toprow

                    SizedBox(height: MediaQuery.of(context).size.height / 70),
                    //searchbar
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 150,
              ),
              Container(
                color: white,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 50,
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 200,
                    ),
                    child: Text(
                      "Order Status",
                      style: TextStyle(
                        fontFamily: 'semibold',
                        fontSize: 20,
                        color: textcolor,
                      ),
                    )),
              ),
              Expanded(
                child: Container(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 5.5,
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
                                left: MediaQuery.of(context).size.height / 60,
                                right: MediaQuery.of(context).size.height / 60,
                                bottom: MediaQuery.of(context).size.height / 60,
                              ),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        150,
                                  ),
                                  Divider(
                                    color: background,
                                    thickness: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(10),
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "${orderd_items[index].price}",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontFamily: 'medium',
                                                      fontSize: 16,
                                                      color: textcolor_light,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            15,
                                                  ),
                                                  Text(
                                                    "MRP${orderd_items[index].cutprice}",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      fontFamily: 'medium',
                                                      fontSize: 16,
                                                      color: textcolor_light,
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
