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
  Color textcolor = Color(0xD9181818);
  Color textcolor_light = Color(0x99181818);
  Color medicine_colour_button_1 = Color(0xff07DAEB);
  Color medicine_colour_button_2 = Color(0xff5093FE);
  Color background = Color(0xffD9D9D9);
  Color white = Color(0xffffffff);
  Color search_bg = Color(0x1A000000);

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
        resizeToAvoidBottomInset: false,
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
                                "${widget.headding}",
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

                    SizedBox(height: MediaQuery.of(context).size.height / 70),
                    //searchbar
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    // height: MediaQuery.of(context).size.height / 1.451,
                    //  width: MediaQuery.of(context).size.width,
                    color: background,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 150,
                        ),
                        Container(
                          color: white,
                          child: Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 60,
                                left: MediaQuery.of(context).size.height / 60,
                                //right: MediaQuery.of(context).size.height / 200,
                                bottom: MediaQuery.of(context).size.height / 60,
                              ),
                              child: Text(
                                "Essential Items",
                                style: TextStyle(
                                  fontFamily: 'semibold',
                                  fontSize: 20,
                                  color: textcolor,
                                ),
                              )),
                        ),
                        Container(
                          color: white,
                          child: Padding(
                            padding: EdgeInsets.only(
                              // top: MediaQuery.of(context).size.height / 80,
                              left: MediaQuery.of(context).size.height / 60,
                              right: MediaQuery.of(context).size.height / 60,
                              bottom: MediaQuery.of(context).size.height / 80,
                            ),
                            child: SizedBox(
                              // height: MediaQuery.of(context).size.height / 5.5,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: essential_items_images.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(
                                            () => product_common_screen(
                                                  heading: "Product Detail",
                                                  image_url:
                                                      essential_items_images[
                                                          index],
                                                  name: essential_items_list[
                                                          index]
                                                      .name,
                                                  precaution_and_warning:
                                                      essential_items_list[
                                                              index]
                                                          .precaution_and_warning,
                                                  sideeffect:
                                                      essential_items_list[
                                                              index]
                                                          .sideeffect,
                                                  doses: essential_items_list[
                                                          index]
                                                      .doses,
                                                  uses: essential_items_list[
                                                          index]
                                                      .uses,
                                                  medicaldiscription:
                                                      essential_items_list[
                                                              index]
                                                          .medicaldiscription,
                                                  company: essential_items_list[
                                                          index]
                                                      .company,
                                                  quantity:
                                                      essential_items_list[
                                                              index]
                                                          .quantity,
                                                  cuttopdeals:
                                                      essential_items_list[
                                                              index]
                                                          .cuttopdeals,
                                                  price: essential_items_list[
                                                          index]
                                                      .price,
                                                  ingredients:
                                                      essential_items_list[
                                                              index]
                                                          .salts,
                                                ),
                                            transition: Transition.rightToLeft);
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: white,
                                        child: Column(
                                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Divider(
                                              color: background,
                                              thickness: 2,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  8,
                                              decoration: BoxDecoration(
                                                color: white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 40,
                                                      foregroundImage:
                                                          NetworkImage(
                                                        "${essential_items_images[index]}",
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          "${essential_items_list[index].name}",
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'semibold',
                                                            fontSize: 19,
                                                            color: textcolor,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              350,
                                                        ),
                                                        Text(
                                                          "${essential_items_list[index].price}",
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'medium',
                                                            fontSize: 16,
                                                            color:
                                                                textcolor_light,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        )
                      ],
                    )),
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
