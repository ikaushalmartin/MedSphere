import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medicineapp2/dashboard.dart';
import 'dart:core';

import 'dart:io';

import 'Medicine/medicine.dart';

class orderbyprescription extends StatefulWidget {
  @override
  State<orderbyprescription> createState() => _orderbyprescriptionState();
}

class _orderbyprescriptionState extends State<orderbyprescription> {
  Color textcolor = Color(0xff1D1D1F);

  Color buttontextcolor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upload Prescription",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'bold',
                  fontSize: 22,
                  color: textcolor,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 300,
              ),
              Text(
                "Order via prescription",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'semibold',
                  fontSize: 16,
                  color: textcolor,
                ),
              ),
            ],
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
                height: MediaQuery.of(context).size.height / 20,
                minWidth: MediaQuery.of(context).size.height / 9,
                color: Color(0xff007AFE),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Upload",
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
                  width: 500,
                  height: 500,
                  fit: BoxFit.cover,
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
      });
    } else {
      this.setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Color textcolor = Color(0xff1D1D1F);

    Color upload_prescription_button_bg = Color(0xffE6EFFE);
    Color upload_prescription_button_text = Color(0xff007AFF);

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
                    "Upload Prescription",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'semibold',
                      fontSize: 21,
                      color: textcolor,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 120,
                  ),
                  Text(
                    "Upload the photo and we will \ndeliver the medicine",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'regular',
                      fontSize: 14,
                      color: textcolor,
                    ),
                  ),
                ],
              ),
              getImageWidget()
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                      height: MediaQuery.of(context).size.height / 18,
                      minWidth: MediaQuery.of(context).size.height / 8,
                      color: upload_prescription_button_bg,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.camera_alt_rounded,
                            size: 25,
                            color: upload_prescription_button_text,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height / 80,
                          ),
                          Text(
                            "Camera",
                            style: TextStyle(
                              fontFamily: 'semibold',
                              fontSize: 18,
                              color: upload_prescription_button_text,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height / 20,
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
                      height: MediaQuery.of(context).size.height / 18,
                      minWidth: MediaQuery.of(context).size.height / 8,
                      color: upload_prescription_button_bg,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.photo,
                            size: 25,
                            color: upload_prescription_button_text,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height / 80,
                          ),
                          Text(
                            "Gallery",
                            style: TextStyle(
                              fontFamily: 'semibold',
                              fontSize: 18,
                              color: upload_prescription_button_text,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
    ;
  }
}

class callus_to_place_order extends StatelessWidget {
  const callus_to_place_order({Key? key}) : super(key: key);

  @override
  void makecall_med() async {
    await FlutterPhoneDirectCaller.callNumber('$emergenncy_number');
  }

  Widget build(BuildContext context) {
    Color textcolor = Color(0xffffdadb);
    Color buttontextcolor = Color(0xff40000e);
    Color buttonbg = Color(0xffffdadb);

    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                  fontSize: 19,
                  color: textcolor,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 350,
              ),
              Text(
                "Place your order via call",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'regular',
                  fontSize: 16,
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
                height: MediaQuery.of(context).size.height / 20,
                minWidth: MediaQuery.of(context).size.height / 9,
                color: buttonbg,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
