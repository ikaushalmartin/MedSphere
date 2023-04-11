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
  Color bluecolor = Color(0xff2c64e3);
  Color textcolor = Color(0xff273238);
  Color grey = Color(0xffececef);

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
            child: Stack(
              children: [
                Positioned(
                  top: MediaQuery.of(context).size.height / 50,
                  left: 20,
                  right: 0,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "APPNAME",
                      style: TextStyle(
                        fontFamily: 'bold',
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 7.8,
                  left: 20,
                  right: 0,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Email Verification",
                      style: TextStyle(
                        fontFamily: 'medium',
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 3.2,
                  bottom: 0,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "We sent you a code",
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 32,
                                color: Color(0xff273238),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 130),
                            Text(
                              "We have sent you code on email. The code expires shortly, so please enter it soon!",
                              style: TextStyle(
                                fontFamily: 'light',
                                fontSize: 14,
                                color: textcolor,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 30),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 70),
                            ButtonTheme(
                                child: MaterialButton(
                              onPressed: () {},
                              elevation: 0,
                              hoverElevation: 0,
                              focusElevation: 0,
                              highlightElevation: 0,
                              minWidth: MediaQuery.of(context).size.width,
                              height: 55,
                              color: bluecolor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Text(
                                "Verify Email ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'medium',
                                    fontSize: 18),
                              ),
                            )),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 30),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Can't find your code? Check your spam folder!",
                                style: TextStyle(
                                  fontFamily: 'light',
                                  fontSize: 15,
                                  color: textcolor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 3.2,
                  bottom: 0,
                  child: MaterialButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    color: Colors.red,
                    height: 200,
                    minWidth: 200,
                  ),
                ),
              ],
            ),
          ));
}
