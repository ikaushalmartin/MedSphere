import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Models/topdeals_model.dart';

class essential_items_items_screen extends StatefulWidget {
  const essential_items_items_screen({Key? key}) : super(key: key);

  @override
  State<essential_items_items_screen> createState() =>
      _essential_items_items_screenState();
}

class _essential_items_items_screenState
    extends State<essential_items_items_screen> {
  Color textcolor = Color(0xD9181818);
  Color textcolor_light = Color(0x99181818);
  Color medicine_colour_button_1 = Color(0xff07DAEB);
  Color medicine_colour_button_2 = Color(0xff5093FE);
  Color background = Color(0xffD9D9D9);
  Color white = Color(0xffffffff);
  Color search_bg = Color(0x1A000000);

  List essential_items_images = [];
  List<topdeals> essential_items_list = [];
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
                                top: MediaQuery.of(context).size.height / 60,
                                left: MediaQuery.of(context).size.height / 60,
                                //right: MediaQuery.of(context).size.height / 200,
                                bottom: MediaQuery.of(context).size.height / 60,
                              ),
                              child: Text(
                                "Essential Items",
                                style: TextStyle(
                                  fontFamily: 'semibold',
                                  fontSize: 20,
                                  color: textcolor,
                                ),
                              )),
                        ),
                        Container(
                          color: white,
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
                                  itemCount: essential_items_list.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: white,
                                        child: Column(
                                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Divider(
                                              color: background,
                                              thickness: 2,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  8,
                                              decoration: BoxDecoration(
                                                color: white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 40,
                                                      foregroundImage:
                                                          NetworkImage(
                                                        "${essential_items_list[index]}",
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
                                                          "${essential_items_list[index].name}",
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'semibold',
                                                            fontSize: 19,
                                                            color: textcolor,
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
                                                          "${essential_items_list[index].price}",
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'medium',
                                                            fontSize: 16,
                                                            color:
                                                                textcolor_light,
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
                        )
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
