import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../const.dart';
import '../main.dart';

class labtest_final extends StatefulWidget {
  List cart_items;
  double totalamount;
  double discount;
  labtest_final(
      {Key? key,
      required this.cart_items,
      required this.totalamount,
      required this.discount})
      : super(key: key);

  @override
  State<labtest_final> createState() => _labtest_finalState();
}

class _labtest_finalState extends State<labtest_final> {
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
  Color redcoloe = Color(0xffFE2D54);
  final _formKey = GlobalKey<FormState>();
  final patientname = TextEditingController();
  final patientphone = TextEditingController();
  final patientpincode = TextEditingController();
  int days = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 70),
                      Padding(
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
                                "Details",
                                style: TextStyle(
                                  fontFamily: 'semibold',
                                  fontSize: 24,
                                  color: textcolor,
                                ),
                              ),
                            ),
                            Text(""),
                          ],
                        ),
                      ), //toprow
                      SizedBox(height: MediaQuery.of(context).size.height / 70),
                      //searchbar
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 135),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height / 60,
                      top: MediaQuery.of(context).size.height / 60,
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 60,
                    ),
                    child: Text(
                      "Products",
                      style: TextStyle(
                        fontFamily: 'semibold',
                        fontSize: 21,
                        color: textcolor,
                      ),
                    ),
                  ),
                ),
                Container(
                  //  width: MediaQuery.of(context).size.width,
                  color: white,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: widget.cart_items.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 80,
                              left: MediaQuery.of(context).size.height / 60,
                              right: MediaQuery.of(context).size.height / 60,
                              bottom: MediaQuery.of(context).size.height / 80),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.4,
                                    child: Text(
                                      "${widget.cart_items[index].name}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: textcolor,
                                          fontFamily: "medium"),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.4,
                                    child: Text(
                                      "${widget.cart_items[index].packages}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: bluecolor,
                                          fontFamily: "medium"),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.4,
                                    child: Text(
                                      "Patients - ${widget.cart_items[index].quantity}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: textcolor,
                                          fontFamily: "medium"),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 135),
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
                            fontSize: 18,
                            color: redcoloe,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "${(widget.discount).toStringAsFixed(2)}%",
                              style: TextStyle(
                                fontFamily: 'semibold',
                                fontSize: 18,
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
                SizedBox(height: MediaQuery.of(context).size.height / 135),
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
                              fontSize: 21,
                              color: textcolor,
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 65),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 2.2,
                                decoration: BoxDecoration(
                                  color: background,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  controller: patientname,
                                  keyboardType: TextInputType.name,
                                  style: TextStyle(color: textcolor),
                                  textAlign: TextAlign.left,
                                  decoration: kTextFieldDecoration.copyWith(
                                      contentPadding: EdgeInsets.only(left: 20),
                                      hintText: "Name"),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (firstname) =>
                                      firstname != null && firstname.length! < 1
                                          ? 'First name cannot be empty'
                                          : null,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2.2,
                                decoration: BoxDecoration(
                                  color: background,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  onChanged: (value) {},
                                  controller: patientpincode,
                                  keyboardType: TextInputType.phone,
                                  style: TextStyle(color: textcolor),
                                  textAlign: TextAlign.left,
                                  decoration: kTextFieldDecoration.copyWith(
                                      contentPadding: EdgeInsets.only(left: 20),
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
                              height: MediaQuery.of(context).size.height / 80),
                          Container(
                            //  width: MediaQuery.of(context).size.width / 2.4,
                            decoration: BoxDecoration(
                              color: background,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              onChanged: (value) {},
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
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
                            fontFamily: 'medium',
                            fontSize: 16,
                            color: textcolor,
                          ),
                        ),
                        Text(
                          "₹${widget.totalamount}",
                          style: TextStyle(
                            fontFamily: 'medium',
                            fontSize: 14,
                            color: textcolor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 38.0,
                      child: MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            book_lab();
                          }
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
                            constraints: BoxConstraints(maxWidth: 150.0),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future book_lab() async {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));

    for (int i = 0; i < widget.cart_items.length; i++) {
      await FirebaseFirestore.instance
          .collection('/ORDERS')
          .doc('Lab_orders')
          .collection("oders")
          .doc("${DateTime.now()}")
          .collection(uid)
          .add({
        'Package Name - ${i + 1}': widget.cart_items[i].packages,
        'Test Name - ${i + 1}': widget.cart_items[i].name,
        'Test Price - ${i + 1}': widget.cart_items[i].price,
        'Patient - ${i + 1}': widget.cart_items[i].quantity,
        'Customer Name': patientname.text,
        'phone': patientphone.text,
        'pincode': patientpincode.text,
        'Total Amount': widget.totalamount
      });

      await FirebaseFirestore.instance
          .collection('Order_Status')
          .doc(uid)
          .collection("oders")
          .add({
        "Cutprice": widget.cart_items[i].cutprice,
        "Info": widget.cart_items[i].packages,
        "Name": widget.cart_items[i].name,
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
}
