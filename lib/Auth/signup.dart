import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:email_validator/email_validator.dart';
import 'package:medicineapp2/Auth/mobile_verification.dart';
import 'package:medicineapp2/Auth/verifyemail.dart';
import '../const.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool _isAcceptTermsAndConditions = false;
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color textcolor_white = Color(0xffACAEBA);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
  Color color = Color(0xffececef);

  Color buttoncolor = Color(0xffF1F1F1);
  Color buttontextcolor = Color(0xff014CC4);
  final formkey = GlobalKey<FormState>();

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final verifypasswordcontroller = TextEditingController();
  final firstnamecontroller = TextEditingController();
  final secondnamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const verifyemail();
          } else {
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
                        ),
                        child: Text(
                          "New Here?",
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
                          "Sign yourself up!",
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
                                topRight: Radius.circular(6)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Form(
                              key: formkey,
                              child: ListView(
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  Text(
                                    "Signup",
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
                                    "Signup up yourself by filling up the details!",
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.3,
                                        decoration: BoxDecoration(
                                          color: background,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: TextFormField(
                                          onChanged: (value) {},
                                          controller: firstnamecontroller,
                                          keyboardType: TextInputType.name,
                                          style: TextStyle(color: textcolor),
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                25),
                                          ],
                                          enableInteractiveSelection: false,
                                          textAlign: TextAlign.left,
                                          decoration:
                                              kTextFieldDecoration.copyWith(
                                                  contentPadding:
                                                      EdgeInsets.only(left: 20),
                                                  hintText: "First Name"),
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          validator: (firstname) =>
                                              firstname != null &&
                                                      firstname.length! < 1
                                                  ? 'First name cannot be empty'
                                                  : null,
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.3,
                                        decoration: BoxDecoration(
                                          color: background,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: TextFormField(
                                          onChanged: (value) {},
                                          controller: secondnamecontroller,
                                          keyboardType: TextInputType.name,
                                          style: TextStyle(color: textcolor),
                                          textAlign: TextAlign.left,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                25),
                                          ],
                                          enableInteractiveSelection: false,
                                          decoration:
                                              kTextFieldDecoration.copyWith(
                                                  contentPadding:
                                                      EdgeInsets.only(left: 20),
                                                  hintText: "Last Name"),
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          validator: (lastname) =>
                                              lastname != null &&
                                                      lastname.length! < 1
                                                  ? 'Last name cannot be empty'
                                                  : null,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              80),
                                  Container(
                                    //width: MediaQuery.of(context).size.width / 2.3,
                                    decoration: BoxDecoration(
                                      color: background,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: TextFormField(
                                      onChanged: (value) {},
                                      controller: emailcontroller,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(350),
                                      ],
                                      enableInteractiveSelection: false,
                                      keyboardType: TextInputType.emailAddress,
                                      style: TextStyle(color: textcolor),
                                      textAlign: TextAlign.left,
                                      decoration: kTextFieldDecoration.copyWith(
                                          contentPadding:
                                              EdgeInsets.only(left: 20),
                                          hintText: "Email"),
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (email) => email != null &&
                                              !EmailValidator.validate(email)
                                          ? 'Enter a valid name'
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
                                    child: TextFormField(
                                      onChanged: (value) {},
                                      obscureText: true,
                                      controller: passwordcontroller,
                                      keyboardType: TextInputType.name,
                                      style: TextStyle(color: textcolor),
                                      textAlign: TextAlign.left,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(50),
                                      ],
                                      enableInteractiveSelection: false,
                                      decoration: kTextFieldDecoration.copyWith(
                                          contentPadding:
                                              EdgeInsets.only(left: 20),
                                          hintText: "Password"),
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (address) => address != null &&
                                              address.length < 6
                                          ? 'Password should be greater than 6 character'
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
                                    child: TextFormField(
                                      onChanged: (value) {},
                                      obscureText: true,
                                      controller: verifypasswordcontroller,
                                      keyboardType: TextInputType.name,
                                      style: TextStyle(color: textcolor),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(50),
                                      ],
                                      enableInteractiveSelection: false,
                                      textAlign: TextAlign.left,
                                      decoration: kTextFieldDecoration.copyWith(
                                          contentPadding:
                                              EdgeInsets.only(left: 20),
                                          hintText: "Verify Password"),
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (address) => address != null &&
                                              address.length < 6
                                          ? 'Password should be greater than 6 character'
                                          : null,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              40),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Checkbox(
                                        shape: const CircleBorder(),
                                        checkColor: Colors.white,
                                        activeColor: bluecolor,
                                        //fillColor:
                                        // MaterialStateProperty.resolveWith(getColor),
                                        value: _isAcceptTermsAndConditions,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _isAcceptTermsAndConditions =
                                                value!;
                                            if (!value) {
                                              buttoncolor = background;
                                              buttontextcolor = bluecolor;
                                            } else {
                                              buttoncolor = bluecolor;
                                              buttontextcolor = background;
                                            }
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.3,
                                        child: Text(
                                          "By continuing, you agree to our Terms of \nService and confirm that you have read our privacy Policy",
                                          style: TextStyle(
                                            fontFamily: 'regular',
                                            fontSize: 12,
                                            color: textcolor,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
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
                                        if (!_isAcceptTermsAndConditions) {
                                          var checksnackbar = SnackBar(
                                            content: const Text(
                                                "You haven't agreed with our terms and conditions!"),
                                            backgroundColor: textcolor,
                                            shape: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(1)),
                                            duration:
                                                Duration(milliseconds: 2000),
                                            behavior: SnackBarBehavior.floating,
                                          );
                                          setState(() {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(checksnackbar);
                                          });
                                        } else {
                                          signup();
                                        }
                                      },
                                      elevation: 0,
                                      hoverElevation: 0,
                                      focusElevation: 0,
                                      highlightElevation: 0,
                                      minWidth:
                                          MediaQuery.of(context).size.width,
                                      height: 52,
                                      color: buttoncolor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Text(
                                        "Signup",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: buttontextcolor,
                                            fontFamily: "medium"),
                                      ),
                                    )),
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
        });
  }

  Future signup() async {
    final isValid = formkey.currentState!.validate();
    if (!isValid) return;

    if (passwordcontroller.text.trim() !=
        verifypasswordcontroller.text.trim()) {
      var vpasswordsnackbar = SnackBar(
        content: const Text("Passwords are not same!"),
        backgroundColor: textcolor,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),
        duration: Duration(milliseconds: 2000),
        behavior: SnackBarBehavior.floating,
      );
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(vpasswordsnackbar);
      });
      //Navigator.of(context).pop();
      return;
    }

    showDialog(
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim());
      adduserdata(firstnamecontroller.text.trim(),
          secondnamecontroller.text.trim(), emailcontroller.text.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        var emailsnackbar = SnackBar(
          content: const Text("Email already in use!"),
          backgroundColor: textcolor,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),
          duration: Duration(milliseconds: 2000),
          behavior: SnackBarBehavior.floating,
        );
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(emailsnackbar);
        });
        Navigator.of(context).pop();
        return;
      } else if (e.code == "weak-password") {
        var passwordsnackbar = SnackBar(
          content: const Text("Weak password! Use strong password"),
          backgroundColor: textcolor,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),
          duration: Duration(milliseconds: 2000),
          behavior: SnackBarBehavior.floating,
        );
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(passwordsnackbar);
        });
        Navigator.of(context).pop();
        return;
      } else {
        print(e.code);
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
    }

    Navigator.of(context).pop();
  }

  Future adduserdata(
    String firstname,
    String lastname,
    String email,
  ) async {
    await FirebaseFirestore.instance.collection("users").doc(email).set({
      'first name': firstname,
      'last name': lastname,
      'email': email,
    });
  }
}
