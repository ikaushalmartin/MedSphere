import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Models/address_model.dart';
import '../const.dart';
import '../dashboard.dart';
import '../main.dart';

class pick_and_drop_final extends StatefulWidget {
  pick_and_drop_final(
      {Key? key,
      required this.orgin_address,
      required this.destination_address,
      required this.Expected_time,
      required this.price_km,
      required this.total_distance,
      required this.total_price})
      : super(key: key);

  var orgin_address,
      destination_address,
      total_distance,
      Expected_time,
      total_price,
      price_km;
  @override
  State<pick_and_drop_final> createState() => _pick_and_drop_finalState();
}

class _pick_and_drop_finalState extends State<pick_and_drop_final> {
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
  Color textcolor_light = Color(0xffACAEBA);
  final _formKey = GlobalKey<FormState>();
  TextEditingController patientname = TextEditingController();
  TextEditingController patientphone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: white,
              height: MediaQuery.of(context).size.height / 16,
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height / 60,
                    right: MediaQuery.of(context).size.height / 200),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: textcolor,
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height / 60,
                    ),
                    Text(
                      "Details",
                      style: TextStyle(
                        fontFamily: 'medium',
                        fontSize: 16,
                        color: textcolor,
                      ),
                    ),
                  ],
                ), //toprow
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 80,
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                        bottom: MediaQuery.of(context).size.height / 80,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pick and Drop Details",
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 16,
                              color: textcolor,
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 80),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.circle,
                                size: 6,
                                color: bluecolor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 70,
                              ),
                              Text(
                                "Origin Destination :",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 14,
                                  color: textcolor,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 45,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  widget.orgin_address,
                                  style: TextStyle(
                                    fontFamily: 'medium',
                                    fontSize: 14,
                                    color: textcolor_light,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 100,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.circle,
                                size: 6,
                                color: bluecolor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 70,
                              ),
                              Text(
                                "Destination Address :",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 14,
                                  color: textcolor,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  widget.destination_address,
                                  style: TextStyle(
                                    fontFamily: 'medium',
                                    fontSize: 14,
                                    color: textcolor_light,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 100),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 6,
                                color: bluecolor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 70,
                              ),
                              Text(
                                "Expected Time :",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 14,
                                  color: textcolor,
                                ),
                              ),
                              Text(
                                widget.Expected_time,
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 14,
                                  color: textcolor_light,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 100),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 6,
                                color: bluecolor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 70,
                              ),
                              Text(
                                "Total Distance :",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 14,
                                  color: textcolor,
                                ),
                              ),
                              Text(
                                widget.total_distance,
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 14,
                                  color: textcolor_light,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 100),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 6,
                                color: bluecolor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 70,
                              ),
                              Text(
                                "Price/KM :",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 14,
                                  color: textcolor,
                                ),
                              ),
                              Text(
                                "₹${widget.price_km}",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 14,
                                  color: textcolor_light,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 100),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 6,
                                color: bluecolor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 70,
                              ),
                              Text(
                                "Total Price",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 14,
                                  color: textcolor,
                                ),
                              ),
                              Text(
                                "₹${widget.total_price}",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 14,
                                  color: textcolor_light,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 100),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height / 3.5,
                    decoration: BoxDecoration(
                      color: white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 80,
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                        bottom: MediaQuery.of(context).size.height / 80,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your Details",
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 16,
                                color: textcolor,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 80),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: background,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: TextFormField(
                                controller: patientname,
                                enableInteractiveSelection: false,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(30),
                                ],
                                keyboardType: TextInputType.name,
                                style: TextStyle(color: textcolor),
                                textAlign: TextAlign.left,
                                decoration: kTextFieldDecoration.copyWith(
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: "Name"),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (firstname) =>
                                    firstname != null && firstname.length! < 1
                                        ? 'Name cannot be empty'
                                        : null,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 80),
                            Container(
                              //  width: MediaQuery.of(context).size.width / 2.4,
                              decoration: BoxDecoration(
                                color: background,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: TextFormField(
                                onChanged: (value) {},
                                enableInteractiveSelection: false,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(12),
                                ],
                                controller: patientphone,
                                keyboardType: TextInputType.phone,
                                style: TextStyle(color: textcolor),
                                textAlign: TextAlign.left,
                                decoration: kTextFieldDecoration.copyWith(
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: "Phone"),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (phone) =>
                                    phone != null && phone.length < 10
                                        ? 'Enter a valid phone number'
                                        : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 15,
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total Price",
                          style: TextStyle(
                            fontFamily: 'regular',
                            fontSize: 14,
                            color: textcolor,
                          ),
                        ),
                        Text(
                          "₹${widget.total_price}",
                          style: TextStyle(
                            fontFamily: 'medium',
                            fontSize: 14,
                            color: bluecolor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 38.0,
                      child: Theme(
                        data: ThemeData(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              book_rentals();
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          child: Ink(
                            decoration: BoxDecoration(
                                color: bluecolor,
                                borderRadius: BorderRadius.circular(6)),
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 150.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Book",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontFamily: "medium"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future book_rentals() async {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));

    await FirebaseFirestore.instance
        .collection('/ORDERS')
        .doc('Pick and Drop')
        .collection("oders")
        .doc("${DateTime.now()}")
        .set({
      'Origin Address': widget.orgin_address,
      'Destination Address': widget.destination_address,
      'Expeced Time': widget.Expected_time,
      'Total Distance': widget.total_distance,
      'Price/KM': widget.price_km,
      'Coustmer Name': patientname.text,
      'phone': patientphone.text,
      'Total Price': widget.total_price
    });

    Navigator.of(context).pop();
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      headerAnimationLoop: false,
      dialogType: DialogType.success,
      title: 'Success',
      desc: 'Got Your Details!\nWill Get Back To You Soon!!',
      btnOkOnPress: () {
        Get.offAll(dashboard(), transition: Transition.leftToRight);
        debugPrint('OnClcik');
      },
      btnOkIcon: Icons.check_circle,
    )..show();
  }
}
