import 'dart:core';

import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
  bool _inProcess = false;

  Widget getImageWidget() {
    if (_selectedFile != null) {
      return Image.file(
        _selectedFile,
        width: 250,
        height: 250,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        "images/upload.png",
        width: 250,
        height: 250,
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEEE3CB),
        body: Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: BoxDecoration(
                  color: Color(0xffB7C4CF),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          getImageWidget(),
                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              MaterialButton(
                                  color: Color(0xff967E76),
                                  child: Text(
                                    "Camera",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    getImage(ImageSource.camera);
                                  }),
                              MaterialButton(
                                  color: Color(0xff967E76),
                                  child: Text(
                                    "Device",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    getImage(ImageSource.gallery);
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => Center(
                            child: LoadingAnimationWidget.waveDots(
                              color: Color(0xff273238),
                              size: 80,
                            ),
                          ));

                  if (_selectedFile != null) {
                    uploadImageToFirebaseStorage();
                  } else {
                    Navigator.of(context).pop();
                    var othersnackbar = SnackBar(
                      content: Text("Please select image to upload"),
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1)),
                      duration: Duration(milliseconds: 2000),
                      behavior: SnackBarBehavior.floating,
                    );
                    setState(() {
                      ScaffoldMessenger.of(context).showSnackBar(othersnackbar);
                    });
                  }
                },
                minWidth: 20,
                height: 50,
                color: Colors.white,
                child: Text("upload"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> uploadImageToFirebaseStorage() async {
    FirebaseStorage storage = FirebaseStorage.instance;

    String fileName = uid.toString();
    String uniqueFileName = fileName;

    // Create a reference to the storage location
    Reference storageRef =
        storage.ref().child('Doctors_Identity/$uniqueFileName');

    // Upload the image to storage
    TaskSnapshot uploadTask = await storageRef.putFile(_selectedFile);

    // Get the download URL for the image
    String imageUrl = await storageRef.getDownloadURL();

    // Do something with the download URL, like store it in Cloud Firestore or display it in your app
    print(imageUrl);
    doctor_check();
  }

  Future doctor_check() async {
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('/Doctor_check');
    final DocumentReference documentRef = collectionRef.doc(uid);
    await documentRef.set({
      'Verified': 1,
    });

    Navigator.of(context).pop();
    Get.to(() => const mainscreen(), transition: Transition.rightToLeft);
  }
}
