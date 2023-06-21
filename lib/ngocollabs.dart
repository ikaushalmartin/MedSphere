import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'Models/lab_cart_model.dart';
import 'Models/popularcategories_model.dart';
import 'lab/lab_cart.dart';

class ngocollabs extends StatefulWidget {
  const ngocollabs({Key? key}) : super(key: key);

  @override
  State<ngocollabs> createState() => _ngocollabsState();
}

class _ngocollabsState extends State<ngocollabs> {
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
  Color textcolor_white = Color(0xffACAEBA);

  List ngoimages = [];
  List<lab_cartmodel> ngo_data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_ngo_data();
    ngoimages_tiles();
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
                        "Our NGO Collabs",
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
                height: MediaQuery.of(context).size.height / 60,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    //  top: MediaQuery.of(context).size.height / 60,
                    left: MediaQuery.of(context).size.height / 60,
                    right: MediaQuery.of(context).size.height / 60,
                    // bottom: MediaQuery.of(context).size.height / 80,
                  ),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: ngoimages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height / 60,
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(6),
                                        topRight: Radius.circular(6)),
                                    child: Image.network("${ngoimages[index]}",
                                        scale: 1)),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width / 60,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).size.height /
                                              80,
                                      left: MediaQuery.of(context).size.height /
                                          60,
                                      right:
                                          MediaQuery.of(context).size.height /
                                              60),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ngo_data[index].name,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'medium',
                                          fontSize: 16,
                                          color: textcolor,
                                        ),
                                      ),
                                      Text(
                                        "${ngo_data[index].cutprice}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'medium',
                                          fontSize: 14,
                                          color: textcolor_white,
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.width /
                                                40,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            color: bluecolor,
                                            size: 20,
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  60),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.3,
                                            child: Text(
                                              "${ngo_data[index].quantity}",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontFamily: 'regular',
                                                fontSize: 14,
                                                color: textcolor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              140),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: bluecolor,
                                            size: 20,
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  60),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.3,
                                            child: Text(
                                              "${ngo_data[index].packages}",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: 'regular',
                                                  fontSize: 14,
                                                  color: textcolor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ));
  }

  fetch_ngo_data() async {
    var popular_categories =
        await FirebaseFirestore.instance.collection('ngo_data').get();
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
    var _popular_categories_data = data.docs
        .map((item) => lab_cartmodel(
            id: item.id,
            name: item['name'],
            cutprice: item['about'],
            packages: item['address'],
            price: item['email'],
            quantity: item['number']))
        .toList();

    setState(() {
      ngo_data = _popular_categories_data;
    });
  }

  Future ngoimages_tiles() async {
    ListResult result =
        await FirebaseStorage.instance.ref().child("/ngo_images").list();
    List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      ngoimages.add(fileUrl);
    });

    setState(() {
      ngoimages;
    });
    Navigator.of(context).pop();
    return ngoimages;
  }
}
