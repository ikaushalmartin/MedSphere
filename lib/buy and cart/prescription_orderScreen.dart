import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../const.dart';
import '../main.dart';

class prescription_orderscreen extends StatefulWidget {
  var selectedFile;
  prescription_orderscreen({Key? key, required this.selectedFile})
      : super(key: key);

  @override
  State<prescription_orderscreen> createState() =>
      _prescription_orderscreenState();
}

class _prescription_orderscreenState extends State<prescription_orderscreen> {
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
  Color redcoloe = Color(0xffFE2D54);
  final _formKey = GlobalKey<FormState>();
  final patientname = TextEditingController();
  final patientphone = TextEditingController();
  final patientpincode = TextEditingController();
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
                      child: Text(
                        "Prescription",
                        style: TextStyle(
                          fontFamily: 'semibold',
                          fontSize: 21,
                          color: textcolor,
                        ),
                      ),
                    ),
                  ),
                  Image.file(
                    widget.selectedFile,
                    height: 200,
                    fit: BoxFit.scaleDown,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 135),
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
                  child: Container(
                    height: 38.0,
                    child: MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          uploadImageToFirebaseStorage();
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
                            "Order",
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
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> uploadImageToFirebaseStorage() async {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));
    FirebaseStorage storage = FirebaseStorage.instance;
    final currentTime = DateTime.now();
    final formatter = DateFormat('yyyyMMdd_HHmmss');
    final imageName = formatter.format(currentTime);
    String fileName = imageName.toString() + uid.toString();
    String uniqueFileName = fileName;

    // Create a reference to the storage location
    Reference storageRef =
        storage.ref().child('Doctors_Identity/$uniqueFileName');

    // Upload the image to storage
    TaskSnapshot uploadTask = await storageRef.putFile(widget.selectedFile);

    // Get the download URL for the image
    String imageUrl = await storageRef.getDownloadURL();

    // Do something with the download URL, like store it in Cloud Firestore or display it in your app
    print(imageUrl);
    book_rentals(imageUrl);
  }

  Future book_rentals(String uniqueFileName) async {
    await FirebaseFirestore.instance
        .collection('/ORDERS')
        .doc('prescription_orders')
        .collection("orders")
        .doc("${DateTime.now()}")
        .set({
      'Url': uniqueFileName,
      'Coustmer Name': patientname.text,
      'pincode': patientpincode.text,
      'phone': patientphone.text,
    });

    await FirebaseFirestore.instance
        .collection('Order_Status')
        .doc(uid)
        .collection("oders")
        .add({
      "Cutprice": "NA",
      "Info": "NA",
      "Name": "Prescription",
      "Price": "NA",
      "Status": "Pending",
      "Quantity": 0
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
