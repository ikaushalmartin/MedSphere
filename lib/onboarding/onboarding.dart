import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../dashboard.dart';
import 'bottom_option.dart';

class onboarding extends StatefulWidget {
  const onboarding({Key? key}) : super(key: key);

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
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
                  fontSize: 27,
                  fontFamily: 'semibold',
                  color: Color(0xff273238)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 70,
            ),
            Text(
              "Your very own Medicine Delivery Companion",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'regular',
                  color: Color(0xff273238)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 500,
            ),
            Text(
              "Get your Medicine Anywhere-Anytime",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'regular',
                  color: Color(0xff273238)),
            ),
          ],
        ),
      ),
      Container(
        child: Column(
          children: [
            Image.asset("images/1.png"),
            Text(
              "Online Consultation",
              style: TextStyle(
                  fontSize: 27,
                  fontFamily: 'semibold',
                  color: Color(0xff273238)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 70,
            ),
            Text(
              "Doctors are in touch 24/7",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'regular',
                  color: Color(0xff273238)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 500,
            ),
            Text(
              "Consult with right one! Anywhere-Anytime",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'regular',
                  color: Color(0xff273238)),
            ),
          ],
        ),
      ),
      Container(
        child: Column(
          children: [
            Image.asset("images/1.png"),
            Text(
              "Book Lab Appointment",
              style: TextStyle(
                  fontSize: 27,
                  fontFamily: 'semibold',
                  color: Color(0xff273238)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 70,
            ),
            Text(
              "No need of waiting in long queue",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'regular',
                  color: Color(0xff273238)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 500,
            ),
            Text(
              "Book your Lab Test Anywhere-Anytime",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'regular',
                  color: Color(0xff273238)),
            ),
          ],
        ),
      ),
      Container(
        child: Column(
          children: [
            Image.asset("images/1.png"),
            Text(
              "Need Pharma Machine?",
              style: TextStyle(
                  fontSize: 27,
                  fontFamily: 'semibold',
                  color: Color(0xff273238)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 70,
            ),
            Text(
              "Gonna delivery at your door-step",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'regular',
                  color: Color(0xff273238)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 500,
            ),
            Text(
              "Get your Meachine Anywhere-Anytime",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'regular',
                  color: Color(0xff273238)),
            ),
          ],
        ),
      ),
      Container(
        child: Column(
          children: [
            Image.asset("images/1.png"),
            Text(
              "oops! Emergency?",
              style: TextStyle(
                  fontSize: 27,
                  fontFamily: 'semibold',
                  color: Color(0xff273238)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 70,
            ),
            Text(
              "Don't worry!",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'regular',
                  color: Color(0xff273238)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 500,
            ),
            Text(
              "We are with you Everytime-Everywhere",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'regular',
                  color: Color(0xff273238)),
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      /* floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
            },
            backgroundColor: Color(0xff014cc4),
            child: const Icon(Icons.navigate_next),
          ),*/
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "APPNAME",
                style: TextStyle(
                  fontFamily: 'bold',
                  fontSize: 24,
                  color: Color(0xff2c64e3),
                ),
              ),
            ),
          ),
          Positioned(
              top: 100,
              left: 0,
              right: 0,
              bottom: 0,
              child: PageView(
                physics: BouncingScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    _activitepage = value;
                  });
                },
                children: _pages,
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 30,
              child: bottomoption(
                totalpages: _pages.length,
                activepages: _activitepage,
              )),
        ],
      )),
    );
  }
}
