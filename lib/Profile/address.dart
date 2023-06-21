import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Models/address_model.dart';
import '../const.dart';
import '../main.dart';

class address extends StatefulWidget {
  const address({Key? key}) : super(key: key);

  @override
  State<address> createState() => _addressState();
}

class _addressState extends State<address> {
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
  Color textcolor_light = Color(0xffACAEBA);
  final _formKey = GlobalKey<FormState>();
  final patientname = TextEditingController();
  final patientphone = TextEditingController();
  final patientpincode = TextEditingController();
  final patientaddress = TextEditingController();

  List<address_model> user_address = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_user_address();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: background,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: white,
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
                        "Your Address",
                        style: TextStyle(
                          fontFamily: 'medium',
                          fontSize: 16,
                          color: textcolor,
                        ),
                      ),
                      Theme(
                        data: ThemeData(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.circle),
                          color: white,
                          iconSize: 0,
                        ),
                      )
                    ],
                  ), //toprow
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
              Container(
                  color: white,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 15,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 60,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add New Address",
                          style: TextStyle(
                            fontFamily: 'medium',
                            fontSize: 16,
                            color: textcolor,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Your Details",
                                      style: TextStyle(
                                        fontFamily: 'medium',
                                        fontSize: 16,
                                        color: textcolor,
                                      ),
                                    ),
                                    content: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: white,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              60,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              60,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              60,
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              60,
                                        ),
                                        child: Form(
                                          key: _formKey,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      65),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  color: background,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: TextFormField(
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                        30),
                                                  ],
                                                  enableInteractiveSelection:
                                                      false,
                                                  controller: patientname,
                                                  keyboardType:
                                                      TextInputType.name,
                                                  style: TextStyle(
                                                      color: textcolor),
                                                  textAlign: TextAlign.left,
                                                  decoration: kTextFieldDecoration
                                                      .copyWith(
                                                          contentPadding:
                                                              EdgeInsets.only(
                                                                  left: 20),
                                                          hintText: "Name"),
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  validator: (firstname) =>
                                                      firstname != null &&
                                                              firstname
                                                                      .length! <
                                                                  1
                                                          ? 'Name cannot be empty'
                                                          : null,
                                                ),
                                              ),
                                              SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      80),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  color: background,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: TextFormField(
                                                  enableInteractiveSelection:
                                                      false,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                        7),
                                                  ],
                                                  onChanged: (value) {},
                                                  controller: patientpincode,
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  style: TextStyle(
                                                      color: textcolor),
                                                  textAlign: TextAlign.left,
                                                  decoration: kTextFieldDecoration
                                                      .copyWith(
                                                          contentPadding:
                                                              EdgeInsets.only(
                                                                  left: 20),
                                                          hintText: "Pincode"),
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  validator: (phone) => phone !=
                                                              null &&
                                                          phone.length < 6
                                                      ? 'Enter a valid pincode'
                                                      : null,
                                                ),
                                              ),
                                              SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      80),
                                              Container(
                                                //  width: MediaQuery.of(context).size.width / 2.4,
                                                decoration: BoxDecoration(
                                                  color: background,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: TextFormField(
                                                  onChanged: (value) {},
                                                  enableInteractiveSelection:
                                                      false,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                        12),
                                                  ],
                                                  controller: patientphone,
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  style: TextStyle(
                                                      color: textcolor),
                                                  textAlign: TextAlign.left,
                                                  decoration: kTextFieldDecoration
                                                      .copyWith(
                                                          contentPadding:
                                                              EdgeInsets.only(
                                                                  left: 20),
                                                          hintText: "Phone"),
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  validator: (phone) => phone !=
                                                              null &&
                                                          phone.length < 10
                                                      ? 'Enter a valid phone number'
                                                      : null,
                                                ),
                                              ),
                                              SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      80),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: background,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: TextFormField(
                                                  onChanged: (value) {},
                                                  enableInteractiveSelection:
                                                      false,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                        60),
                                                  ],
                                                  controller: patientaddress,
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  style: TextStyle(
                                                      color: textcolor),
                                                  textAlign: TextAlign.left,
                                                  decoration: kTextFieldDecoration
                                                      .copyWith(
                                                          contentPadding:
                                                              EdgeInsets.only(
                                                                  left: 20),
                                                          hintText: "Address"),
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  validator: (phone) => phone !=
                                                              null &&
                                                          phone.length < 10
                                                      ? 'Enter a valid address'
                                                      : null,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: Text(
                                          "Save",
                                          style: TextStyle(
                                            fontFamily: 'semibold',
                                            fontSize: 16,
                                            color: textcolor,
                                          ),
                                        ),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            add_user_address();
                                          }
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.add, color: textcolor))
                      ],
                    ),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
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
              Expanded(
                child: Padding(
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
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 80,
                                left: MediaQuery.of(context).size.height / 60,
                                right: MediaQuery.of(context).size.height / 60,
                                bottom: MediaQuery.of(context).size.height / 80,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
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
                                  GestureDetector(
                                    onTap: () {
                                      deleteDocument(user_address[index].id);
                                    },
                                    child: const Icon(
                                      Icons.delete_outline,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ));
  }

  Future add_user_address() async {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));

    await FirebaseFirestore.instance
        .collection('/Saved_address')
        .doc(uid)
        .collection("Saved Addesses")
        .doc("${DateTime.now()}")
        .set({
      'Customer Name': patientname.text,
      'phone': patientphone.text,
      'pincode': patientpincode.text,
      'address': patientaddress.text,
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
        Navigator.of(context).pop();
        fetch_user_address();
      },
      btnOkIcon: Icons.check_circle,
    ).show();
  }

  void deleteDocument(String documentId) async {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));
    await FirebaseFirestore.instance
        .collection('/Saved_address')
        .doc(uid)
        .collection("Saved Addesses")
        .doc(documentId)
        .delete();

    fetch_user_address();
    Navigator.of(context).pop();
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
