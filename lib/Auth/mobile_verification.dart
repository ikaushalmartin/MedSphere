import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/Auth/verifyemail.dart';
import 'package:medicineapp2/dashboard.dart';

import '../main.dart';
import 'otp_screen.dart';

class mobile_verification extends StatefulWidget {
  const mobile_verification({Key? key}) : super(key: key);

  @override
  State<mobile_verification> createState() => _mobile_verificationState();
}

class _mobile_verificationState extends State<mobile_verification> {
  Color bluecolor = Color(0xff2c64e3);
  Color textcolor = Color(0xff273238);
  Color grey = Color(0xffececef);
  var phone;
  int phone_verified = 0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (!snapshot.hasData) {
          // If the user is not authenticated, show the phone verification screen
          return _buildPhoneVerificationScreen();
        } else {
          // If the user is authenticated, check if their phone credential is linked with their email credential
          final user = snapshot.data!;
          if (user.emailVerified && user.phoneNumber?.isNotEmpty == true) {
            return const dashboard();
          } else if (user.emailVerified) {
            // If the user's phone is not linked with their email and their email is verified, show the phone verification screen
            return _buildPhoneVerificationScreen();
          } else {
            // If the user's email is not verified, show the verify email screen
            return const verifyemail();
          }
        }
      },
    );
  }

  Widget _buildPhoneVerificationScreen() {
    return Scaffold(
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
                    "Phone Verification",
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
                            "We will send you a code",
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 32,
                              color: Color(0xff273238),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 130),
                          Text(
                            "We will send you code on phone number. The code will expires shortly, so please enter it soon!",
                            style: TextStyle(
                              fontFamily: 'light',
                              fontSize: 14,
                              color: textcolor,
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 30),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(6)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "+91",
                                  style:
                                      TextStyle(fontSize: 18, color: textcolor),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "|",
                                  style: TextStyle(
                                      fontSize: 32, color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: TextField(
                                  onChanged: (value) {
                                    phone = value;
                                  },
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Phone Number"),
                                ))
                              ],
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 70),
                          ButtonTheme(
                              child: MaterialButton(
                            onPressed: () async {
                              try {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) => Center(
                                          child:
                                              LoadingAnimationWidget.waveDots(
                                            color: Color(0xff273238),
                                            size: 80,
                                          ),
                                        ));
                                await FirebaseAuth.instance.verifyPhoneNumber(
                                  phoneNumber: '+91 $phone',
                                  verificationCompleted:
                                      (PhoneAuthCredential credential) {},
                                  verificationFailed:
                                      (FirebaseAuthException e) {},
                                  codeSent: (String verificationId,
                                      int? resendToken) {
                                    Get.to(
                                        () => otpscreen(
                                              verification_id: verificationId,
                                            ),
                                        transition: Transition.rightToLeft);
                                  },
                                  codeAutoRetrievalTimeout:
                                      (String verificationId) {},
                                );
                                Navigator.of(context).pop();
                              } catch (e) {
                                var othersnackbar = SnackBar(
                                  content: Text("${e}"),
                                  backgroundColor: textcolor,
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(1)),
                                  duration: Duration(milliseconds: 2000),
                                  behavior: SnackBarBehavior.floating,
                                );
                                setState(() {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(othersnackbar);
                                });
                              }
                            },
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
                              "Send the code",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'medium',
                                  fontSize: 18),
                            ),
                          )),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 30),
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
}
