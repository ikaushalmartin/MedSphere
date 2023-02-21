import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Models/popularcategories_model.dart';
import '../const.dart';
import 'option_screen.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({Key? key}) : super(key: key);

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  List doctor_corner_image = [];
  List<Item> doctor_corners_items = [];
  Color bluecolor = Color(0xff6588E6);
  Color bluecolor_bg = Color(0xffDAE1FF);
  Color textcolor = Color(0xff1D1D1F);
  Color textcolor_light = Color(0x99181818);
  Color background = Color(0xffF2F1F6);
  Color white = Color(0xffffffff);
  Color search_bg = Color(0x1A000000);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    doctor_corners_image();
    fetch_doctor_corners_items();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: background,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: white,
                      ),
                      child: Padding(
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
                                "Doctors Corner",
                                style: TextStyle(
                                  fontFamily: 'semibold',
                                  fontSize: 24,
                                  color: textcolor,
                                ),
                              ),
                            ),
                            Theme(
                              data: ThemeData(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.shopping_cart_outlined),
                                color: textcolor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ), //toprow
                    SizedBox(height: MediaQuery.of(context).size.height / 200),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height / 60,
                          right: MediaQuery.of(context).size.height / 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.35,
                            decoration: BoxDecoration(
                              color: background,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              onChanged: (value) {},
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: textcolor),
                              textAlign: TextAlign.left,
                              decoration: kTextFieldDecoration.copyWith(
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintText: "Search"),
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 6,
                              decoration: BoxDecoration(
                                color: background,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Theme(
                                data: ThemeData(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.search),
                                  color: textcolor,
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 70),
                    //searchbar
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 5.5,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: doctor_corner_image.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                  () => option_screen(
                                        itemname:
                                            doctor_corners_items[index].name,
                                      ),
                                  transition: Transition.rightToLeft);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: white,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  //top: MediaQuery.of(context).size.height / 60,
                                  left: MediaQuery.of(context).size.height / 60,
                                  right:
                                      MediaQuery.of(context).size.height / 60,
                                  bottom:
                                      MediaQuery.of(context).size.height / 60,
                                ),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              150,
                                    ),
                                    Divider(
                                      color: background,
                                      thickness: 2,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                doctor_corner_image[index],
                                              ),
                                              maxRadius: 40,
                                            ),
                                            Text(
                                              "${doctor_corners_items[index].name}",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontFamily: 'semibold',
                                                fontSize: 19,
                                                color: textcolor,
                                              ),
                                            ),
                                          ],
                                        ),
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
              ),
            ],
          ),
        ));
  }

  fetch_doctor_corners_items() async {
    var doctor_details = await FirebaseFirestore.instance
        .collection('/doctor_corners_items')
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
    map_doctor_corners_items(doctor_details);
  }

  map_doctor_corners_items(QuerySnapshot<Map<String, dynamic>> data) {
    var _doctor_corners_items =
        data.docs.map((item) => Item(id: item.id, name: item['Name'])).toList();

    setState(() {
      doctor_corners_items = _doctor_corners_items;
    });
  }

  Future doctor_corners_image() async {
    ListResult result =
        await FirebaseStorage.instance.ref().child("/doctors_corner").list();
    List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      doctor_corner_image.add(fileUrl);
    });

    setState(() {
      doctor_corner_image;
    });
    Navigator.of(context).pop();
    return doctor_corner_image;
  }
}
