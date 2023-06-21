import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:unicons/unicons.dart';

import '../Models/labtest_package_detail.dart';

import '../const.dart';
import '../lab/labtest_commonscreen.dart';

class lab_search extends StatefulWidget {
  const lab_search({Key? key}) : super(key: key);

  @override
  State<lab_search> createState() => _lab_searchState();
}

class _lab_searchState extends State<lab_search> {
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
                      "Search Lab Packages",
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
                      hintText: "Search for Lab Packages"),
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
                      .collection("/Lab_packages")
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
                        labtest_packages(
                            id: item.id,
                            cutprice: item['Cutprice'],
                            info: item['Info'],
                            name: item['Name'],
                            price: item['Price'],
                            sampletype: item['SampleType'],
                            fastingrequired: item['FastingRequired'],
                            tubetype: item['TubeType'],
                            packagesinclude: item['PackagesInclude'],
                            description: item['Description']);
                        return Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height / 60,
                            right: MediaQuery.of(context).size.height / 60,
                            bottom: MediaQuery.of(context).size.height / 60,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(
                                  () => labtest_commonscreen(
                                        heading: "Package Information",
                                        name: item['Name'],
                                        cutprice: item['Cutprice'],
                                        info: item['Info'],
                                        price: item['Price'],
                                        sampletype: item['SampleType'],
                                        fastingrequired:
                                            item['FastingRequired'],
                                        tubetype: item['TubeType'],
                                        packagesinclude:
                                            item['PackagesInclude'],
                                        description: item['Description'],
                                      ),
                                  transition: Transition.rightToLeft);
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
                                        "${item["Info"]}",
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
}
