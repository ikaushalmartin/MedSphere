import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medicineapp2/dashboard.dart';

import '../const.dart';
import '../orderbyprescription.dart';

class medicine extends StatefulWidget {
  const medicine({Key? key}) : super(key: key);

  @override
  State<medicine> createState() => _medicineState();
}

class _medicineState extends State<medicine> {
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color textcolor_white = Color(0xffACAEBA);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);

  Color prescription_bg = Color(0xffF7FDFF);

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
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 200),
                  child: Row(
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
                      Text(
                        "Order Medicine",
                        style: TextStyle(
                          fontFamily: 'medium',
                          fontSize: 16,
                          color: textcolor,
                        ),
                      ),
                    ],
                  ), //toprow
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const orderbyprescription_medicinepage(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height / 60,
                  right: MediaQuery.of(context).size.height / 60,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "How it works?",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'medium',
                        fontSize: 16,
                        color: textcolor,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 120),
                    Text(
                      "1. Upload a photo of your prescription",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'regular',
                        fontSize: 14,
                        color: textcolor,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 120),
                    Text(
                      "2. Add delivery address and place the order",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'regular',
                        fontSize: 14,
                        color: textcolor,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 120),
                    Text(
                      "3. We will call you to confirm the medicine",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'regular',
                        fontSize: 14,
                        color: textcolor,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 120),
                    Text(
                      "Whoo! Now sit back! we will deliver medicine to your doorstep",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'regular',
                        fontSize: 14,
                        color: textcolor,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 50),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 8,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: callus_to_place_order(),
              ),
            ],
          ),
        ));
  }
}
