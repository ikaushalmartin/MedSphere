import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'const.dart';
import 'Models/doctor_model.dart';
import 'orderbyprescription.dart';

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
    Color textcolor = Color(0xff001849);
    Color bluecolor_bg = Color(0xffDAE1FF);
    Color background = Color(0xffF4F3FB);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: background,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: background,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 50,
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 200),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              FirebaseAuth.instance.signOut();
                            },
                            child: CircleAvatar(
                              child: Image.asset("images/1.png"),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Doctor",
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
                              onPressed: () {},
                              icon: Icon(Icons.shopping_cart_outlined),
                              color: textcolor,
                            ),
                          )
                        ],
                      ), //toprow
                      SizedBox(height: MediaQuery.of(context).size.height / 80),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.35,
                              decoration: BoxDecoration(
                                color: bluecolor_bg,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextField(
                                onChanged: (value) {},
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(color: textcolor),
                                textAlign: TextAlign.left,
                                decoration: kTextFieldDecoration.copyWith(
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: "Search"),
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width / 6,
                                decoration: BoxDecoration(
                                  color: bluecolor_bg,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Theme(
                                  data: ThemeData(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.search),
                                    color: textcolor,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 70),
                      //searchbar
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    // height: MediaQuery.of(context).size.height / 1.451,
                    //  width: MediaQuery.of(context).size.width,
                    // color: Colors.white,
                    child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: background,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 60,
                          left: MediaQuery.of(context).size.height / 60,
                          right: MediaQuery.of(context).size.height / 60,
                          bottom: MediaQuery.of(context).size.height / 80,
                        ),
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height / 5.5,
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
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.07,
                                        decoration: BoxDecoration(
                                            color: background,
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
                    Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 50,
                          left: MediaQuery.of(context).size.height / 60,
                          right: MediaQuery.of(context).size.height / 200,
                          bottom: MediaQuery.of(context).size.height / 60,
                        ),
                        child: Text(
                          "Popular Doctors",
                          style: TextStyle(
                            fontFamily: 'semibold',
                            fontSize: 20,
                            color: textcolor,
                          ),
                        )),
                    Container(
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
                              itemCount: doctors_image_list.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  color: background,
                                  child: Column(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                8,
                                        decoration: BoxDecoration(
                                          color: bluecolor_bg,
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                radius: 40,
                                                foregroundImage: NetworkImage(
                                                  "${doctors_image_list[index]}",
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${doctor_deatils_list[index].name}",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontFamily: 'semibold',
                                                      fontSize: 19,
                                                      color: textcolor,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            350,
                                                  ),
                                                  Text(
                                                    "${doctor_deatils_list[index].hospital}",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontFamily: 'regular',
                                                      fontSize: 16,
                                                      color: textcolor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                80,
                                      )
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
