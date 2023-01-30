import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'Models/doctor_model.dart';
import 'buy and cart/cart.dart';
import 'const.dart';

class homecare extends StatefulWidget {
  const homecare({Key? key}) : super(key: key);

  @override
  State<homecare> createState() => _homecareState();
}

class _homecareState extends State<homecare> {
  Color textcolor = Color(0xff001849);
  Color bluecolor_bg = Color(0xffDAE1FF);
  Color background = Color(0xffF4F3FB);

  List homecare_images = [];
  List<doc> homecare_services = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_homecare_details();
    homecareservice_images();
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
                              "Homecare",
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
                                Get.to(() => cart(),
                                    transition: Transition.rightToLeft);
                              },
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
                                style: TextStyle(color: Color(0xff01bdf3)),
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
              Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 50,
                    left: MediaQuery.of(context).size.height / 60,
                    right: MediaQuery.of(context).size.height / 200,
                  ),
                  child: Text(
                    "Available Services",
                    style: TextStyle(
                      fontFamily: 'semibold',
                      fontSize: 20,
                      color: textcolor,
                    ),
                  )),
              Expanded(
                child: Container(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 5.5,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: homecare_images.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            color: background,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 60,
                                left: MediaQuery.of(context).size.height / 60,
                                right: MediaQuery.of(context).size.height / 60,
                                bottom: MediaQuery.of(context).size.height / 60,
                              ),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height / 8,
                                    decoration: BoxDecoration(
                                      color: bluecolor_bg,
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
                                            radius: 40,
                                            foregroundImage: NetworkImage(
                                              "${homecare_images[index]}",
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "${homecare_services[index].name}",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontFamily: 'semibold',
                                                  fontSize: 19,
                                                  color: textcolor,
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    350,
                                              ),
                                              Text(
                                                "${homecare_services[index].hospital}",
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
                                ],
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

  fetch_homecare_details() async {
    var doctor_details =
        await FirebaseFirestore.instance.collection('homecare_details').get();
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
        .map((item) => doc(
            id: item.id,
            hospital: item['Company'],
            name: item['Name'],
            specialist: item['Info'],
            bio: item['Bio'],
            experience: item['Experience'],
            workinghours: item['Workinghours']))
        .toList();

    setState(() {
      homecare_services = _doctor_deatils_list;
    });
  }

  Future homecareservice_images() async {
    ListResult result = await FirebaseStorage.instance
        .ref()
        .child("/homecare_service_images")
        .list();
    List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      homecare_images.add(fileUrl);
    });

    setState(() {
      homecare_images;
    });
    Navigator.of(context).pop();
    return homecare_images;
  }
}
