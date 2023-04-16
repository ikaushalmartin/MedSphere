import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color textcolor_white = Color(0xffACAEBA);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final phone2 = TextEditingController();
  var phone;

  int phone_verified = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "APPNAME",
                      style: TextStyle(
                        fontFamily: 'medium',
                        fontSize: 20,
                        color: white,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          FirebaseAuth.instance.signOut();
                        },
                        child: Icon(
                          Icons.logout,
                          color: white,
                          size: 20,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height / 60,
                  right: MediaQuery.of(context).size.height / 60,
                  bottom: MediaQuery.of(context).size.height / 60,
                ),
                child: Text(
                  "Phone Verification!",
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
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Text(
                            "We will send you 6 digit OTP on your phone number.\nDon't forget to check your spam folder.",
                            style: TextStyle(
                              fontFamily: 'regular',
                              fontSize: 12,
                              color: textcolor,
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 40),
                          Container(
                            decoration: BoxDecoration(
                                color: background,
                                borderRadius: BorderRadius.circular(6)),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "+91",
                                  style:
                                      TextStyle(fontSize: 16, color: textcolor),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "|",
                                  style:
                                      TextStyle(fontSize: 25, color: textcolor),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: TextFormField(
                                  onChanged: (value) {
                                    phone = value;
                                  },
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  enableInteractiveSelection: false,
                                  controller: phone2,
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                      hintStyle: TextStyle(
                                          color: Color(0xff575F75),
                                          fontSize: 13),
                                      border: InputBorder.none,
                                      hintText: "Phone Number"),
                                  validator: (phonenumberval) =>
                                      phonenumberval != null &&
                                              phonenumberval.length != 10
                                          ? 'Enter a valid number'
                                          : null,
                                ))
                              ],
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
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) => Center(
                                              child: LoadingAnimationWidget
                                                  .waveDots(
                                                color: Color(0xff273238),
                                                size: 80,
                                              ),
                                            ));
                                    await FirebaseAuth.instance
                                        .verifyPhoneNumber(
                                      phoneNumber: '+91 $phone',
                                      verificationCompleted:
                                          (PhoneAuthCredential credential) {},
                                      verificationFailed:
                                          (FirebaseAuthException e) {},
                                      codeSent: (String verificationId,
                                          int? resendToken) {
                                        Get.to(
                                            () => otpscreen(
                                                  verification_id:
                                                      verificationId,
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
                                          borderRadius:
                                              BorderRadius.circular(1)),
                                      duration: Duration(milliseconds: 2000),
                                      behavior: SnackBarBehavior.floating,
                                    );
                                    setState(() {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(othersnackbar);
                                    });
                                  }
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
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 40),
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
