import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../const.dart';

class adddeliveryaddress extends StatefulWidget {
  const adddeliveryaddress({Key? key}) : super(key: key);

  @override
  State<adddeliveryaddress> createState() => _adddeliveryaddressState();
}

class _adddeliveryaddressState extends State<adddeliveryaddress> {
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

  final name = TextEditingController();
  final phone = TextEditingController();
  final pincode = TextEditingController();
  final address = TextEditingController();

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
              Column(
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
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: textcolor,
                            ),
                          ), //toprow

                          SizedBox(
                              height: MediaQuery.of(context).size.height / 100),
                          //searchbar
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 35),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 60,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3,
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
                          top: MediaQuery.of(context).size.height / 60,
                          left: MediaQuery.of(context).size.height / 60,
                          right: MediaQuery.of(context).size.height / 60,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Address",
                              style: TextStyle(
                                fontFamily: 'semibold',
                                fontSize: 21,
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
                                      MediaQuery.of(context).size.width / 2.4,
                                  decoration: BoxDecoration(
                                    color: background,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    onChanged: (value) {},
                                    controller: name,
                                    keyboardType: TextInputType.name,
                                    style: TextStyle(color: textcolor),
                                    textAlign: TextAlign.left,
                                    decoration: kTextFieldDecoration.copyWith(
                                        contentPadding:
                                            EdgeInsets.only(left: 20),
                                        hintText: "First Name"),
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
                                      MediaQuery.of(context).size.width / 2.4,
                                  decoration: BoxDecoration(
                                    color: background,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    onChanged: (value) {},
                                    controller: pincode,
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                onChanged: (value) {},
                                controller: phone,
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
                              //width: MediaQuery.of(context).size.width / 2.4,
                              decoration: BoxDecoration(
                                color: background,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                onChanged: (value) {},
                                controller: address,
                                keyboardType: TextInputType.name,
                                style: TextStyle(color: textcolor),
                                textAlign: TextAlign.left,
                                decoration: kTextFieldDecoration.copyWith(
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText:
                                        "House Number, Building and Locality"),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (firstname) => firstname != null &&
                                        firstname.length! < 2
                                    ? 'Address cannot be empty cannot be empty'
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
                    child: MaterialButton(
                      onPressed: () {
                        Get.to(() => adddeliveryaddress(),
                            transition: Transition.rightToLeft);
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
                          constraints: BoxConstraints(maxWidth: 280.0),
                          alignment: Alignment.center,
                          child: Text(
                            "Check Out",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white, fontFamily: "medium"),
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
