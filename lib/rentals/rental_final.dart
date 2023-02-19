import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../const.dart';
import '../main.dart';

class rentalfinal extends StatefulWidget {
  String name, company, priceperday;
  rentalfinal(
      {Key? key,
      required this.name,
      required this.company,
      required this.priceperday})
      : super(key: key);

  @override
  State<rentalfinal> createState() => _rentalfinalState();
}

class _rentalfinalState extends State<rentalfinal> {
  Color bluecolor = Color(0xff5093FE);
  Color bluecolor_bg = Color(0xffDAE1FF);
  Color textcolor = Color(0xD9181818);
  Color textcolor_light = Color(0x99181818);
  Color textcolor_light2 = Color(0x4D181818);
  Color background = Color(0xffD9D9D9);
  Color white = Color(0xffffffff);
  Color search_bg = Color(0x1A000000);
  Color medicine_colour_button_1 = Color(0xff07DAEB);
  Color medicine_colour_button_2 = Color(0xff5093FE);
  final _formKey = GlobalKey<FormState>();
  final patientname = TextEditingController();
  final patientphone = TextEditingController();
  final patientpincode = TextEditingController();
  int days = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: Stack(
          children: [
            Positioned(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 70),
                        Padding(
                          padding: EdgeInsets.only(
                              //   top: MediaQuery.of(context).size.height / 80,
                              left: MediaQuery.of(context).size.height / 60,
                              right: MediaQuery.of(context).size.height / 200),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  color: textcolor,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Details",
                                  style: TextStyle(
                                    fontFamily: 'semibold',
                                    fontSize: 24,
                                    color: textcolor,
                                  ),
                                ),
                              ),
                              Text(""),
                            ],
                          ),
                        ), //toprow
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 70),
                        //searchbar
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 135),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height / 60,
                        top: MediaQuery.of(context).size.height / 60,
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Product Details",
                            style: TextStyle(
                              fontFamily: 'semibold',
                              fontSize: 21,
                              color: textcolor,
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 80),
                          Row(
                            children: [
                              Text(
                                "Product Name  -  ",
                                style: TextStyle(
                                  fontFamily: 'semibold',
                                  fontSize: 18,
                                  color: textcolor,
                                ),
                              ),
                              Text(
                                "${widget.name}",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 18,
                                  color: textcolor_light,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 520),
                          Row(
                            children: [
                              Text(
                                "Company  -  ",
                                style: TextStyle(
                                  fontFamily: 'semibold',
                                  fontSize: 18,
                                  color: textcolor,
                                ),
                              ),
                              Text(
                                "${widget.company}",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 18,
                                  color: textcolor_light,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 80),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: 130,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: search_bg,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: textcolor_light, width: 1.1)),
                              child: MaterialButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          'Days',
                                          style: TextStyle(
                                              color: textcolor,
                                              fontFamily: "medium"),
                                        ),
                                        content: Container(
                                          height: 350,
                                          width: 1,
                                          child: ListView.builder(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: 29,
                                            itemBuilder:
                                                (BuildContext context, int x) {
                                              return ListTile(
                                                title: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      days = x + 1;
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 50,
                                                    child: Text('${x + 1}'),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  'Days - $days',
                                  style: TextStyle(
                                      color: textcolor, fontFamily: "medium"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 135),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height / 3.5,
                    decoration: BoxDecoration(
                      color: white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 60,
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                        bottom: MediaQuery.of(context).size.height / 60,
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
                                fontFamily: 'semibold',
                                fontSize: 21,
                                color: textcolor,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 65),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  decoration: BoxDecoration(
                                    color: background,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    controller: patientname,
                                    keyboardType: TextInputType.name,
                                    style: TextStyle(color: textcolor),
                                    textAlign: TextAlign.left,
                                    decoration: kTextFieldDecoration.copyWith(
                                        contentPadding:
                                            EdgeInsets.only(left: 20),
                                        hintText: "Name"),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (firstname) =>
                                        firstname != null &&
                                                firstname.length! < 1
                                            ? 'First name cannot be empty'
                                            : null,
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  decoration: BoxDecoration(
                                    color: background,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    onChanged: (value) {},
                                    controller: patientpincode,
                                    keyboardType: TextInputType.phone,
                                    style: TextStyle(color: textcolor),
                                    textAlign: TextAlign.left,
                                    decoration: kTextFieldDecoration.copyWith(
                                        contentPadding:
                                            EdgeInsets.only(left: 20),
                                        hintText: "Pincode"),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (phone) =>
                                        phone != null && phone.length < 6
                                            ? 'Enter a valid pincode'
                                            : null,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 80),
                            Container(
                              //  width: MediaQuery.of(context).size.width / 2.4,
                              decoration: BoxDecoration(
                                color: background,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                onChanged: (value) {},
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
                  SizedBox(height: MediaQuery.of(context).size.height / 135),
                  Container(
                    color: white,
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 80,
                            left: MediaQuery.of(context).size.height / 60,
                            right: MediaQuery.of(context).size.height / 60,
                            bottom: MediaQuery.of(context).size.height / 80),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Price/Day",
                                  style: TextStyle(
                                    fontFamily: 'medium',
                                    fontSize: 14,
                                    color: textcolor,
                                  ),
                                ),
                                Text(
                                  "₹${widget.priceperday}",
                                  style: TextStyle(
                                    fontFamily: 'medium',
                                    fontSize: 14,
                                    color: textcolor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 100,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Number Of Days",
                                  style: TextStyle(
                                    fontFamily: 'medium',
                                    fontSize: 14,
                                    color: textcolor,
                                  ),
                                ),
                                Text(
                                  "$days",
                                  style: TextStyle(
                                    fontFamily: 'medium',
                                    fontSize: 14,
                                    color: textcolor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 80,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Amount To Be Paid :",
                                  style: TextStyle(
                                    fontFamily: 'medium',
                                    fontSize: 14,
                                    color: textcolor,
                                  ),
                                ),
                                Text(
                                  "₹${int.parse(widget.priceperday) * days}",
                                  style: TextStyle(
                                    fontFamily: 'medium',
                                    fontSize: 14,
                                    color: textcolor,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
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
                            "${widget.name}",
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 16,
                              color: textcolor,
                            ),
                          ),
                          Text(
                            "₹${int.parse(widget.priceperday) * days}",
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 14,
                              color: textcolor,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 38.0,
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
                                gradient: LinearGradient(
                                  colors: [
                                    medicine_colour_button_1,
                                    medicine_colour_button_2
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
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
                    ],
                  ),
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
        .doc('Rentals')
        .collection("oders")
        .doc("${DateTime.now()}")
        .collection(uid)
        .add({
      'Rental Name': widget.name,
      'Rental Company': widget.company,
      'Coustmer Name': patientname.text,
      'pincode': patientpincode.text,
      'phone': patientphone.text,
      'Price/Day': widget.priceperday,
      'Number Of Days': days,
      'Total Amount': int.parse(widget.priceperday) * days
    });

    await FirebaseFirestore.instance
        .collection('Order_Status')
        .doc(uid)
        .collection("oders")
        .add({
      "Cutprice": "NA",
      "Info": widget.company,
      "Name": widget.name,
      "Price": (int.parse(widget.priceperday) * days).toString(),
      "Status": "Pending",
      "Quantity": days
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
        debugPrint('OnClcik');
      },
      btnOkIcon: Icons.check_circle,
    )..show();
  }
}
