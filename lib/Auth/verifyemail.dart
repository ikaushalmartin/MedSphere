import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/_http/_io/_file_decoder_io.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medicineapp2/Auth/signup.dart';
import 'package:medicineapp2/dashboard.dart';
import 'package:medicineapp2/onboarding/onboarding.dart';

import '../const.dart';
import '../main.dart';
import 'login.dart';
import 'mobile_verification.dart';

class verifyemail extends StatefulWidget {
  const verifyemail({Key? key}) : super(key: key);

  @override
  State<verifyemail> createState() => _verifyemailState();
}

class _verifyemailState extends State<verifyemail> {
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color textcolor_white = Color(0xffACAEBA);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);

  bool isEmailVerified = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendverification();
      timer =
          Timer.periodic(Duration(seconds: 3), (_) => checkEmailverification());
    }
  }

  Future checkEmailverification() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendverification() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      var verify = SnackBar(
        content: Text("$e"),
        backgroundColor: textcolor,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),
        duration: Duration(milliseconds: 2000),
        behavior: SnackBarBehavior.floating,
      );
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(verify);
      });
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const mobile_verification()
      : Scaffold(
          backgroundColor: bluecolor,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 60,
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 60,
                      bottom: MediaQuery.of(context).size.height / 20),
                  child: Text(
                    "APPNAME",
                    style: TextStyle(
                      fontFamily: 'medium',
                      fontSize: 20,
                      color: white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height / 60,
                    right: MediaQuery.of(context).size.height / 60,
                    bottom: MediaQuery.of(context).size.height / 60,
                  ),
                  child: Text(
                    "Email Verification!",
                    style: TextStyle(
                      fontFamily: 'regular',
                      fontSize: 20,
                      color: white,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: ListView(
                        children: [
                          Text(
                            "We have sent you verification link on your email,\nAlso cross check your spam folder.",
                            style: TextStyle(
                              fontFamily: 'regular',
                              fontSize: 12,
                              color: textcolor,
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 40),
                          Theme(
                            data: ThemeData(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                            ),
                            child: ButtonTheme(
                                child: MaterialButton(
                              onPressed: () {
                                FirebaseAuth.instance.signOut();
                              },
                              elevation: 0,
                              hoverElevation: 0,
                              focusElevation: 0,
                              highlightElevation: 0,
                              minWidth: MediaQuery.of(context).size.width,
                              height: 52,
                              color: bluecolor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                "Sign Out",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: white,
                                    fontFamily: "medium"),
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
}
