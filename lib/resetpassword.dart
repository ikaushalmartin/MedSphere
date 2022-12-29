import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'const.dart';

class resetpassword extends StatefulWidget {
  const resetpassword({Key? key}) : super(key: key);

  @override
  State<resetpassword> createState() => _resetpasswordState();
}

class _resetpasswordState extends State<resetpassword> {
  Color bluecolor = Color(0xff2c64e3);
  Color textcolor = Color(0xff273238);
  Color grey = Color(0xffececef);
  final resetemailcontroller = TextEditingController();
  @override
  void dispose() {
    resetemailcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    "Reset Password!",
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
                            "Loggin issues?",
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 32,
                              color: Color(0xff273238),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 130),
                          Text(
                            "Enter your email address and we'll send you a link to get back into your account.",
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
                              color: Color(0xffececef),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              onChanged: (value) {},
                              controller: resetemailcontroller,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: textcolor),
                              textAlign: TextAlign.left,
                              decoration: kTextFieldDecoration.copyWith(
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintText: "Registered Email"),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (email) => email != null &&
                                      !EmailValidator.validate(email)
                                  ? 'Enter a valid name'
                                  : null,
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 70),
                          ButtonTheme(
                              child: MaterialButton(
                            onPressed: () {
                              resetpasswordfunc();
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
                              "Reset Password",
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
              )
            ],
          ),
        ));
  }

  Future resetpasswordfunc() async {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: resetemailcontroller.text.trim());

      var ssnackbar = SnackBar(
        content: Text("Password reset mail sent successfully!"),
        backgroundColor: textcolor,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),
        duration: Duration(milliseconds: 2000),
        behavior: SnackBarBehavior.floating,
      );
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(ssnackbar);
      });
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      var rsnackbar = SnackBar(
        content: Text("${e.code}"),
        backgroundColor: textcolor,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),
        duration: Duration(milliseconds: 2000),
        behavior: SnackBarBehavior.floating,
      );
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(rsnackbar);
      });
      Navigator.of(context).pop();
      return;
    }
  }
}
