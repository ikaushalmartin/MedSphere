import 'dart:core';

import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Models/address_model.dart';
import '../const.dart';

import '../dashboard.dart';
import '../main.dart';

class surgical_final extends StatefulWidget {
  List cart_items;
  double totalamount;
  double discount;
  surgical_final(
      {Key? key,
      required this.cart_items,
      required this.totalamount,
      required this.discount})
      : super(key: key);

  @override
  State<surgical_final> createState() => _surgical_finalState();
}

class _surgical_finalState extends State<surgical_final> {
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color textcolor_light = Color(0xffACAEBA);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
  Color redcoloe = Color(0xffFE2D54);

  final _formKey = GlobalKey<FormState>();
  TextEditingController patientname = TextEditingController();
  TextEditingController patientphone = TextEditingController();
  TextEditingController patientpincode = TextEditingController();
  TextEditingController patientaddress = TextEditingController();
  int days = 1;

  List<address_model> user_address = [];

  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_user_address();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: background,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          "Details",
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
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 100),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height / 100,
                          top: MediaQuery.of(context).size.height / 100,
                          left: MediaQuery.of(context).size.height / 60,
                          right: MediaQuery.of(context).size.height / 60,
                        ),
                        child: Text(
                          "Products",
                          style: TextStyle(
                            fontFamily: 'medium',
                            fontSize: 16,
                            color: textcolor,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: white,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: widget.cart_items.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 80,
                                  left: MediaQuery.of(context).size.height / 60,
                                  right:
                                      MediaQuery.of(context).size.height / 60,
                                  bottom:
                                      MediaQuery.of(context).size.height / 80),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: white,
                                    radius: 30,
                                    child: Image.network(
                                      "${widget.cart_items[index].url}",
                                    ),
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.4,
                                        child: Text(
                                          "${widget.cart_items[index].productname}",
                                          style: TextStyle(
                                            fontFamily: 'medium',
                                            fontSize: 12,
                                            color: textcolor,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.4,
                                        child: Text(
                                          "${widget.cart_items[index].company}",
                                          style: TextStyle(
                                            fontFamily: 'medium',
                                            fontSize: 12,
                                            color: bluecolor,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.4,
                                        child: Text(
                                          "Quantity - ${widget.cart_items[index].quantity}",
                                          style: TextStyle(
                                            fontFamily: 'medium',
                                            fontSize: 12,
                                            color: textcolor_light,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 100),
                    Container(
                      color: white,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 40,
                            left: MediaQuery.of(context).size.height / 60,
                            right: MediaQuery.of(context).size.height / 60,
                            bottom: MediaQuery.of(context).size.height / 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Discount!",
                              style: TextStyle(
                                fontFamily: 'semibold',
                                fontSize: 16,
                                color: redcoloe,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "${(widget.discount).toStringAsFixed(2)}%",
                                  style: TextStyle(
                                    fontFamily: 'semibold',
                                    fontSize: 16,
                                    color: redcoloe,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 50,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 100),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height / 3.5,
                      decoration: BoxDecoration(
                        color: white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 60,
                          left: MediaQuery.of(context).size.height / 60,
                          right: MediaQuery.of(context).size.height / 60,
                          bottom: MediaQuery.of(context).size.height / 60,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your Details",
                                style: TextStyle(
                                  fontFamily: 'semibold',
                                  fontSize: 16,
                                  color: textcolor,
                                ),
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 65),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.2,
                                    decoration: BoxDecoration(
                                      color: background,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: TextFormField(
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(30),
                                      ],
                                      enableInteractiveSelection: false,
                                      controller: patientname,
                                      keyboardType: TextInputType.name,
                                      style: TextStyle(color: textcolor),
                                      textAlign: TextAlign.left,
                                      decoration: kTextFieldDecoration.copyWith(
                                          contentPadding:
                                              const EdgeInsets.only(left: 20),
                                          hintText: "Name"),
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (firstname) =>
                                          firstname != null &&
                                                  firstname.length! < 1
                                              ? 'First name cannot be empty'
                                              : null,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.2,
                                    decoration: BoxDecoration(
                                      color: background,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: TextFormField(
                                      onChanged: (value) {},
                                      controller: patientpincode,
                                      keyboardType: TextInputType.phone,
                                      style: TextStyle(color: textcolor),
                                      textAlign: TextAlign.left,
                                      enableInteractiveSelection: false,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(7),
                                      ],
                                      decoration: kTextFieldDecoration.copyWith(
                                          contentPadding:
                                              const EdgeInsets.only(left: 20),
                                          hintText: "Pincode"),
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (phone) =>
                                          phone != null && phone.length < 6
                                              ? 'Enter a valid pincode'
                                              : null,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 80),
                              Container(
                                //  width: MediaQuery.of(context).size.width / 2.4,
                                decoration: BoxDecoration(
                                  color: background,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: TextFormField(
                                  onChanged: (value) {},
                                  enableInteractiveSelection: false,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(12),
                                  ],
                                  controller: patientphone,
                                  keyboardType: TextInputType.phone,
                                  style: TextStyle(color: textcolor),
                                  textAlign: TextAlign.left,
                                  decoration: kTextFieldDecoration.copyWith(
                                      contentPadding: EdgeInsets.only(left: 20),
                                      hintText: "Phone"),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (phone) =>
                                      phone != null && phone.length < 10
                                          ? 'Enter a valid phone number'
                                          : null,
                                ),
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 80),
                              Container(
                                //  width: MediaQuery.of(context).size.width / 2.4,
                                decoration: BoxDecoration(
                                  color: background,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: TextFormField(
                                  onChanged: (value) {},
                                  enableInteractiveSelection: false,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(60),
                                  ],
                                  controller: patientaddress,
                                  keyboardType: TextInputType.name,
                                  style: TextStyle(color: textcolor),
                                  textAlign: TextAlign.left,
                                  decoration: kTextFieldDecoration.copyWith(
                                      contentPadding: EdgeInsets.only(left: 20),
                                      hintText: "Address"),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (phone) =>
                                      phone != null && phone.length < 10
                                          ? 'Enter a valid address'
                                          : null,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 100),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                      ),
                      child: Text(
                        "Saved Address",
                        style: TextStyle(
                          fontFamily: 'medium',
                          fontSize: 16,
                          color: textcolor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                      ),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: user_address.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).size.height / 60,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  patientname.text = user_address[index].name;
                                  patientpincode.text =
                                      user_address[index].pincode;
                                  patientphone.text = user_address[index].phone;
                                  patientaddress.text =
                                      user_address[index].useraddress;
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Padding(
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
                                              80,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${user_address[index].name}",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: 'medium',
                                            fontSize: 16,
                                            color: textcolor,
                                          ),
                                        ),
                                        Text(
                                          "Phone : ${user_address[index].phone}",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: 'medium',
                                            fontSize: 14,
                                            color: textcolor_light,
                                          ),
                                        ),
                                        Text(
                                          "${user_address[index].useraddress}",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: 'regular',
                                            fontSize: 14,
                                            color: textcolor_light,
                                          ),
                                        ),
                                        Text(
                                          "${user_address[index].pincode}",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: 'regular',
                                            fontSize: 14,
                                            color: textcolor_light,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Container(
                color: white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 15,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total Payable",
                            style: TextStyle(
                              fontFamily: 'regular',
                              fontSize: 14,
                              color: textcolor,
                            ),
                          ),
                          Text(
                            "₹${widget.totalamount}",
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 14,
                              color: bluecolor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 38.0,
                        child: Theme(
                          data: ThemeData(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => Center(
                                        child: LoadingAnimationWidget.waveDots(
                                          color: Color(0xff273238),
                                          size: 80,
                                        ),
                                      ));
                              if (_formKey.currentState!.validate()) {
                                book_surgicals();
                              } else {
                                Navigator.of(context).pop();
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0)),
                            child: Ink(
                              decoration: BoxDecoration(
                                  color: bluecolor,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 150.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Order",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
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
          )),
    );
  }

  Future book_surgicals() async {
    for (int i = 0; i < widget.cart_items.length; i++) {
      await FirebaseFirestore.instance
          .collection('/ORDERS')
          .doc('Surgical_orders')
          .collection("oders")
          .doc("${DateTime.now()} - ${i + 1}")
          .set({
        'Product Name': widget.cart_items[i].productname,
        'Product Company': widget.cart_items[i].company,
        'Product Price': widget.cart_items[i].price,
        'Product Quantity': widget.cart_items[i].quantity,
        'Customer Name': patientname.text,
        'phone': patientphone.text,
        'pincode': patientpincode.text,
        'Total Amount': widget.totalamount,
      });

      await FirebaseFirestore.instance
          .collection('Order_Status')
          .doc(uid)
          .collection("oders")
          .add({
        "Cutprice": widget.cart_items[i].cutprice,
        "Info": widget.cart_items[i].company,
        "Name": widget.cart_items[i].productname,
        "Price": widget.cart_items[i].price,
        "Status": "Pending",
        "Quantity": widget.cart_items[i].quantity
      });
    }

    Navigator.of(context).pop();
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      headerAnimationLoop: false,
      dialogType: DialogType.success,
      title: 'Success',
      desc: 'Got Your Details!\nWill Get Back To You Soon!!',
      btnOkOnPress: () {
        debugPrint('OnClcik');
      },
      btnOkIcon: Icons.check_circle,
    )..show();
  }

  Future book_surgicals_for_doctors(String imageurl) async {
    for (int i = 0; i < widget.cart_items.length; i++) {
      await FirebaseFirestore.instance
          .collection('/ORDERS')
          .doc('Surgical_orders')
          .collection("oders")
          .doc("${DateTime.now()} - ${i + 1}")
          .collection(uid)
          .add({
        'Product Name': widget.cart_items[i].productname,
        'Product Company': widget.cart_items[i].company,
        'Product Price': widget.cart_items[i].price,
        'Product Quantity': widget.cart_items[i].quantity,
        'Customer Name': patientname.text,
        'phone': patientphone.text,
        'pincode': patientpincode.text,
        'Total Amount': widget.totalamount,
        'Identity': imageurl
      });

      await FirebaseFirestore.instance
          .collection('Order_Status')
          .doc(uid)
          .collection("oders")
          .add({
        "Cutprice": widget.cart_items[i].cutprice,
        "Info": widget.cart_items[i].company,
        "Name": widget.cart_items[i].productname,
        "Price": widget.cart_items[i].price,
        "Status": "Pending",
        "Quantity": widget.cart_items[i].quantity
      });
    }

    Navigator.of(context).pop();
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      headerAnimationLoop: false,
      dialogType: DialogType.success,
      title: 'Success',
      desc: 'Got Your Details!\nWill Get Back To You Soon!!',
      btnOkOnPress: () {
        Get.offAll(const dashboard(), transition: Transition.leftToRight);
        debugPrint('OnClcik');
      },
      btnOkIcon: Icons.check_circle,
    )..show();
  }

  fetch_user_address() async {
    var address_var = await FirebaseFirestore.instance
        .collection('/Saved_address/$uid/Saved Addesses')
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
    map_rental_details(address_var);
  }

  map_rental_details(QuerySnapshot<Map<String, dynamic>> data) {
    var _doctor_deatils_list = data.docs
        .map((item) => address_model(
              id: item.id,
              name: item['Customer Name'],
              useraddress: item['address'],
              phone: item['phone'],
              pincode: item['pincode'],
            ))
        .toList();

    setState(() {
      user_address = _doctor_deatils_list;
    });
    Navigator.of(context).pop();
  }
}
