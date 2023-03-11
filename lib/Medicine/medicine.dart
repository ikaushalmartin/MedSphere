import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:medicineapp2/dashboard.dart';

import '../const.dart';
import '../orderbyprescription.dart';

class medicine extends StatefulWidget {
  const medicine({Key? key}) : super(key: key);

  @override
  State<medicine> createState() => _medicineState();
}

class _medicineState extends State<medicine> {
  Color grey = Color(0xffececef);

  Color prescription_bg = Color(0xffdae1ff);

  Color heading_bluecolor = Color(0xff001849);
  Color textcolor = Color(0xff001849);
  Color textcolor_white = Colors.white;
  Color bluecolor = Color(0xff6588E6);
  Color redcolor = Color(0xffE46473);
  Color yellowcolor = Color(0xffF9BF80);
  Color background = Color(0xffF4F3FB);
  Color light_red = Color(0xffdae1ff);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: background,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: background,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 50,
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
                              FirebaseAuth.instance.signOut();
                            },
                            child: CircleAvatar(
                              child: Image.asset("images/1.png"),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Order Medicine",
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
                              onPressed: () {},
                              icon: Icon(Icons.shopping_cart_outlined),
                              color: textcolor,
                            ),
                          )
                        ],
                      ), //toprow
                      SizedBox(height: MediaQuery.of(context).size.height / 80),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.35,
                              decoration: BoxDecoration(
                                color: light_red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextField(
                                onChanged: (value) {},
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(color: textcolor),
                                textAlign: TextAlign.left,
                                decoration: kTextFieldDecoration.copyWith(
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: "Search"),
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width / 6,
                                decoration: BoxDecoration(
                                  color: light_red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Theme(
                                  data: ThemeData(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.search),
                                    color: textcolor,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 70),
                      //searchbar
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    // height: MediaQuery.of(context).size.height / 1.451,
                    //  width: MediaQuery.of(context).size.width,
                    // color: Colors.white,
                    child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: background,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 60,
                          left: MediaQuery.of(context).size.height / 60,
                          right: MediaQuery.of(context).size.height / 60,
                          bottom: MediaQuery.of(context).size.height / 60,
                        ),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: prescription_bg,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: bluecolor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: orderbyprescription_medicinepage(),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 40,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(11.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                70),
                                        Text(
                                          "1. Upload a photo of your prescription",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: 'regular',
                                            fontSize: 16,
                                            color: textcolor,
                                          ),
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                80),
                                        Text(
                                          "2. Add delivery address and place the order",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: 'regular',
                                            fontSize: 16,
                                            color: textcolor,
                                          ),
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                80),
                                        Text(
                                          "3. We will call you to confirm the medicine",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: 'regular',
                                            fontSize: 16,
                                            color: textcolor,
                                          ),
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                80),
                                        Text(
                                          "Whoo! Now sit back! we will deliver medicine to your doorstep",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: 'regular',
                                            fontSize: 16,
                                            color: textcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 40),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 7,
                              decoration: BoxDecoration(
                                color: redcolor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: callus_to_place_order(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),
        ));
  }
}
