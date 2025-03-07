import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medicineapp2/const.dart';
import 'package:medicineapp2/dashboard.dart';
import 'dart:core';

import 'dart:io';

import 'Medicine/medicine.dart';
import 'buy and cart/prescription_orderScreen.dart';

class orderbyprescription extends StatefulWidget {
  @override
  State<orderbyprescription> createState() => _orderbyprescriptionState();
}

class _orderbyprescriptionState extends State<orderbyprescription> {
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color buttontextcolor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.height / 60,
        right: MediaQuery.of(context).size.height / 60,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "images/prescription.png",
            scale: 9,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upload Prescription",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'semibold',
                  fontSize: 16,
                  color: textcolor,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 300,
              ),
              Text(
                "Upload your prescription\nand we will deliver your item.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'regular',
                  fontSize: 12,
                  color: textcolor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 800,
          ),
          ButtonTheme(
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  Get.to(() => medicine(), transition: Transition.rightToLeft);
                },
                elevation: 0,
                hoverElevation: 0,
                focusElevation: 0,
                highlightElevation: 0,
                height: MediaQuery.of(context).size.height / 22,
                minWidth: MediaQuery.of(context).size.height / 9,
                color: textcolor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                child: Text(
                  "Upload",
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'medium', fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class noorderbyprescription extends StatelessWidget {
  Color textcolor = Colors.white;

  Color buttontextcolor = Color(0xff273238);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "images/questonmark.png",
            scale: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "No Prescription?",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'semibold',
                  fontSize: 16,
                  color: textcolor,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 300,
              ),
              Text(
                "Order after verifying",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'regular',
                  fontSize: 14,
                  color: textcolor,
                ),
              ),
            ],
          ),
          ButtonTheme(
            child: Center(
              child: MaterialButton(
                onPressed: () async {},
                elevation: 0,
                hoverElevation: 0,
                focusElevation: 0,
                highlightElevation: 0,
                height: MediaQuery.of(context).size.height / 20,
                minWidth: MediaQuery.of(context).size.height / 9,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Verify",
                  style: TextStyle(
                      color: buttontextcolor,
                      fontFamily: 'semibold',
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}

class orderbyprescription_medicinepage extends StatefulWidget {
  const orderbyprescription_medicinepage({Key? key}) : super(key: key);

  @override
  State<orderbyprescription_medicinepage> createState() =>
      _orderbyprescription_medicinepageState();
}

class _orderbyprescription_medicinepageState
    extends State<orderbyprescription_medicinepage> {
  var _selectedFile = null;
  bool _showWidget = false;
  Widget getImageWidget() {
    if (_selectedFile != null) {
      return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Prescription'),
                content: Image.file(
                  _selectedFile,
                  fit: BoxFit.scaleDown,
                ),
              );
            },
          );
        },
        child: Image.file(
          _selectedFile,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Image.asset(
        "images/prescription.png",
        width: 60,
        height: 60,
        fit: BoxFit.cover,
      );
    }
  }

  getImage(ImageSource source) async {
    XFile image = (await ImagePicker().pickImage(source: source)) as XFile;
    if (image != null) {
      CroppedFile? cropped = await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxWidth: 700,
        maxHeight: 700,
        compressFormat: ImageCompressFormat.jpg,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
          WebUiSettings(
            context: context,
          ),
        ],
      );

      this.setState(() {
        _selectedFile = File(cropped!.path);
        _showWidget = true;
      });
    } else {
      this.setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Color textcolor = Color(0xff1A1D44);
    Color bluecolor = Color(0xff014CC4);
    Color textcolor_white = Color(0xff42474e);
    Color white = Color(0xffffffff);
    Color background = Color(0xffF1F1F1);
    Color lightblue = Color(0xff01BDF3);

    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order with prescription",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'semibold',
                      fontSize: 16,
                      color: textcolor,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 120,
                  ),
                  Text(
                    "Upload the photo and we will \ndeliver the item",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'regular',
                      fontSize: 12,
                      color: textcolor,
                    ),
                  ),
                ],
              ),
              getImageWidget(),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.height / 50,
              ),
              ButtonTheme(
                child: Center(
                  child: MaterialButton(
                    onPressed: () {
                      getImage(ImageSource.camera);
                    },
                    elevation: 0,
                    hoverElevation: 0,
                    focusElevation: 0,
                    highlightElevation: 0,
                    height: MediaQuery.of(context).size.height / 20,
                    minWidth: MediaQuery.of(context).size.height / 11,
                    color: bluecolor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.camera_alt_rounded,
                          size: 20,
                          color: white,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height / 80,
                        ),
                        Text(
                          "Camera",
                          style: TextStyle(
                            fontFamily: 'medium',
                            fontSize: 14,
                            color: white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height / 10,
              ),
              ButtonTheme(
                child: Center(
                  child: MaterialButton(
                    onPressed: () {
                      getImage(ImageSource.gallery);
                    },
                    elevation: 0,
                    hoverElevation: 0,
                    focusElevation: 0,
                    highlightElevation: 0,
                    height: MediaQuery.of(context).size.height / 20,
                    minWidth: MediaQuery.of(context).size.height / 11,
                    color: lightblue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.photo,
                          size: 20,
                          color: white,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height / 80,
                        ),
                        Text(
                          "Gallery",
                          style: TextStyle(
                            fontFamily: 'semibold',
                            fontSize: 14,
                            color: white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height / 50,
              ),
            ],
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 600),
            height: _showWidget ? 50.0 : 0.0,
            child: _showWidget
                ? ButtonTheme(
                    child: Center(
                      child: MaterialButton(
                        onPressed: () {
                          Get.to(
                              () => prescription_orderscreen(
                                    selectedFile: _selectedFile,
                                  ),
                              transition: Transition.rightToLeft);
                        },
                        elevation: 0,
                        hoverElevation: 0,
                        focusElevation: 0,
                        highlightElevation: 0,
                        height: MediaQuery.of(context).size.height / 18,
                        minWidth: MediaQuery.of(context).size.height / 2.21,
                        color: background,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        child: Text(
                          "Continue with prescription",
                          style: TextStyle(
                            fontFamily: 'medium',
                            fontSize: 16,
                            color: bluecolor,
                          ),
                        ),
                      ),
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}

class callus_to_place_order extends StatelessWidget {
  const callus_to_place_order({Key? key}) : super(key: key);

  @override
  void makecall_med() async {
    await FlutterPhoneDirectCaller.callNumber('$emergenncy_number');
  }

  Widget build(BuildContext context) {
    Color textcolor = Color(0xff1A1D44);
    Color buttontextcolor = Color(0xffffffff);
    Color buttonbg = Color(0xff014CC4);

    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.height / 60,
        right: MediaQuery.of(context).size.height / 60,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "images/call.png",
            scale: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Call And Order",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'semibold',
                  fontSize: 16,
                  color: textcolor,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 300,
              ),
              Text(
                "Place your order via call,\nonly placed after verification",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'regular',
                  fontSize: 12,
                  color: textcolor,
                ),
              ),
            ],
          ),
          ButtonTheme(
            child: Center(
              child: MaterialButton(
                onPressed: () async {
                  makecall_med();
                },
                elevation: 0,
                hoverElevation: 0,
                focusElevation: 0,
                highlightElevation: 0,
                height: MediaQuery.of(context).size.height / 22,
                minWidth: MediaQuery.of(context).size.height / 9,
                color: buttonbg,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                child: Text(
                  "Call",
                  style: TextStyle(
                      color: buttontextcolor,
                      fontFamily: 'semibold',
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
