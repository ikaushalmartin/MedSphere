import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../Models/surgical_model.dart';
import '../../buy and cart/cart.dart';
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
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);

  Color background = Color(0xffF1F1F1);
  Color textcolor_light = Color(0xffACAEBA);

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
    Color textcolor = Color(0xff1A1D44);
    Color bluecolor = Color(0xff014CC4);

    Color white = Color(0xffffffff);
    Color background = Color(0xffF1F1F1);
    Color textcolor_light = Color(0xffACAEBA);
    Color search_bg = Color(0x1A000000);
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
                child: Padding(
                  padding: EdgeInsets.only(
                      //   top: MediaQuery.of(context).size.height / 80,
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
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
                            widget.category,
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 16,
                              color: textcolor,
                            ),
                          ),
                        ],
                      ),
                      Theme(
                        data: ThemeData(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Get.to(() => const surgical_cart(),
                                transition: Transition.rightToLeft);
                          },
                          icon: Icon(Icons.shopping_cart_outlined),
                          color: textcolor,
                          iconSize: 20,
                        ),
                      )
                    ],
                  ),
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
                    "Available Surgicals",
                    style: TextStyle(
                      fontFamily: 'medium',
                      fontSize: 16,
                      color: textcolor,
                    ),
                  )),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height / 60,
                    right: MediaQuery.of(context).size.height / 60,
                  ),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
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
                                      foregroundImage:
                                          NetworkImage(surgical_image[index]),
                                      radius: 30,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.5,
                                          child: Text(
                                            "${surgical_info[index].name}",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              fontFamily: 'medium',
                                              fontSize: 16,
                                              color: textcolor,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "${surgical_info[index].company}",
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
