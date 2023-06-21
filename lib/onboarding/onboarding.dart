import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import '../dashboard.dart';
import 'bottom_option.dart';

class onboarding extends StatefulWidget {
  const onboarding({Key? key}) : super(key: key);

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  late List<Widget> _pages;
  int _activitepage = 0;
  @override
  Widget build(BuildContext context) {
    _pages = [
      Container(
        child: Column(
          children: [
            Image.asset("images/1.png"),
            Text(
              "Home Delivery of Medicine",
              style: TextStyle(
                  fontSize: 20, fontFamily: 'Medium', color: textcolor),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            Text(
              "Your very own Medicine Delivery Companion\nGet your Medicine Anywhere-Anytime",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16, fontFamily: 'regular', color: textcolor),
            ),
          ],
        ),
      ),
      Container(
        child: Column(
          children: [
            Image.asset("images/1.png"),
            Text(
              "Home Delivery of Medicine",
              style: TextStyle(
                  fontSize: 20, fontFamily: 'Medium', color: textcolor),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            Text(
              "Your very own Medicine Delivery Companion\nGet your Medicine Anywhere-Anytime",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16, fontFamily: 'regular', color: textcolor),
            ),
          ],
        ),
      ),
      Container(
        child: Column(
          children: [
            Image.asset("images/1.png"),
            Text(
              "Home Delivery of Medicine",
              style: TextStyle(
                  fontSize: 20, fontFamily: 'Medium', color: textcolor),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            Text(
              "Your very own Medicine Delivery Companion\nGet your Medicine Anywhere-Anytime",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16, fontFamily: 'regular', color: textcolor),
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 40,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "APPNAME",
              style: TextStyle(
                fontFamily: 'Semibold',
                fontSize: 20,
                color: textcolor,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          Expanded(
            child: PageView(
              physics: BouncingScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  _activitepage = value;
                });
              },
              children: _pages,
            ),
          ),
          bottomoption(
            totalpages: _pages.length,
            activepages: _activitepage,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 40,
          ),
        ],
      )),
    );
  }
}
