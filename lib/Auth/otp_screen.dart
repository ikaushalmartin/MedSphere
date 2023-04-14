import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medicineapp2/Auth/verifyemail.dart';
import 'package:medicineapp2/dashboard.dart';
import 'package:medicineapp2/main.dart';
import 'package:pinput/pinput.dart';

class otpscreen extends StatefulWidget {
  otpscreen({Key? key, required this.verification_id}) : super(key: key);
  var verification_id;
  @override
  State<otpscreen> createState() => _otpscreenState();
}

class _otpscreenState extends State<otpscreen> {
  Color bluecolor = Color(0xff2c64e3);
  Color textcolor = Color(0xff273238);
  Color grey = Color(0xffececef);

  var verification_code;

  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
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
                          Center(
                            child: Pinput(
                              length: 6,
                              androidSmsAutofillMethod:
                                  AndroidSmsAutofillMethod.none,
                              // controller: pinController,
                              defaultPinTheme: defaultPinTheme,
                              focusedPinTheme: focusedPinTheme,
                              submittedPinTheme: submittedPinTheme,
                              onChanged: (s) {
                                verification_code = s;
                              },
                              pinputAutovalidateMode:
                                  PinputAutovalidateMode.onSubmit,
                              showCursor: true,
                              onCompleted: (pin) => print(pin),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 70),
                          ButtonTheme(
                              child: MaterialButton(
                            onPressed: () async {
                              try {
                                PhoneAuthCredential credential =
                                    PhoneAuthProvider.credential(
                                  verificationId: widget.verification_id,
                                  smsCode: verification_code,
                                );

                                final user = FirebaseAuth.instance.currentUser!;
                                user.linkWithCredential(credential);

                                Navigator.of(context).pop();
                                Get.to(() => const dashboard(),
                                    transition: Transition.rightToLeft);
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
                              "Verify Code",
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
            ],
          ),
        ));
  }
}
