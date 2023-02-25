import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../Models/surgical_model.dart';
import '../../buy and cart/surgical_cart.dart';
import '../../surgical/surgical_productscreen.dart';

class surgical_instruments extends StatefulWidget {
  String itemname, category;
  surgical_instruments(
      {Key? key, required this.itemname, required this.category})
      : super(key: key);

  @override
  State<surgical_instruments> createState() => _surgical_instrumentsState();
}

class _surgical_instrumentsState extends State<surgical_instruments> {
  Color bluecolor_bg = Color(0xffDAE1FF);
  Color textcolor = Color(0xD9181818);
  Color textcolor_light = Color(0x99181818);
  Color bluecolor = Color(0xff5093FE);
  Color background = Color(0xffD9D9D9);
  Color white = Color(0xffffffff);
  Color search_bg = Color(0x1A000000);

  List surgical_image = [];
  List<surgical_model> surgical_info = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_rentals_details();
    top_images();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: background,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                                "${widget.category}",
                                style: TextStyle(
                                  fontFamily: 'semibold',
                                  fontSize: 24,
                                  color: textcolor,
                                ),
                              ),
                            ),
                            Theme(
                              data: ThemeData(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Get.to(() => surgical_cart(),
                                      transition: Transition.rightToLeft);
                                },
                                icon: Icon(Icons.shopping_cart_outlined),
                                color: textcolor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ), //toprow

                    SizedBox(height: MediaQuery.of(context).size.height / 70),
                    //searchbar
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 150,
              ),
              Container(
                color: white,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 50,
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 200,
                    ),
                    child: Text(
                      "Available Surgicals",
                      style: TextStyle(
                        fontFamily: 'semibold',
                        fontSize: 20,
                        color: textcolor,
                      ),
                    )),
              ),
              Expanded(
                child: Container(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 5.5,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: surgical_image.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                  () => surgical_productscreen(
                                      imageurl: surgical_image[index],
                                      category: surgical_info[index].category,
                                      company: surgical_info[index].company,
                                      cutprice: surgical_info[index].cutprice,
                                      description:
                                          surgical_info[index].description,
                                      name: surgical_info[index].name,
                                      price: surgical_info[index].price,
                                      size: surgical_info[index].size,
                                      sterile: surgical_info[index].sterile,
                                      use: surgical_info[index].use),
                                  transition: Transition.rightToLeft);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: white,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  //top: MediaQuery.of(context).size.height / 60,
                                  left: MediaQuery.of(context).size.height / 60,
                                  right:
                                      MediaQuery.of(context).size.height / 60,
                                  bottom:
                                      MediaQuery.of(context).size.height / 60,
                                ),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              150,
                                    ),
                                    Divider(
                                      color: background,
                                      thickness: 2,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  surgical_image[index]),
                                              radius: 40,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      1.5,
                                                  child: Text(
                                                    "${surgical_info[index].name}",
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      fontFamily: 'semibold',
                                                      fontSize: 19,
                                                      color: textcolor,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      350,
                                                ),
                                                Text(
                                                  "${surgical_info[index].company}",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontFamily: 'medium',
                                                    fontSize: 16,
                                                    color: textcolor_light,
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
                            ),
                          );
                        }),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  fetch_rentals_details() async {
    var doctor_details = await FirebaseFirestore.instance
        .collection(
            '/doctor_corners_items/${widget.itemname}/${widget.category}')
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
    map_rental_details(doctor_details);
  }

  map_rental_details(QuerySnapshot<Map<String, dynamic>> data) {
    var _doctor_deatils_list = data.docs
        .map((item) => surgical_model(
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
            ))
        .toList();

    setState(() {
      surgical_info = _doctor_deatils_list;
    });
  }

  Future top_images() async {
    ListResult result = await FirebaseStorage.instance
        .ref()
        .child("/doctors_corner/${widget.itemname}/${widget.category}")
        .list();
    List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      surgical_image.add(fileUrl);
    });

    setState(() {
      surgical_image;
    });
    Navigator.of(context).pop();
    return surgical_image;
  }
}
