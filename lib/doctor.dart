import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/product_commonscreen/doctorCommonscreen.dart';

import 'Models/doctor_model.dart';

class doctor extends StatefulWidget {
  @override
  State<doctor> createState() => _doctorState();
}

class _doctorState extends State<doctor> {
  List top_images_list = [];
  List doctors_image_list = [];
  List<doc> doctor_deatils_list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    top_images();
    doctors_image();
    fetch_popular_categories();
  }

  @override
  Widget build(BuildContext context) {
    Color white = Color(0xffffffff);
    Color textcolor = Color(0xff1D1D1F);
    Color textcolor_white = Color(0xff949494);
    Color bluecolor = Color(0xff007AFF);
    Color bluecolor_bg = Color(0xffDAE1FF);
    Color redcolor = Color(0xffFE2D54);
    Color background = Color(0xffF2F1F6);

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
                    SizedBox(height: MediaQuery.of(context).size.height / 70),
                    Padding(
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
                              "Doctors",
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
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: white,
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0.0, 0.0001),
                                blurRadius: 0.0001,
                                spreadRadius: 0.0003,
                                color: Color(0xffD2D1D5),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 60,
                              left: MediaQuery.of(context).size.height / 60,
                              right: MediaQuery.of(context).size.height / 60,
                              bottom: MediaQuery.of(context).size.height / 80,
                            ),
                            child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 5.5,
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: top_images_list.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, right: 10),
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.07,
                                            decoration: BoxDecoration(
                                                color: white,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        "${top_images_list[index]}")))),
                                      );
                                    })),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 35,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height / 60,
                            right: MediaQuery.of(context).size.height / 60,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 40,
                                      spreadRadius: 3,
                                      color: Color(0xffD2D1D5),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              60,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              60,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              200,
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              60,
                                        ),
                                        child: Text(
                                          "Popular Doctors",
                                          style: TextStyle(
                                            fontFamily: 'semibold',
                                            fontSize: 21,
                                            color: textcolor,
                                          ),
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.height /
                                                60,
                                        right:
                                            MediaQuery.of(context).size.height /
                                                60,
                                        bottom:
                                            MediaQuery.of(context).size.height /
                                                80,
                                      ),
                                      child: SizedBox(
                                        // height: MediaQuery.of(context).size.height / 5.5,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics: BouncingScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                doctors_image_list.length,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  Get.to(
                                                      () => doctorcommonscreen(
                                                            name:
                                                                doctor_deatils_list[
                                                                        index]
                                                                    .name,
                                                            bio:
                                                                doctor_deatils_list[
                                                                        index]
                                                                    .bio,
                                                            workinghours:
                                                                doctor_deatils_list[
                                                                        index]
                                                                    .workinghours,
                                                            experience:
                                                                doctor_deatils_list[
                                                                        index]
                                                                    .experience,
                                                            specialist:
                                                                doctor_deatils_list[
                                                                        index]
                                                                    .specialist,
                                                            hospital:
                                                                doctor_deatils_list[
                                                                        index]
                                                                    .hospital,
                                                            imageurl:
                                                                doctors_image_list[
                                                                    index],
                                                          ),
                                                      transition: Transition
                                                          .rightToLeft);
                                                },
                                                child: Column(
                                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Divider(
                                                      color: background,
                                                      thickness: 2,
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              8,
                                                      decoration: BoxDecoration(
                                                        color: white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            CircleAvatar(
                                                              radius: 40,
                                                              foregroundImage:
                                                                  NetworkImage(
                                                                "${doctors_image_list[index]}",
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
                                                                  "${doctor_deatils_list[index].name}",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'semibold',
                                                                    fontSize:
                                                                        19,
                                                                    color:
                                                                        textcolor,
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
                                                                  "${doctor_deatils_list[index].specialist}",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'medium',
                                                                    fontSize:
                                                                        16,
                                                                    color:
                                                                        bluecolor,
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
                                              );
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ));
  }

  fetch_popular_categories() async {
    var doctor_details =
        await FirebaseFirestore.instance.collection('doctors detail').get();
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));
    map_doctor_details(doctor_details);
  }

  map_doctor_details(QuerySnapshot<Map<String, dynamic>> data) {
    print("in");
    var _doctor_deatils_list = data.docs
        .map((item) => doc(
            id: item.id,
            hospital: item['Hospital'],
            name: item['Name'],
            specialist: item['Specialist'],
            bio: item['Bio'],
            workinghours: item['Workinghours'],
            experience: item['Experience']))
        .toList();

    setState(() {
      doctor_deatils_list = _doctor_deatils_list;
    });
  }

  Future top_images() async {
    ListResult result =
        await FirebaseStorage.instance.ref().child("/doctor_top_image").list();
    List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      top_images_list.add(fileUrl);
    });

    setState(() {
      top_images_list;
    });

    return top_images_list;
  }

  Future doctors_image() async {
    ListResult result =
        await FirebaseStorage.instance.ref().child("/doctors_images").list();
    List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      doctors_image_list.add(fileUrl);
    });

    setState(() {
      doctors_image_list;
    });
    Navigator.of(context).pop();
    return doctors_image_list;
  }
}
