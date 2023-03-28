import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../const.dart';
import '../dashboard.dart';
import '../main.dart';

class medicine_final extends StatefulWidget {
  List cart_items;
  double totalamount;
  double discount;
  medicine_final(
      {Key? key,
      required this.discount,
      required this.cart_items,
      required this.totalamount})
      : super(key: key);

  @override
  State<medicine_final> createState() => _medicine_finalState();
}

class _medicine_finalState extends State<medicine_final> {
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color textcolor_light = Color(0xffACAEBA);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
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
        backgroundColor: background,
        // resizeToAvoidBottomInset: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
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
                                bottom:
                                    MediaQuery.of(context).size.height / 80),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: white,
                                  radius: 30,
                                  child: Image.network(
                                    "${widget.cart_items[index].url}",
                                    scale: 8,
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
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
                                      width: MediaQuery.of(context).size.width /
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
                                      width: MediaQuery.of(context).size.width /
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
                          top: MediaQuery.of(context).size.height / 60,
                          left: MediaQuery.of(context).size.height / 60,
                          right: MediaQuery.of(context).size.height / 60,
                          bottom: MediaQuery.of(context).size.height / 60),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                            EdgeInsets.only(left: 20),
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
                                    enableInteractiveSelection: false,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(7),
                                    ],
                                    onChanged: (value) {},
                                    controller: patientpincode,
                                    keyboardType: TextInputType.phone,
                                    style: TextStyle(color: textcolor),
                                    textAlign: TextAlign.left,
                                    decoration: kTextFieldDecoration.copyWith(
                                        contentPadding:
                                            EdgeInsets.only(left: 20),
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
                          ],
                        ),
                      ),
                    ),
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
                            fontFamily: 'medium',
                            fontSize: 16,
                            color: textcolor,
                          ),
                        ),
                        Text(
                          "₹${(widget.totalamount).toStringAsFixed(2)}",
                          style: TextStyle(
                            fontFamily: 'medium',
                            fontSize: 14,
                            color: bluecolor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 38.0,
                      child: MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            book_medicine();
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        child: Ink(
                          decoration: BoxDecoration(
                              color: bluecolor,
                              borderRadius: BorderRadius.circular(6)),
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
            )
          ],
        ),
      ),
    );
  }

  Future book_medicine() async {
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
          .doc('Medicine Or Product')
          .collection("oders")
          .doc("${DateTime.now()}")
          .set({
        'Product Name - ${i + 1}': widget.cart_items[i].productname,
        'Product Company - ${i + 1}': widget.cart_items[i].company,
        'Product Price - ${i + 1}': widget.cart_items[i].price,
        'Product Quantity - ${i + 1}': widget.cart_items[i].quantity,
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
        Get.offAll(dashboard(), transition: Transition.leftToRight);
        debugPrint('OnClcik');
      },
      btnOkIcon: Icons.check_circle,
    ).show();
  }
}
