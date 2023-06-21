import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../doctor/doctor_model.dart';
import '../homecare/homecare_commonScreen.dart';

class homecare_available_partner extends StatefulWidget {
  String servicename;
  homecare_available_partner({Key? key, required this.servicename})
      : super(key: key);

  @override
  State<homecare_available_partner> createState() =>
      _homecare_available_partnerState();
}

class _homecare_available_partnerState
    extends State<homecare_available_partner> {
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color textcolor_light = Color(0xffACAEBA);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);

  List<doc> homecare_available_partner = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_homecare_availablepartners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
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
                    // top: MediaQuery.of(context).size.height / 50,
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
                      "${widget.servicename}",
                      style: TextStyle(
                        fontFamily: 'medium',
                        fontSize: 16,
                        color: textcolor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height / 60,
                  right: MediaQuery.of(context).size.height / 60,
                  bottom: MediaQuery.of(context).size.height / 100,
                ),
                child: Text(
                  "Available Partners",
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
                    itemCount: homecare_available_partner.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                              () => homecare_commonscreen(
                                    name:
                                        homecare_available_partner[index].name,
                                    specialist:
                                        homecare_available_partner[index]
                                            .specialist,
                                    available_for_time:
                                        homecare_available_partner[index]
                                            .workinghours,
                                    priceperday:
                                        homecare_available_partner[index]
                                            .hospital,
                                    experience:
                                        homecare_available_partner[index]
                                            .experience,
                                    bio: homecare_available_partner[index].bio,
                                  ),
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
                                right: MediaQuery.of(context).size.height / 60,
                                bottom: MediaQuery.of(context).size.height / 80,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${homecare_available_partner[index].name}",
                                      style: TextStyle(
                                        fontFamily: 'medium',
                                        fontSize: 16,
                                        color: textcolor,
                                      ),
                                    ),
                                    Text(
                                      "${homecare_available_partner[index].specialist}",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'medium',
                                        fontSize: 14,
                                        color: textcolor_light,
                                      ),
                                    ),
                                  ],
                                ),
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
      ),
    );
  }

  fetch_homecare_availablepartners() async {
    var doctor_details = await FirebaseFirestore.instance
        .collection('homecare_details')
        .doc('${widget.servicename}')
        .collection('available_partners')
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

    map_availablepartners_details(doctor_details);
  }

  map_availablepartners_details(QuerySnapshot<Map<String, dynamic>> data) {
    var _doctor_deatils_list = data.docs
        .map((item) => doc(
              id: item.id,
              hospital: item['priceperday'],
              name: item['name'],
              specialist: item['specialist'],
              bio: item['bio'],
              experience: item['experience'],
              workinghours: item['availability'],
            ))
        .toList();

    setState(() {
      homecare_available_partner = _doctor_deatils_list;
    });

    Navigator.of(context).pop();
  }
}
