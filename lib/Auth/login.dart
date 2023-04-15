import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medicineapp2/Auth/mobile_verification.dart';
import 'package:medicineapp2/Auth/verifyemail.dart';
import 'package:medicineapp2/dashboard.dart';
import 'package:medicineapp2/Auth/resetpassword.dart';
import 'package:medicineapp2/Auth/signup.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../const.dart';
import '../main.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final GlobalKey<FormState> navigatorKey = GlobalKey<FormState>();

  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color textcolor_white = Color(0xffACAEBA);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final isPhoneVerified = snapshot.data?.providerData.any((userInfo) {
            return userInfo.providerId == 'phone' &&
                userInfo.phoneNumber != null;
          });
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.waveDots(
                color: Colors.white,
                size: 200,
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
          final user = snapshot.data;
          if (user == null) {
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
                        ),
                        child: Text(
                          "Welcome",
                          style: TextStyle(
                            fontFamily: 'regular',
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
                          "Glad to see you!",
                          style: TextStyle(
                            fontFamily: 'regular',
                            fontSize: 20,
                            color: white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Form(
                          key: navigatorKey,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  topRight: Radius.circular(6)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: ListView(
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  Text(
                                    "Login",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                      fontSize: 16,
                                      color: textcolor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        120,
                                  ),
                                  Text(
                                    "Authenticate yourself by filling up your details!",
                                    style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 12,
                                      color: textcolor,
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 60,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: background,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: TextFormField(
                                      onChanged: (value) {},
                                      controller: emailcontroller,
                                      keyboardType: TextInputType.emailAddress,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(320),
                                      ],
                                      style: TextStyle(color: textcolor),
                                      textAlign: TextAlign.left,
                                      decoration: kTextFieldDecoration.copyWith(
                                          contentPadding:
                                              EdgeInsets.only(left: 20),
                                          hintText: "Email"),
                                      validator: (phone) => phone != null
                                          ? "Email cannot be empty!"
                                          : null,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              80),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: background,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    child: TextFormField(
                                      obscureText: true,
                                      onChanged: (value) {},
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(50),
                                      ],
                                      controller: passwordcontroller,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      style: TextStyle(color: textcolor),
                                      textAlign: TextAlign.left,
                                      decoration: kTextFieldDecoration.copyWith(
                                          contentPadding:
                                              EdgeInsets.only(left: 20),
                                          hintText: "Password"),
                                      validator: (phone) => phone != null &&
                                              phone.length < 6
                                          ? "Password Can't empty or less than 6"
                                          : null,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              80),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Theme(
                                      data: ThemeData(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(() => resetpassword(),
                                              transition:
                                                  Transition.rightToLeft);
                                        },
                                        child: Text(
                                          "Forgot Password ?",
                                          style: TextStyle(
                                            fontFamily: 'regular',
                                            fontSize: 14,
                                            color: textcolor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              40),
                                  Theme(
                                    data: ThemeData(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                    ),
                                    child: ButtonTheme(
                                        child: MaterialButton(
                                      onPressed: () {
                                        if (navigatorKey.currentState!
                                            .validate()) {
                                          login();
                                        }
                                      },
                                      elevation: 0,
                                      hoverElevation: 0,
                                      focusElevation: 0,
                                      highlightElevation: 0,
                                      minWidth:
                                          MediaQuery.of(context).size.width,
                                      height: 52,
                                      color: bluecolor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: white,
                                            fontFamily: "medium"),
                                      ),
                                    )),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              80),
                                  Theme(
                                    data: ThemeData(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                    ),
                                    child: ButtonTheme(
                                        child: MaterialButton(
                                      onPressed: () {
                                        Get.to(() => signup(),
                                            transition: Transition.rightToLeft);
                                      },
                                      elevation: 0,
                                      hoverElevation: 0,
                                      focusElevation: 0,
                                      highlightElevation: 0,
                                      minWidth:
                                          MediaQuery.of(context).size.width,
                                      height: 50,
                                      color: background,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Text(
                                        "Don't have account? Signup",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: bluecolor,
                                            fontFamily: "medium"),
                                      ),
                                    )),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              40),
                                  Text(
                                    "By continuing, you agree to our Terms of Service \n and confirm that you have read our privacy Policy,\nRead",
                                    style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 12,
                                      color: textcolor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ));
          }
          if (user.emailVerified) {
            if (isPhoneVerified!) {
              uid = snapshot.data?.uid ?? uid;
              emailofuser = snapshot.data?.email ?? emailofuser;
              phoneofuser = snapshot.data?.phoneNumber ?? phoneofuser;
              return const dashboard();
            } else {
              return const mobile_verification();
            }
          } else {
            return const verifyemail();
          }
        });
  }

  Future login() async {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim());
    } on FirebaseAuthException catch (e) {
      print("---->${e.code}");
      var othersnackbar = SnackBar(
        content: Text("${e.code}"),
        backgroundColor: textcolor,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),
        duration: Duration(milliseconds: 2000),
        behavior: SnackBarBehavior.floating,
      );
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(othersnackbar);
      });
      Navigator.of(context).pop();

      return;
    }

    Navigator.of(context).pop();
  }
}
