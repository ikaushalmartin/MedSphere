import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'doctor_final.dart';

class doctorcommonscreen extends StatefulWidget {
  String name, hospital, experience, specialist, workinghours, bio, imageurl;
  doctorcommonscreen(
      {Key? key,
      required this.name,
      required this.bio,
      required this.workinghours,
      required this.experience,
      required this.specialist,
      required this.hospital,
      required this.imageurl})
      : super(key: key);

  @override
  State<doctorcommonscreen> createState() => _doctorcommonscreenState();
}

class _doctorcommonscreenState extends State<doctorcommonscreen> {
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
  Color textcolor_light = Color(0xffACAEBA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                          "Doctor's Information",
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
                  height: MediaQuery.of(context).size.height / 100,
                ),
                Container(
                  color: white,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 80,
                      bottom: MediaQuery.of(context).size.height / 80,
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 60,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          foregroundImage: NetworkImage(
                            "${widget.imageurl}",
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${widget.name}",
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 16,
                                color: textcolor,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 140,
                            ),
                            Text(
                              "${widget.specialist}",
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 14,
                                color: bluecolor,
                              ),
                            ),
                            Text(
                              "${widget.hospital}",
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
                SizedBox(
                  height: MediaQuery.of(context).size.height / 100,
                ),
                Container(
                  color: white,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                        top: MediaQuery.of(context).size.height / 80,
                        bottom: MediaQuery.of(context).size.height / 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Fees",
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 16,
                                color: textcolor,
                              ),
                            ),
                            Text(
                              "${widget.experience}",
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 14,
                                color: bluecolor,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Working Hours",
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 16,
                                color: textcolor,
                              ),
                            ),
                            Text(
                              "${widget.workinghours}",
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
                SizedBox(
                  height: MediaQuery.of(context).size.height / 100,
                ),
                Container(
                  color: white,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                        top: MediaQuery.of(context).size.height / 80,
                        bottom: MediaQuery.of(context).size.height / 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bio",
                          style: TextStyle(
                            fontFamily: 'medium',
                            fontSize: 16,
                            color: textcolor,
                          ),
                        ),
                        Text(
                          "${widget.bio}",
                          style: TextStyle(
                            fontFamily: 'regular',
                            fontSize: 14,
                            color: textcolor_light,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 15,
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.name}",
                      style: TextStyle(
                        fontFamily: 'medium',
                        fontSize: 16,
                        color: textcolor,
                      ),
                    ),
                    SizedBox(
                      height: 38.0,
                      child: Theme(
                        data: ThemeData(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Get.to(
                                () => doctor_final(
                                    doctorname: widget.name,
                                    fees: widget.experience,
                                    workinghours: widget.workinghours,
                                    hospitalname: widget.hospital),
                                transition: Transition.rightToLeft);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          child: Ink(
                            decoration: BoxDecoration(
                                color: bluecolor,
                                borderRadius: BorderRadius.circular(6)),
                            child: Container(
                              constraints:
                                  const BoxConstraints(maxWidth: 150.0),
                              alignment: Alignment.center,
                              child: const Text(
                                "Consult",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontFamily: "medium"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
