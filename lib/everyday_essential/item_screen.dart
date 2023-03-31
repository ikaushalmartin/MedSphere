import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Models/topdeals_model.dart';
import '../product_commonscreen/Common Screen.dart';

class essential_items_items_screen extends StatefulWidget {
  String headding;
  essential_items_items_screen({Key? key, required this.headding})
      : super(key: key);

  @override
  State<essential_items_items_screen> createState() =>
      _essential_items_items_screenState();
}

class _essential_items_items_screenState
    extends State<essential_items_items_screen> {
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
  Color textcolor_light = Color(0xffACAEBA);

  List essential_items_images = [];
  List<topdeals> essential_items_list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_essential_items();
    essesntial_categories_images();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        widget.headding,
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
              Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height / 60,
                    right: MediaQuery.of(context).size.height / 60,
                    bottom: MediaQuery.of(context).size.height / 100,
                  ),
                  child: Text(
                    "Essential Items",
                    style: TextStyle(
                      fontFamily: 'medium',
                      fontSize: 16,
                      color: textcolor,
                    ),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
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
                      itemCount: essential_items_images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                                () => product_common_screen(
                                      heading: "Product Detail",
                                      image_url: essential_items_images[index],
                                      name: essential_items_list[index].name,
                                      precaution_and_warning:
                                          essential_items_list[index]
                                              .precaution_and_warning,
                                      sideeffect: essential_items_list[index]
                                          .sideeffect,
                                      doses: essential_items_list[index].doses,
                                      uses: essential_items_list[index].uses,
                                      medicaldiscription:
                                          essential_items_list[index]
                                              .medicaldiscription,
                                      company:
                                          essential_items_list[index].company,
                                      quantity:
                                          essential_items_list[index].quantity,
                                      cuttopdeals: essential_items_list[index]
                                          .cuttopdeals,
                                      price: essential_items_list[index].price,
                                      ingredients:
                                          essential_items_list[index].salts,
                                    ),
                                transition: Transition.rightToLeft);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height / 60,
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 80,
                                  left: MediaQuery.of(context).size.height / 60,
                                  right:
                                      MediaQuery.of(context).size.height / 60,
                                  bottom:
                                      MediaQuery.of(context).size.height / 80,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      foregroundImage: NetworkImage(
                                        "${essential_items_images[index]}",
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          essential_items_list[index].name,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontFamily: 'medium',
                                            fontSize: 16,
                                            color: textcolor,
                                          ),
                                        ),
                                        Text(
                                          essential_items_list[index].price,
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
              ),
            ],
          ),
        ));
  }

  fetch_essential_items() async {
    var _essential_data = await FirebaseFirestore.instance
        .collection('everyday_essentials')
        .doc(widget.headding)
        .collection("items")
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
    map_cart_dataforchecklab(_essential_data);
  }

  map_cart_dataforchecklab(QuerySnapshot<Map<String, dynamic>> data) {
    var cart_item = data.docs
        .map((item) => topdeals(
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
            precaution_and_warning: item['Precaution_and_warning'],
            salts: item['Salts']))
        .toList();
    setState(() {
      essential_items_list = cart_item;
    });

    return essential_items_list;
  }

  Future essesntial_categories_images() async {
    ListResult result = await FirebaseStorage.instance
        .ref()
        .child("/everyday_essential/${widget.headding}")
        .list();
    List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      essential_items_images.add(fileUrl);
    });

    setState(() {
      essential_items_images;
    });
    Navigator.of(context).pop();
    return essential_items_images;
  }
}
