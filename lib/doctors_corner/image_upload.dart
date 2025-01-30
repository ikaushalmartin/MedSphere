import 'dart:core';
import 'package:intl/intl.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../main.dart';
import 'mainscreen.dart';

class dr_image_upload extends StatefulWidget {
  @override
  _dr_image_uploadState createState() => _dr_image_uploadState();
}

class _dr_image_uploadState extends State<dr_image_upload> {
  var _selectedFile = null;
  bool _showWidget = false;
  bool _inProcess = false;

  Widget getImageWidget() {
    if (_selectedFile != null) {
      return Image.file(
        _selectedFile,
        width: 250,
        height: 250,
        fit: BoxFit.contain,
      );
    } else {
      return Image.asset(
        "images/file-upload.png",
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      );
    }
  }

  getImage(ImageSource source) async {
    this.setState(() {
      _inProcess = true;
    });
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
        _inProcess = false;
      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Color lightblue = Color(0xff01BDF3);
    Color textcolor = Color(0xff1A1D44);
    Color bluecolor = Color(0xff014CC4);
    Color white = Color(0xffffffff);
    Color background = Color(0xffF1F1F1);

    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                SizedBox(
                  height: MediaQuery.of(context).size.height / 100,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height / 1.5,
                  color: white,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 60,
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 60,
                      bottom: MediaQuery.of(context).size.height / 40,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: 8,
                              color: bluecolor,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 70,
                            ),
                            Text(
                              "A Special Section For Doctors",
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
                          children: [
                            Icon(
                              Icons.circle,
                              size: 8,
                              color: bluecolor,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 70,
                            ),
                            Text(
                              "Upload Your Doctor's Identity",
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.circle,
                              size: 8,
                              color: bluecolor,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 70,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.4,
                              child: Text(
                                "Can place orders but only be delivered if identity is verified.",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 14,
                                  color: textcolor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        getImageWidget(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height / 30,
                            right: MediaQuery.of(context).size.height / 30,
                            bottom: MediaQuery.of(context).size.height / 60,
                          ),
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
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    minWidth:
                                        MediaQuery.of(context).size.height / 11,
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              80,
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
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    minWidth:
                                        MediaQuery.of(context).size.height / 11,
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              80,
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
                            ],
                          ),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 600),
                          height: _showWidget ? 50.0 : 0.0,
                          child: _showWidget
                              ? ButtonTheme(
                                  child: Center(
                                    child: MaterialButton(
                                      onPressed: () {
                                        showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (context) => Center(
                                                  child: LoadingAnimationWidget
                                                      .waveDots(
                                                    color: Color(0xff273238),
                                                    size: 80,
                                                  ),
                                                ));

                                        if (_selectedFile != null) {
                                          uploadImageToFirebaseStorage();
                                        } else {
                                          Navigator.of(context).pop();
                                          var othersnackbar = SnackBar(
                                            content: Text(
                                                "Please select image to upload"),
                                            duration:
                                                Duration(milliseconds: 2000),
                                            behavior: SnackBarBehavior.floating,
                                          );
                                          setState(() {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(othersnackbar);
                                          });
                                        }
                                      },
                                      elevation: 0,
                                      hoverElevation: 0,
                                      focusElevation: 0,
                                      highlightElevation: 0,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              18,
                                      minWidth:
                                          MediaQuery.of(context).size.height /
                                              2.21,
                                      color: background,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Text(
                                        "Continue",
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
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }//0==close
  Future<void> uploadImageToFirebaseStorage() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    String fileName = uid.toString();
    Reference storageRef = storage.ref().child('Doctors_Identity/$fileName');
    await storageRef.putFile(_selectedFile);
    await storageRef.getDownloadURL();
    doctor_check();
  }

  Future doctor_check() async {
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('/Doctor_check');
    final DocumentReference documentRef = collectionRef.doc(uid);
    await documentRef.set({
      'Verified': 0,
    });
    Navigator.of(context).pop();
    var vpasswordsnackbar = SnackBar(
      content: const Text("Identity Uploaded! Wait for verification! "),
      //  backgroundColor: textcolor,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),
      duration: Duration(milliseconds: 2000),
      behavior: SnackBarBehavior.floating,
    );
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(vpasswordsnackbar);
    });

    //comment this for accessing doctor corner screen
    Navigator.of(context).pop();
    //Get.to(() => const mainscreen(), transition: Transition.rightToLeft);
  }
}
