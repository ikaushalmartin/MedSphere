import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/dashboard.dart';
import 'package:email_validator/email_validator.dart';
import 'package:medicineapp2/Auth/verifyemail.dart';
import '../const.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool _isAcceptTermsAndConditions = false;
  Color color = Color(0xffececef);
  Color textcolor = Color(0xff273238);
  Color buttoncolor = Color(0xffececef);
  Color buttontextcolor = Color(0xff273238);
  final formkey = GlobalKey<FormState>();

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final verifypasswordcontroller = TextEditingController();
  final firstnamecontroller = TextEditingController();
  final secondnamecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final addresscontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    verifypasswordcontroller.dispose();
    firstnamecontroller.dispose();
    secondnamecontroller.dispose();
    phonecontroller.dispose();
    addresscontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.emailVerified) {
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
                            "New Here?",
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
                            "Sign yourself up!",
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
                            height: MediaQuery.of(context).size.height / 1.02,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Form(
                                key: formkey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Signup",
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
                                      "Signup up youself by filling up the details!",
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.3,
                                          decoration: BoxDecoration(
                                            color: Color(0xffececef),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: TextFormField(
                                            onChanged: (value) {},
                                            controller: firstnamecontroller,
                                            keyboardType: TextInputType.name,
                                            style: TextStyle(color: textcolor),
                                            textAlign: TextAlign.left,
                                            decoration:
                                                kTextFieldDecoration.copyWith(
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            left: 20),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.3,
                                          decoration: BoxDecoration(
                                            color: Color(0xffececef),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: TextFormField(
                                            onChanged: (value) {},
                                            controller: secondnamecontroller,
                                            keyboardType: TextInputType.name,
                                            style: TextStyle(color: textcolor),
                                            textAlign: TextAlign.left,
                                            decoration:
                                                kTextFieldDecoration.copyWith(
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            left: 20),
                                                    hintText: "Last Name"),
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: (lastname) => lastname !=
                                                        null &&
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
                                        color: Color(0xffececef),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextFormField(
                                        onChanged: (value) {},
                                        controller: emailcontroller,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        style: TextStyle(color: textcolor),
                                        textAlign: TextAlign.left,
                                        decoration:
                                            kTextFieldDecoration.copyWith(
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
                                      //width: MediaQuery.of(context).size.width / 2.3,
                                      decoration: BoxDecoration(
                                        color: Color(0xffececef),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextFormField(
                                        onChanged: (value) {},
                                        controller: phonecontroller,
                                        keyboardType: TextInputType.phone,
                                        style: TextStyle(color: textcolor),
                                        textAlign: TextAlign.left,
                                        decoration:
                                            kTextFieldDecoration.copyWith(
                                                contentPadding:
                                                    EdgeInsets.only(left: 20),
                                                hintText: "Phone"),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (phone) =>
                                            phone != null && phone.length < 10
                                                ? 'Enter a valid phone number'
                                                : null,
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
                                      child: TextFormField(
                                        onChanged: (value) {},
                                        controller: addresscontroller,
                                        keyboardType:
                                            TextInputType.streetAddress,
                                        style: TextStyle(color: textcolor),
                                        textAlign: TextAlign.left,
                                        decoration:
                                            kTextFieldDecoration.copyWith(
                                                contentPadding:
                                                    EdgeInsets.only(left: 20),
                                                hintText: "Address"),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (address) =>
                                            address != null &&
                                                    address.length < 10
                                                ? 'Enter a valid address'
                                                : null,
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
                                      child: TextFormField(
                                        onChanged: (value) {},
                                        obscureText: true,
                                        controller: passwordcontroller,
                                        keyboardType: TextInputType.name,
                                        style: TextStyle(color: textcolor),
                                        textAlign: TextAlign.left,
                                        decoration:
                                            kTextFieldDecoration.copyWith(
                                                contentPadding:
                                                    EdgeInsets.only(left: 20),
                                                hintText: "Password"),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (address) => address !=
                                                    null &&
                                                address.length < 6
                                            ? 'Password should be min 6 character'
                                            : null,
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
                                      child: TextFormField(
                                        onChanged: (value) {},
                                        obscureText: true,
                                        controller: verifypasswordcontroller,
                                        keyboardType: TextInputType.name,
                                        style: TextStyle(color: textcolor),
                                        textAlign: TextAlign.left,
                                        decoration:
                                            kTextFieldDecoration.copyWith(
                                                contentPadding:
                                                    EdgeInsets.only(left: 20),
                                                hintText: "Verify Password"),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (address) => address !=
                                                    null &&
                                                address.length < 6
                                            ? 'Password should be min 6 character'
                                            : null,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                80),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Checkbox(
                                          shape: CircleBorder(),
                                          checkColor: Colors.white,
                                          //fillColor:
                                          // MaterialStateProperty.resolveWith(getColor),
                                          value: _isAcceptTermsAndConditions,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              _isAcceptTermsAndConditions =
                                                  value!;
                                              if (!value) {
                                                buttoncolor = Color(0xffececef);
                                                buttontextcolor =
                                                    Color(0xff273238);
                                              } else {
                                                buttoncolor = Color(0xff2c64e3);
                                                buttontextcolor = Colors.white;
                                              }
                                              color;
                                            });
                                          },
                                        ),
                                        ButtonTheme(
                                            child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.4,
                                          child: MaterialButton(
                                            onPressed: () {},
                                            elevation: 0,
                                            hoverElevation: 0,
                                            focusElevation: 0,
                                            highlightElevation: 0,
                                            height: 55,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Text(
                                              "By continuing, you agree to our Terms of \nService and confirm that you have read our privacy Policy",
                                              style: TextStyle(
                                                  color: Color(0xff273238),
                                                  fontFamily: 'light',
                                                  fontSize: 12),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        )),
                                      ],
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                30),
                                    ButtonTheme(
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
                                      height: 55,
                                      color: buttoncolor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Text(
                                        "Signup",
                                        style: TextStyle(
                                            color: buttontextcolor,
                                            fontFamily: 'medium',
                                            fontSize: 18),
                                      ),
                                    )),
                                  ],
                                ),
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
      adduserdata(
          firstnamecontroller.text.trim(),
          secondnamecontroller.text.trim(),
          emailcontroller.text.trim(),
          phonecontroller.text.trim(),
          addresscontroller.text.trim());
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

  Future adduserdata(String firstname, String lastname, String email,
      String phone, String address) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstname,
      'last name': lastname,
      'email': email,
      'phone': phone,
      'address': address,
    });
  }
}
