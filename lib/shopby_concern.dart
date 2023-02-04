import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/product_commonscreen/Common%20Screen.dart';

import 'Models/popularcategories_model.dart';
import 'Models/topdeals_model.dart';

class shopbyconcern extends StatefulWidget {
  String heading3;

  shopbyconcern({Key? key, required this.heading3}) : super(key: key);

  @override
  State<shopbyconcern> createState() => _shopbyconcernState();
}

class _shopbyconcernState extends State<shopbyconcern> {
  Color textcolor = Color(0xD9181818);
  Color textcolor_light = Color(0x99181818);
  Color medicine_colour_button_1 = Color(0xff07DAEB);
  Color medicine_colour_button_2 = Color(0xff5093FE);
  Color background = Color(0xffD9D9D9);
  Color white = Color(0xffffffff);
  Color search_bg = Color(0x1A000000);
  Color bluecolor = Color(0xff007AFF);

  List shopbycenern_images = [];
  List<topdeals> shopbycenern_items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_conern_items();
    concern_images();
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
                                "${widget.heading3}",
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
                          child: Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 60,
                                left: MediaQuery.of(context).size.height / 60,
                                //right: MediaQuery.of(context).size.height / 200,
                                bottom: MediaQuery.of(context).size.height / 60,
                              ),
                              child: Text(
                                "All ${widget.heading3} Products",
                                style: TextStyle(
                                  fontFamily: 'semibold',
                                  fontSize: 21,
                                  color: textcolor,
                                ),
                              )),
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 60,
                              left: MediaQuery.of(context).size.height / 60,
                              right: MediaQuery.of(context).size.height / 60,
                              bottom: MediaQuery.of(context).size.height / 80,
                            ),
                            child: SizedBox(
                              // height: MediaQuery.of(context).size.height / 5.5,
                              width: MediaQuery.of(context).size.width,
                              child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 2 / 3,
                                    mainAxisSpacing: 20,
                                    crossAxisCount: 2,
                                  ),
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: shopbycenern_images.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(
                                            () => product_common_screen(
                                                  heading: "Product Detail",
                                                  image_url:
                                                      shopbycenern_images[
                                                          index],
                                                  name:
                                                      shopbycenern_items[index]
                                                          .name,
                                                  precaution_and_warning:
                                                      shopbycenern_items[index]
                                                          .precaution_and_warning,
                                                  sideeffect:
                                                      shopbycenern_items[index]
                                                          .sideeffect,
                                                  doses:
                                                      shopbycenern_items[index]
                                                          .doses,
                                                  uses:
                                                      shopbycenern_items[index]
                                                          .uses,
                                                  medicaldiscription:
                                                      shopbycenern_items[index]
                                                          .medicaldiscription,
                                                  company:
                                                      shopbycenern_items[index]
                                                          .company,
                                                  quantity:
                                                      shopbycenern_items[index]
                                                          .quantity,
                                                  cuttopdeals:
                                                      shopbycenern_items[index]
                                                          .cuttopdeals,
                                                  price:
                                                      shopbycenern_items[index]
                                                          .price,
                                                ),
                                            transition: Transition.rightToLeft);
                                      },
                                      child: Column(
                                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: white,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 40,
                                                  spreadRadius: 3,
                                                  color: Color(0xffD2D1D5),
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
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
                                                      "${shopbycenern_images[index]}",
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        "${shopbycenern_items[index].name}",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'semibold',
                                                          fontSize: 16,
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
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "₹${shopbycenern_items[index].price}",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'medium',
                                                              fontSize: 16,
                                                              color: bluecolor,
                                                            ),
                                                          ),
                                                          Text(
                                                            "₹${shopbycenern_items[index].cuttopdeals}",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
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

  fetch_conern_items() async {
    var _essential_data = await FirebaseFirestore.instance
        .collection('/shop by concern')
        .doc(widget.heading3)
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
    map_category_data(_essential_data);
  }

  map_category_data(QuerySnapshot<Map<String, dynamic>> data) {
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
            precaution_and_warning: item['Precaution_and_warning']))
        .toList();

    setState(() {
      shopbycenern_items = cart_item;
    });
    print(shopbycenern_items);
    return shopbycenern_items;
  }

  Future concern_images() async {
    ListResult result = await FirebaseStorage.instance
        .ref()
        .child("/shop by concern/${widget.heading3}")
        .list();
    List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      shopbycenern_images.add(fileUrl);
    });

    setState(() {
      shopbycenern_images;
    });
    print(shopbycenern_images);
    Navigator.of(context).pop();
    return shopbycenern_images;
  }
}
