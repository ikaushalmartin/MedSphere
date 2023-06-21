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
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
  Color textcolor_white = Color(0xffACAEBA);

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
        backgroundColor: background,
        resizeToAvoidBottomInset: false,
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
                        "Emergency Contacts",
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
                height: MediaQuery.of(context).size.height / 60,
              ),
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
                      itemCount: emergency_deatil.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            makecall(emergency_deatil[index].number);
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
                                  top: MediaQuery.of(context).size.height / 60,
                                  left: MediaQuery.of(context).size.height / 60,
                                  right:
                                      MediaQuery.of(context).size.height / 60,
                                  bottom:
                                      MediaQuery.of(context).size.height / 60,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${emergency_deatil[index].name}",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'Medium',
                                        fontSize: 16,
                                        color: textcolor,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              350,
                                    ),
                                    Text(
                                      "${emergency_deatil[index].number}",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'regular',
                                        fontSize: 16,
                                        color: bluecolor,
                                      ),
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
