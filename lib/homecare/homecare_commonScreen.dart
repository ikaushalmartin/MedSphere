import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'homecare_final.dart';

class homecare_commonscreen extends StatefulWidget {
  String available_for_time, bio, experience, name, specialist, priceperday;
  homecare_commonscreen(
      {Key? key,
      required this.name,
      required this.specialist,
      required this.available_for_time,
      required this.priceperday,
      required this.experience,
      required this.bio})
      : super(key: key);

  @override
  State<homecare_commonscreen> createState() => _homecare_commonscreenState();
}

class _homecare_commonscreenState extends State<homecare_commonscreen> {
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
                          "Partner's Information",
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
                Container(
                  color: white,
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
                          "${widget.name}",
                          style: TextStyle(
                            fontFamily: 'medium',
                            fontSize: 16,
                            color: textcolor,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 100,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: 6,
                              color: bluecolor,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 70,
                            ),
                            Text(
                              "Profession : ",
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 14,
                                color: textcolor,
                              ),
                            ),
                            Text(
                              "${widget.specialist}",
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 14,
                                color: textcolor_light,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 100,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: 6,
                              color: bluecolor,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 70,
                            ),
                            Text(
                              "Experience : ",
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 14,
                                color: textcolor,
                              ),
                            ),
                            Text(
                              "${widget.experience}",
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
                SizedBox(height: MediaQuery.of(context).size.height / 100),
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
                              "Price/Day",
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 16,
                                color: textcolor,
                              ),
                            ),
                            Text(
                              "₹${widget.priceperday}",
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
                              "Availability",
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 16,
                                color: textcolor,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 150,
                            ),
                            Text(
                              "${widget.available_for_time}",
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
                SizedBox(height: MediaQuery.of(context).size.height / 100),
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
                      widget.name,
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
                                () => homecare_final(
                                      priceperday: widget.priceperday,
                                      name: widget.name,
                                      profession: widget.specialist,
                                    ),
                                transition: Transition.rightToLeft);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          child: Ink(
                            decoration: BoxDecoration(
                                color: bluecolor,
                                borderRadius: BorderRadius.circular(6)),
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 150.0),
                              alignment: Alignment.center,
                              child: const Text(
                                "Book",
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
