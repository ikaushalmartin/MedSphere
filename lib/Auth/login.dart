import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medicineapp2/dashboard.dart';
import 'package:medicineapp2/Auth/resetpassword.dart';
import 'package:medicineapp2/Auth/signup.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../const.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final navigatorKey = GlobalKey<NavigatorState>();

  Color color = Color(0xffececef);
  Color textcolor = Color(0xff273238);
  Color buttoncolor = Color(0xffececef);
  Color buttontextcolor = Color(0xff273238);

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    navigatorKey;
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: LoadingAnimationWidget.waveDots(
              color: Colors.white,
              size: 200,
            ));
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Something went wrong"),
            );
          } else if (snapshot.hasData) {
            return dashboard();
          } else {
            return Scaffold(
                backgroundColor: Color(0xff2c64e3),
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
                        top: MediaQuery.of(context).size.height / 6.5,
                        left: 20,
                        right: 0,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Welcome!",
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height / 4.6,
                        left: 20,
                        right: 0,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Glad to see you!",
                            style: TextStyle(
                              fontFamily: 'light',
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height / 3.5,
                        bottom: 0,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 1.38,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Login",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                      fontSize: 32,
                                      color: Color(0xff273238),
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              130),
                                  Text(
                                    "Authenticate yourself by filling up your details!",
                                    style: TextStyle(
                                      fontFamily: 'light',
                                      fontSize: 14,
                                      color: Color(0xff273238),
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              30),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffececef),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    width: 360,
                                    child: TextField(
                                      onChanged: (value) {},
                                      controller: emailcontroller,
                                      keyboardType: TextInputType.emailAddress,
                                      style:
                                          TextStyle(color: Color(0xff01bdf3)),
                                      textAlign: TextAlign.left,
                                      decoration: kTextFieldDecoration.copyWith(
                                          contentPadding:
                                              EdgeInsets.only(left: 20),
                                          hintText: "Email"),
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              80),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffececef),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    child: TextField(
                                      onChanged: (value) {},
                                      controller: passwordcontroller,
                                      keyboardType: TextInputType.emailAddress,
                                      style:
                                          TextStyle(color: Color(0xff01bdf3)),
                                      textAlign: TextAlign.left,
                                      decoration: kTextFieldDecoration.copyWith(
                                          contentPadding:
                                              EdgeInsets.only(left: 20),
                                          hintText: "Password"),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: ButtonTheme(
                                        child: MaterialButton(
                                      onPressed: () {
                                        Get.to(() => resetpassword(),
                                            transition: Transition.rightToLeft);
                                      },
                                      elevation: 0,
                                      hoverElevation: 0,
                                      focusElevation: 0,
                                      highlightElevation: 0,
                                      //minWidth: MediaQuery.of(context).size.width / 20,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                          fontFamily: 'semibold',
                                          fontSize: 14,
                                          color: Color(0xff273238),
                                        ),
                                      ),
                                    )),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              60),
                                  ButtonTheme(
                                      child: MaterialButton(
                                    onPressed: () {
                                      login();
                                    },
                                    elevation: 0,
                                    hoverElevation: 0,
                                    focusElevation: 0,
                                    highlightElevation: 0,
                                    minWidth: MediaQuery.of(context).size.width,
                                    height: 55,
                                    color: Color(0xff2c64e3),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'medium',
                                          fontSize: 18),
                                    ),
                                  )),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              50),
                                  ButtonTheme(
                                      child: MaterialButton(
                                    onPressed: () {
                                      Get.to(() => signup(),
                                          transition: Transition.rightToLeft);
                                    },
                                    elevation: 0,
                                    hoverElevation: 0,
                                    focusElevation: 0,
                                    highlightElevation: 0,
                                    minWidth: MediaQuery.of(context).size.width,
                                    height: 55,
                                    color: Color(0xffececef),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text(
                                      "Don't have account? Signup",
                                      style: TextStyle(
                                          color: Color(0xff273238),
                                          fontFamily: 'medium',
                                          fontSize: 18),
                                    ),
                                  )),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              25),
                                  ButtonTheme(
                                      child: MaterialButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    hoverElevation: 0,
                                    focusElevation: 0,
                                    highlightElevation: 0,
                                    minWidth: MediaQuery.of(context).size.width,
                                    height: 55,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text(
                                      "By continuing, you agree to our Terms of Service \n and confirm that you have read our privacy Policy",
                                      style: TextStyle(
                                          color: Color(0xff273238),
                                          fontFamily: 'light',
                                          fontSize: 13),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
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
