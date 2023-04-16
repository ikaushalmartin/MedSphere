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

import 'login.dart';

class otpscreen extends StatefulWidget {
  otpscreen({Key? key, required this.verification_id}) : super(key: key);
  var verification_id;
  @override
  State<otpscreen> createState() => _otpscreenState();
}

class _otpscreenState extends State<otpscreen> {
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color textcolor_white = Color(0xffACAEBA);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);

  var verification_code;
  bool isphoneverified = false;
  final FirebaseAuth auth = FirebaseAuth.instance;

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
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: white,
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height / 60,
                    ),
                    Text(
                      "APPNAME",
                      style: TextStyle(
                        fontFamily: 'medium',
                        fontSize: 20,
                        color: white,
                      ),
                    ),
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
                  "Phone Verification",
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
                  height: MediaQuery.of(context).size.height / 1.3,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "6 digit OTP has sent on your mobile number.\nThe code will expires shortly, so please enter it soon!",
                          style: TextStyle(
                            fontFamily: 'regular',
                            fontSize: 12,
                            color: textcolor,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 40),
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
                            height: MediaQuery.of(context).size.height / 40),
                        Theme(
                          data: ThemeData(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          child: ButtonTheme(
                            child: MaterialButton(
                              onPressed: () async {
                                try {
                                  PhoneAuthCredential credential =
                                      PhoneAuthProvider.credential(
                                    verificationId: widget.verification_id,
                                    smsCode: verification_code,
                                  );

                                  final user =
                                      FirebaseAuth.instance.currentUser!;
                                  await user.linkWithCredential(
                                      credential); // <-- Add await keyword here
                                  await FirebaseAuth.instance.currentUser!
                                      .reload();
                                  uid = user?.uid ?? uid;
                                  emailofuser = user?.email ?? emailofuser;
                                  phoneofuser =
                                      user?.phoneNumber ?? phoneofuser;

                                  Get.offAll(const dashboard());
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
                              child: Text(
                                "Verify Code",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: white,
                                    fontFamily: "medium"),
                              ),
                            ),
                          ),
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
}

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
