import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/Models/emergency_deatils_model.dart';

import 'const.dart';

class emergency_services extends StatefulWidget {
  const emergency_services({Key? key}) : super(key: key);

  @override
  State<emergency_services> createState() => _emergency_servicesState();
}

class _emergency_servicesState extends State<emergency_services> {
  Color textcolor = Color(0xff1D1D1F);
  Color textcolor_white = Color(0xff949494);
  Color white = Color(0xffffffff);
  Color redcolor = Color(0xffE46473);
  Color yellowcolor = Color(0xffF9BF80);
  Color background = Color(0xffD9D9D9);
  List<emergency> emergency_deatil = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_emergency_services();
  }

  void makecall(String callnumber) async {
    await FlutterPhoneDirectCaller.callNumber(callnumber);
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
                              "Emergency Contacts",
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 150,
                        ),
                        Container(
                          color: white,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 40,
                              left: MediaQuery.of(context).size.height / 60,
                              right: MediaQuery.of(context).size.height / 60,
                              bottom: MediaQuery.of(context).size.height / 60,
                            ),
                            child: SizedBox(
                              // height: MediaQuery.of(context).size.height / 5.5,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: emergency_deatil.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        makecall(
                                            emergency_deatil[index].number);
                                      },
                                      child: Column(
                                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  40,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${emergency_deatil[index].name}",
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
                                                      "${emergency_deatil[index].number}",
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontFamily: 'medium',
                                                        fontSize: 16,
                                                        color: textcolor_white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Divider(
                                                  color: background,
                                                  thickness: 2,
                                                ),
                                              ],
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

  fetch_emergency_services() async {
    var doctor_details =
        await FirebaseFirestore.instance.collection('/emergency number').get();
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
        .map((item) =>
            emergency(id: item.id, name: item['Name'], number: item['Number']))
        .toList();

    Navigator.of(context).pop();
    setState(() {
      emergency_deatil = _doctor_deatils_list;
    });
  }
}
