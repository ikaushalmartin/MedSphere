import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: background,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  height: MediaQuery.of(context).size.height / 7,
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
                  child: Column(
                    children: [],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
