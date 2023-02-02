import 'dart:core';
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Models/popularcategories_model.dart';
import 'item_screen.dart';

class everyday_essentials extends StatefulWidget {
  const everyday_essentials({Key? key}) : super(key: key);

  @override
  State<everyday_essentials> createState() => _everyday_essentialsState();
}

class _everyday_essentialsState extends State<everyday_essentials> {
  Color heading_bluecolor_bg = Color(0xD9181818);
  Color textcolor = Color(0xff1D1D1F);
  Color textcolor_white = Color(0xff949494);
  Color textcolor_light = Color(0x4D181818);
  Color bluecolor = Color(0xff007AFF);
  Color white = Color(0xffffffff);
  Color redcolor = Color(0xffE46473);
  Color yellowcolor = Color(0xffF9BF80);
  Color background = Color(0xffF2F1F6);

  List everyday_essential_category_images = [];
  List<Item> everyday_essential_category_name = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_essential_categories();
    essesntial_categories_images();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: background,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                          "Everyday Essentials",
                          style: TextStyle(
                            fontFamily: 'semibold',
                            fontSize: 24,
                            color: textcolor,
                          ),
                        ),
                      ),
                      Text("")
                    ],
                  ),
                ),
              ), //toprow
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Padding(
                padding: EdgeInsets.only(
                  //  top: MediaQuery.of(context).size.height / 60,
                  left: MediaQuery.of(context).size.height / 60,
                  right: MediaQuery.of(context).size.height / 60,
                  // bottom: MediaQuery.of(context).size.height / 80,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 40,
                        spreadRadius: 3,
                        color: Color(0xffD2D1D5),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 60,
                    left: MediaQuery.of(context).size.height / 60,
                    right: MediaQuery.of(context).size.height / 60,
                    bottom: MediaQuery.of(context).size.height / 80,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Popular Categories",
                        style: TextStyle(
                          fontFamily: 'semibold',
                          fontSize: 21,
                          color: textcolor,
                        ),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          // height: MediaQuery.of(context).size.height / 1.3,
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 3 / 3,
                                mainAxisSpacing: 20,
                                crossAxisCount: 2,
                              ),
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  everyday_essential_category_images.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(() => essential_items_items_screen(),
                                        transition: Transition.rightToLeft);
                                  },
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.width /
                                                20,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        child: Image.network(
                                          "${everyday_essential_category_images[index]}",
                                          scale: 8,
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.width /
                                                50,
                                      ),
                                      Container(
                                        height: 32,
                                        child: Text(
                                          "${everyday_essential_category_name[index].name}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'medium',
                                            fontSize: 15,
                                            color: textcolor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              })),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
            ],
          ),
        ));
  }

  fetch_essential_categories() async {
    var popular_categories = await FirebaseFirestore.instance
        .collection('/everyday_essentials')
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
    map_ngo_data(popular_categories);
  }

  map_ngo_data(QuerySnapshot<Map<String, dynamic>> data) {
    var _popular_categories_data =
        data.docs.map((item) => Item(id: item.id, name: item['Name'])).toList();

    setState(() {
      everyday_essential_category_name = _popular_categories_data;
    });
  }

  Future essesntial_categories_images() async {
    ListResult result = await FirebaseStorage.instance
        .ref()
        .child("/everyday_essential")
        .list();
    List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      everyday_essential_category_images.add(fileUrl);
    });

    setState(() {
      everyday_essential_category_images;
    });
    Navigator.of(context).pop();
    return everyday_essential_category_images;
  }
}
