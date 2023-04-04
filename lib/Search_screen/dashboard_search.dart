import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/product_commonscreen/Common%20Screen.dart';
import 'package:unicons/unicons.dart';

import '../Models/topdeals_model.dart';
import '../const.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
                      "Search Medicine and Products",
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
                      hintText: "Search for Medicine and Products"),
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
                      .collection("/Medicine_and_Products")
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
                        topdeals(
                            id: item.id,
                            cuttopdeals: item['Cutprice'],
                            name: item['Name'],
                            price: item['Price'],
                            quantity: item['Quantity'],
                            company: item['Company'],
                            medicaldiscription: item['Medical_Discription'],
                            uses: item['Uses'],
                            doses: item['Doses'],
                            sideeffect: item['Side_Effect'],
                            precaution_and_warning:
                                item['Precaution_and_warning'],
                            salts: item['Salts']);
                        return Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height / 60,
                            right: MediaQuery.of(context).size.height / 60,
                            bottom: MediaQuery.of(context).size.height / 60,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              fetch_and_move(
                                "Medicine Detail",
                                item['Name'],
                                item['Precaution_and_warning'],
                                item['Side_Effect'],
                                item['Doses'],
                                item['Uses'],
                                item['Medical_Discription'],
                                item['Company'],
                                item['Quantity'],
                                item['Cutprice'],
                                item['Price'],
                                item['Salts'],
                              );
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
                                        "${item["Quantity"]}",
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
      String heading,
      String name,
      String precaution_and_warning,
      String sideeffect,
      String doses,
      String uses,
      String medicaldiscription,
      String company,
      String quantity,
      String cuttopdeals,
      String price,
      String ingredients) async {
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
    final String imagePath = ("/Images/Medicine_and_Product/$name.jpg");
    String imageUrl = await storage.ref().child(imagePath).getDownloadURL();
    Navigator.of(context).pop();
    Get.to(
        () => product_common_screen(
              heading: "Product Detail",
              image_url: imageUrl,
              name: name,
              precaution_and_warning: precaution_and_warning,
              sideeffect: sideeffect,
              doses: doses,
              uses: uses,
              medicaldiscription: medicaldiscription,
              company: company,
              quantity: quantity,
              cuttopdeals: cuttopdeals,
              price: price,
              ingredients: ingredients,
            ),
        transition: Transition.rightToLeft);
  }
}
