import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/rentals/rental_commonscreen.dart';
import 'package:medicineapp2/surgical/surgical_productscreen.dart';
import 'package:unicons/unicons.dart';

import '../Search_screen/surgical_search.dart';
import '../buy and cart/surgical_cart.dart';
import '../const.dart';
import '../doctor/doctor_model.dart';
import '../Models/surgical_model.dart';

class surgical extends StatefulWidget {
  const surgical({Key? key}) : super(key: key);

  @override
  State<surgical> createState() => _surgicalState();
}

class _surgicalState extends State<surgical> {
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color textcolor_light = Color(0xffACAEBA);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
  Color bluecolor_bg = Color(0xffDAE1FF);

  List surgical_image = [];
  List<surgical_model> surgical_info = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_rentals_details();
    top_images();
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
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height / 60,
                          right: MediaQuery.of(context).size.height / 200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
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
                                "Surgical",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 16,
                                  color: textcolor,
                                ),
                              ),
                            ],
                          ),
                          Theme(
                            data: ThemeData(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                            ),
                            child: IconButton(
                              onPressed: () {
                                Get.to(() => surgical_cart(),
                                    transition: Transition.rightToLeft);
                              },
                              icon: Icon(Icons.shopping_cart_outlined),
                              color: textcolor,
                              iconSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 20,
                        decoration: BoxDecoration(
                          color: background,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: TextFormField(
                          readOnly: true,
                          onTap: () {
                            Get.to(() => const surgical_search(),
                                transition: Transition.rightToLeft);
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: textcolor_light),
                          textAlign: TextAlign.left,
                          decoration: kTextFieldDecoration.copyWith(
                              prefixIcon: Icon(
                                UniconsLine.search,
                                color: bluecolor,
                                size: 23,
                              ),
                              contentPadding: EdgeInsets.only(left: 20),
                              hintText: "Search for Lab Packages"),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 80),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 60),
                  child: Text(
                    "Available Surgical Items",
                    style: TextStyle(
                      fontFamily: 'medium',
                      fontSize: 16,
                      color: textcolor,
                    ),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: surgical_image.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                              () => surgical_productscreen(
                                  imageurl: surgical_image[index],
                                  category: surgical_info[index].category,
                                  company: surgical_info[index].company,
                                  cutprice: surgical_info[index].cutprice,
                                  description: surgical_info[index].description,
                                  name: surgical_info[index].name,
                                  price: surgical_info[index].price,
                                  size: surgical_info[index].size,
                                  sterile: surgical_info[index].sterile,
                                  use: surgical_info[index].use),
                              transition: Transition.rightToLeft);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height / 60,
                            left: MediaQuery.of(context).size.height / 60,
                            right: MediaQuery.of(context).size.height / 60,
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 10,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    foregroundImage: NetworkImage(
                                      surgical_image[index],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.5,
                                        child: Text(
                                          "${surgical_info[index].name}",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontFamily: 'medium',
                                            fontSize: 14,
                                            color: textcolor,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "${surgical_info[index].company}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'medium',
                                          fontSize: 14,
                                          color: textcolor_light,
                                        ),
                                      ),
                                    ],
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
        ));
  }

  fetch_rentals_details() async {
    var doctor_details =
        await FirebaseFirestore.instance.collection('/surgical_items').get();
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));
    map_rental_details(doctor_details);
  }

  map_rental_details(QuerySnapshot<Map<String, dynamic>> data) {
    var _doctor_deatils_list = data.docs
        .map((item) => surgical_model(
              id: item.id,
              name: item["name"],
              price: item["price"],
              cutprice: item["cutprice"],
              use: item["use"],
              company: item["company"],
              sterile: item["sterile"],
              size: item["size"],
              category: item["category"],
              description: item["description"],
            ))
        .toList();

    setState(() {
      surgical_info = _doctor_deatils_list;
    });
  }

  Future top_images() async {
    ListResult result =
        await FirebaseStorage.instance.ref().child("/surgical_items").list();
    List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      surgical_image.add(fileUrl);
    });

    setState(() {
      surgical_image;
    });
    Navigator.of(context).pop();
    return surgical_image;
  }
}
