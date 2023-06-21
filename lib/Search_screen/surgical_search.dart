import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:unicons/unicons.dart';

import '../Models/surgical_model.dart';
import '../const.dart';

import '../rentals/rental_commonscreen.dart';
import '../surgical/surgical_productscreen.dart';

class surgical_search extends StatefulWidget {
  const surgical_search({Key? key}) : super(key: key);

  @override
  State<surgical_search> createState() => _surgical_searchState();
}

class _surgical_searchState extends State<surgical_search> {
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
                      "Search Surgicals",
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
                      hintText: "Search for Surgical Items"),
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
                      .collection("/surgical_items")
                      .where("name", isGreaterThanOrEqualTo: inputText)
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
                        surgical_model(
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
                        );
                        return Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height / 60,
                            right: MediaQuery.of(context).size.height / 60,
                            bottom: MediaQuery.of(context).size.height / 60,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              fetch_and_move(
                                  item["category"],
                                  item["company"],
                                  item["cutprice"],
                                  item["description"],
                                  item["name"],
                                  item["price"],
                                  item["size"],
                                  item["sterile"],
                                  item["use"]);
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
                                        "${item["name"]}",
                                        style: TextStyle(
                                          fontFamily: 'medium',
                                          fontSize: 16,
                                          color: textcolor,
                                        ),
                                      ),
                                      Text(
                                        "${item["use"]}",
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

  fetch_and_move(
      String category,
      String company,
      String cutprice,
      String desc,
      String name,
      String price,
      String size,
      String sterile,
      String use) async {
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
    final String imagePath = ("/surgical_items/$name.jpg");
    String imageUrl = await storage.ref().child(imagePath).getDownloadURL();
    Navigator.of(context).pop();
    Get.to(
        () => surgical_productscreen(
            imageurl: imageUrl,
            category: category,
            company: company,
            cutprice: cutprice,
            description: desc,
            name: name,
            price: price,
            size: size,
            sterile: sterile,
            use: use),
        transition: Transition.rightToLeft);
  }
}
