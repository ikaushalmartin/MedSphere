import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/doctor/doctorCommonscreen.dart';

import 'doctor_model.dart';

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
    Color textcolor = Color(0xff1A1D44);
    Color bluecolor = Color(0xff014CC4);
    Color white = Color(0xffffffff);
    Color background = Color(0xffF1F1F1);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: background,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        "Doctors Consultation",
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
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 100),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: white,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 5.5,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 60,
                            left: MediaQuery.of(context).size.height / 60,
                            right: MediaQuery.of(context).size.height / 60,
                            bottom: MediaQuery.of(context).size.height / 60,
                          ),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: top_images_list.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.07,
                                    decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(6),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "${top_images_list[index]}"))));
                              }),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height / 60,
                              right: MediaQuery.of(context).size.height / 60,
                              bottom: MediaQuery.of(context).size.height / 80,
                            ),
                            child: Text(
                              "Popular Doctors",
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 16,
                                color: textcolor,
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height / 60,
                            right: MediaQuery.of(context).size.height / 60,
                          ),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: doctors_image_list.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                        () => doctorcommonscreen(
                                              name: doctor_deatils_list[index]
                                                  .name,
                                              bio: doctor_deatils_list[index]
                                                  .bio,
                                              workinghours:
                                                  doctor_deatils_list[index]
                                                      .workinghours,
                                              experience:
                                                  doctor_deatils_list[index]
                                                      .experience,
                                              specialist:
                                                  doctor_deatils_list[index]
                                                      .specialist,
                                              hospital:
                                                  doctor_deatils_list[index]
                                                      .hospital,
                                              imageurl:
                                                  doctors_image_list[index],
                                            ),
                                        transition: Transition.rightToLeft);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).size.height /
                                              60,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius: 30,
                                              foregroundImage: NetworkImage(
                                                "${doctors_image_list[index]}",
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "${doctor_deatils_list[index].name}",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontFamily: 'medium',
                                                    fontSize: 16,
                                                    color: textcolor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      400,
                                                ),
                                                Text(
                                                  "${doctor_deatils_list[index].specialist}",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontFamily: 'medium',
                                                    fontSize: 14,
                                                    color: bluecolor,
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
                      ],
                    )
                  ],
                ),
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
              experience: item['Fees'],
            ))
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
