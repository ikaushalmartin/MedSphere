import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../const.dart';

class resetpassword extends StatefulWidget {
  const resetpassword({Key? key}) : super(key: key);

  @override
  State<resetpassword> createState() => _resetpasswordState();
}

class _resetpasswordState extends State<resetpassword> {
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color textcolor_white = Color(0xffACAEBA);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);

  final resetemailcontroller = TextEditingController();

  final GlobalKey<FormState> _navigatorKey = GlobalKey<FormState>();
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
                  "Reset Password",
                  style: TextStyle(
                    fontFamily: 'regular',
                    fontSize: 20,
                    color: white,
                  ),
                ),
              ),
              Expanded(
                child: Form(
                  key: _navigatorKey,
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
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Text(
                            "Enter your email address and we'll send you a link for resetting your password.",
                            style: TextStyle(
                              fontFamily: 'regular',
                              fontSize: 12,
                              color: textcolor,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: background,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: TextFormField(
                              onChanged: (value) {},
                              enableInteractiveSelection: false,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(350),
                              ],
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
                                  ? 'Enter a valid email'
                                  : null,
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
                              onPressed: () {
                                if (_navigatorKey.currentState!.validate()) {
                                  resetpasswordfunc();
                                }
                              },
                              elevation: 0,
                              hoverElevation: 0,
                              focusElevation: 0,
                              highlightElevation: 0,
                              minWidth: MediaQuery.of(context).size.width,
                              height: 52,
                              color: bluecolor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                "Reset Password",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: white,
                                    fontFamily: "medium"),
                              ),
                            )),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 40),
                          Text(
                            "Check spam folder too, If not able to find the code",
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
