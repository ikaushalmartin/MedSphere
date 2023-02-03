import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/product_commonscreen/Common%20Screen.dart';

import 'Models/topdeals_model.dart';

class shop_by_category_items extends StatefulWidget {
  String heading3;
  shop_by_category_items({Key? key, required this.heading3}) : super(key: key);

  @override
  State<shop_by_category_items> createState() => _shop_by_category_itemsState();
}

class _shop_by_category_itemsState extends State<shop_by_category_items> {
  Color textcolor = Color(0xD9181818);
  Color textcolor_light = Color(0x99181818);
  Color medicine_colour_button_1 = Color(0xff07DAEB);
  Color medicine_colour_button_2 = Color(0xff5093FE);
  Color background = Color(0xffD9D9D9);
  Color white = Color(0xffffffff);
  Color search_bg = Color(0x1A000000);

  List category_item_images = [];
  List<topdeals> category_item_list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_category_items();
    category_images();
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
                          color: white,
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
                                  itemCount: category_item_images.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(
                                            () => product_common_screen(
                                                  heading: "Product Detail",
                                                  image_url:
                                                      category_item_images[
                                                          index],
                                                  name:
                                                      category_item_list[index]
                                                          .name,
                                                  precaution_and_warning:
                                                      category_item_list[index]
                                                          .precaution_and_warning,
                                                  sideeffect:
                                                      category_item_list[index]
                                                          .sideeffect,
                                                  doses:
                                                      category_item_list[index]
                                                          .doses,
                                                  uses:
                                                      category_item_list[index]
                                                          .uses,
                                                  medicaldiscription:
                                                      category_item_list[index]
                                                          .medicaldiscription,
                                                  company:
                                                      category_item_list[index]
                                                          .company,
                                                  quantity:
                                                      category_item_list[index]
                                                          .quantity,
                                                  cuttopdeals:
                                                      category_item_list[index]
                                                          .cuttopdeals,
                                                  price:
                                                      category_item_list[index]
                                                          .price,
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
                                                        "${category_item_images[index]}",
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
                                                          "${category_item_list[index].name}",
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
                                                          "${category_item_list[index].price}",
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
            precaution_and_warning: item['Precaution_and_warning']))
        .toList();

    setState(() {
      category_item_list = cart_item;
    });
    print(category_item_list);
    return category_item_list;
  }

  Future category_images() async {
    String a = widget.heading3;
    ListResult result = await FirebaseStorage.instance
        .ref()
        .child("/shop by category/$a")
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
