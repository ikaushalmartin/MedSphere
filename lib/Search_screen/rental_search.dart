import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:unicons/unicons.dart';

import '../Models/labtest_package_detail.dart';

import '../const.dart';
import '../doctor/doctor_model.dart';
import '../lab/labtest_commonscreen.dart';
import '../rentals/rental_commonscreen.dart';

class rental_search extends StatefulWidget {
  const rental_search({Key? key}) : super(key: key);

  @override
  State<rental_search> createState() => _rental_searchState();
}

class _rental_searchState extends State<rental_search> {
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
  Color textcolor_light = Color(0xffACAEBA);
  var inputText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Column(
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
                      "Search Medical Rentals",
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
              height: MediaQuery.of(context).size.height / 50,
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
                  textCapitalization: TextCapitalization.sentences,
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
                      hintText: "Search for Medical Rentals"),
                  onChanged: (val) {
                    setState(() {
                      inputText = val;
                      print(inputText);
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("/rental details")
                      .where("Name", isGreaterThanOrEqualTo: inputText)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Something went wrong"),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Text("Loading"),
                      );
                    }

                    return ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot item) {
                        doc(
                            id: item.id,
                            hospital: item['Company'],
                            name: item['Name'],
                            specialist: item['Use'],
                            bio: item['Description'],
                            experience: item['priceperday'],
                            workinghours: item['application']);
                        return Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height / 60,
                            right: MediaQuery.of(context).size.height / 60,
                            bottom: MediaQuery.of(context).size.height / 60,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              fetch_and_move(
                                  item['Name'],
                                  item['Company'],
                                  item['Description'],
                                  item['application'],
                                  item['priceperday'],
                                  item['Use']);
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
                                        MediaQuery.of(context).size.height / 60,
                                    left:
                                        MediaQuery.of(context).size.height / 60,
                                    right:
                                        MediaQuery.of(context).size.height / 60,
                                    bottom:
                                        MediaQuery.of(context).size.height / 60,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${item["Name"]}",
                                        style: TextStyle(
                                          fontFamily: 'medium',
                                          fontSize: 16,
                                          color: textcolor,
                                        ),
                                      ),
                                      Text(
                                        "${item["Use"]}",
                                        style: TextStyle(
                                          fontFamily: 'medium',
                                          fontSize: 14,
                                          color: textcolor_light,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        );
                      }).toList(),
                    );
                  }),
            ),
          ],
        )));
  }

  fetch_and_move(String name, String company, String desc, String application,
      String priceperday, String uses) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));
    final FirebaseStorage storage = FirebaseStorage.instance;
    final String imagePath = ("/rental images/$name.jpeg");
    String imageUrl = await storage.ref().child(imagePath).getDownloadURL();
    Navigator.of(context).pop();
    Get.to(
        () => rental_commonscreen(
            name: name,
            company: company,
            description: desc,
            available_for_time: application,
            priceperday: priceperday,
            use: uses,
            imageurl: imageUrl),
        transition: Transition.rightToLeft);
  }
}
