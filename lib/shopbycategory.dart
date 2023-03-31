import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/const.dart';
import 'package:medicineapp2/product_commonscreen/Common%20Screen.dart';

import 'Models/topdeals_model.dart';

class shop_by_category_items extends StatefulWidget {
  String heading3;
  shop_by_category_items({Key? key, required this.heading3}) : super(key: key);

  @override
  State<shop_by_category_items> createState() => _shop_by_category_itemsState();
}

class _shop_by_category_itemsState extends State<shop_by_category_items> {
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
  Color textcolor_light = Color(0xffACAEBA);

  List category_item_images = [];
  List<topdeals> category_item_list = [];

  get heading => widget.heading3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    category_images();
    fetch_category_items();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    mainAxisAlignment: MainAxisAlignment.start,
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
                        widget.heading3,
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
                  ),
                  child: Text(
                    "All ${widget.heading3} Products",
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
                    left: MediaQuery.of(context).size.height / 60,
                    right: MediaQuery.of(context).size.height / 60,
                  ),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height / 60,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: category_item_images.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                        () => product_common_screen(
                                              heading: "Product Detail",
                                              image_url:
                                                  category_item_images[index],
                                              name: category_item_list[index]
                                                  .name,
                                              precaution_and_warning:
                                                  category_item_list[index]
                                                      .precaution_and_warning,
                                              sideeffect:
                                                  category_item_list[index]
                                                      .sideeffect,
                                              doses: category_item_list[index]
                                                  .doses,
                                              uses: category_item_list[index]
                                                  .uses,
                                              medicaldiscription:
                                                  category_item_list[index]
                                                      .medicaldiscription,
                                              company: category_item_list[index]
                                                  .company,
                                              quantity:
                                                  category_item_list[index]
                                                      .quantity,
                                              cuttopdeals:
                                                  category_item_list[index]
                                                      .cuttopdeals,
                                              price: category_item_list[index]
                                                  .price,
                                              ingredients:
                                                  category_item_list[index]
                                                      .salts,
                                            ),
                                        transition: Transition.rightToLeft);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height /
                                          80,
                                      left: MediaQuery.of(context).size.height /
                                          60,
                                      right:
                                          MediaQuery.of(context).size.height /
                                              60,
                                      bottom:
                                          MediaQuery.of(context).size.height /
                                              80,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          foregroundImage: NetworkImage(
                                            "${category_item_images[index]}",
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.6,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  23,
                                              child: Text(
                                                "${category_item_list[index].name}",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontFamily: 'medium',
                                                  fontSize: 16,
                                                  color: textcolor,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "₹${category_item_list[index].price}",
                                                  style: TextStyle(
                                                    fontFamily: 'medium',
                                                    fontSize: 12,
                                                    color: bluecolor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      20,
                                                ),
                                                Text(
                                                  "MRP₹${category_item_list[index].cuttopdeals}",
                                                  style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    fontFamily: 'medium',
                                                    fontSize: 12,
                                                    color: textcolor_light,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  fetch_category_items() async {
    var _essential_data = await FirebaseFirestore.instance
        .collection('/shop by category')
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
            precaution_and_warning: item['Precaution_and_warning'],
            salts: item['Salts']))
        .toList();

    setState(() {
      category_item_list = cart_item;
    });
    print(category_item_list);
    return category_item_list;
  }

  Future category_images() async {
    print(heading);
    ListResult result = await FirebaseStorage.instance
        .ref()
        .child("/shop by category/$heading")
        .list();
    List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      category_item_images.add(fileUrl);
    });

    setState(() {
      category_item_images;
    });
    print(category_item_images);
    Navigator.of(context).pop();
    return category_item_images;
  }
}
