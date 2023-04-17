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
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
  Color textcolor_light = Color(0xffACAEBA);

  final _formKey = GlobalKey<FormState>();
  TextEditingController patientname = TextEditingController();
  TextEditingController patientphone = TextEditingController();
  TextEditingController patientpincode = TextEditingController();
  TextEditingController patientaddress = TextEditingController();
  int days = 1;
  List<address_model> user_address = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_user_address();
  }

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
                            "Product Details",
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 16,
                              color: textcolor,
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 80),
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
                                "Product Name :",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 14,
                                  color: textcolor,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 45,
                              ),
                              Text(
                                "${widget.name}",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 14,
                                  color: textcolor_light,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 100,
                          ),
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
                                "Company :",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 14,
                                  color: textcolor,
                                ),
                              ),
                              Text(
                                "${widget.company}",
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
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: 100,
                              height: 25,
                              decoration: BoxDecoration(
                                color: background,
                                borderRadius: BorderRadius.circular(20),
                              ),
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
                                    fontFamily: 'medium',
                                    fontSize: 12,
                                    color: textcolor,
                                  ),
                                ),
                              ),
                            ),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
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
                                        contentPadding:
                                            EdgeInsets.only(left: 20),
                                        hintText: "Name"),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (firstname) =>
                                        firstname != null &&
                                                firstname.length! < 1
                                            ? 'Name cannot be empty'
                                            : null,
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  decoration: BoxDecoration(
                                    color: background,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: TextFormField(
                                    onChanged: (value) {},
                                    enableInteractiveSelection: false,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(7),
                                    ],
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
                                  LengthLimitingTextInputFormatter(60),
                                ],
                                controller: patientaddress,
                                keyboardType: TextInputType.name,
                                style: TextStyle(color: textcolor),
                                textAlign: TextAlign.left,
                                decoration: kTextFieldDecoration.copyWith(
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: "Address"),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (phone) =>
                                    phone != null && phone.length < 10
                                        ? 'Enter a valid address'
                                        : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 100),
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
                                  "Number of Days",
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
                  SizedBox(height: MediaQuery.of(context).size.height / 100),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 60,
                    ),
                    child: Text(
                      "Saved Address",
                      style: TextStyle(
                        fontFamily: 'medium',
                        fontSize: 16,
                        color: textcolor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 60,
                    ),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: user_address.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height / 60,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                patientname.text = user_address[index].name;
                                patientpincode.text =
                                    user_address[index].pincode;
                                patientphone.text = user_address[index].phone;
                                patientaddress.text =
                                    user_address[index].useraddress;
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top:
                                        MediaQuery.of(context).size.height / 80,
                                    left:
                                        MediaQuery.of(context).size.height / 60,
                                    right:
                                        MediaQuery.of(context).size.height / 60,
                                    bottom:
                                        MediaQuery.of(context).size.height / 80,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${user_address[index].name}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'medium',
                                          fontSize: 16,
                                          color: textcolor,
                                        ),
                                      ),
                                      Text(
                                        "Phone : ${user_address[index].phone}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'medium',
                                          fontSize: 14,
                                          color: textcolor_light,
                                        ),
                                      ),
                                      Text(
                                        "${user_address[index].useraddress}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'regular',
                                          fontSize: 14,
                                          color: textcolor_light,
                                        ),
                                      ),
                                      Text(
                                        "${user_address[index].pincode}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'regular',
                                          fontSize: 14,
                                          color: textcolor_light,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
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
                          "${widget.name}",
                          style: TextStyle(
                            fontFamily: 'regular',
                            fontSize: 14,
                            color: textcolor,
                          ),
                        ),
                        Text(
                          "₹${int.parse(widget.priceperday) * days}",
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
        .doc('Rentals')
        .collection("oders")
        .doc("${DateTime.now()}")
        .set({
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
        Get.offAll(dashboard(), transition: Transition.leftToRight);
        debugPrint('OnClcik');
      },
      btnOkIcon: Icons.check_circle,
    )..show();
  }

  fetch_user_address() async {
    var address_var = await FirebaseFirestore.instance
        .collection('/Saved_address/$uid/Saved Addesses')
        .get();
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));
    map_rental_details(address_var);
  }

  map_rental_details(QuerySnapshot<Map<String, dynamic>> data) {
    var _doctor_deatils_list = data.docs
        .map((item) => address_model(
              id: item.id,
              name: item['Customer Name'],
              useraddress: item['address'],
              phone: item['phone'],
              pincode: item['pincode'],
            ))
        .toList();

    setState(() {
      user_address = _doctor_deatils_list;
    });
    Navigator.of(context).pop();
  }
}
