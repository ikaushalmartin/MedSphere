import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/Medicine/medicine.dart';
import 'package:medicineapp2/homecare/homecare.dart';
import 'package:medicineapp2/discounts/popular_discounts.dart';
import 'package:medicineapp2/Models/popularcategories_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:medicineapp2/profile.dart';
import 'package:medicineapp2/rentals/rental.dart';
import 'package:medicineapp2/shopby_concern.dart';
import 'package:medicineapp2/shopbycategory.dart';
import 'package:medicineapp2/surgical/surgical.dart';
import 'package:unicons/unicons.dart';
import 'Medicine/medicine_forbutton.dart';
import 'buy and cart/cart.dart';
import 'buy and cart/surgical_cart.dart';
import 'const.dart';

import 'doctor/doctor.dart';
import 'emergency_services.dart';
import 'everyday_essential/everyday_essentials.dart';
import 'lab/lab_cart.dart';
import 'lab/labtest.dart';
import 'ngocollabs.dart';
import 'orderbyprescription.dart';

var emergenncy_number;

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  Color textcolor = Color(0xff1D1D1F);
  Color textcolor_white = Color(0xff949494);
  Color white = Color(0xffffffff);
  Color redcolor = Color(0xffE46473);
  Color yellowcolor = Color(0xffF9BF80);
  Color background = Color(0xffD9D9D9);

  final user = FirebaseAuth.instance.currentUser!;
  List<Item> popular_categories = [];
  List<Item> shop_by_category = [];
  List<Item> shop_by_concern = [];
  List files = [];
  List shop_by_category_list = [];
  List shop_by_concern_list = [];
  List deals_of_the_day_image_list = [];
  List starting_tiles_image_list = [];

  late var everyday_essential_image_url;
  void initState() {
    // TODO: implement initState
    // super.initState();

    starting_tiles();
    fetch_popular_categories();
    loadImages();
    shop_by_category_images();
    deals_of_the_day_image();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: background,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: white,
                child: Padding(
                  padding: EdgeInsets.only(
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
                                Get.to(() => const profile(),
                                    transition: Transition.rightToLeft);
                                // FirebaseAuth.instance.signOut();
                              },
                              child: Icon(
                                Icons.person_outline_outlined,
                                color: textcolor,
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Theme(
                                data: ThemeData(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Get.to(() => const emergency_services(),
                                        transition: Transition.rightToLeft);
                                  },
                                  icon: Icon(Icons.emergency),
                                  color: Colors.red,
                                ),
                              ),
                              Theme(
                                data: ThemeData(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                            "Carts",
                                            style: TextStyle(
                                              fontFamily: 'semibold',
                                              fontSize: 21,
                                              color: textcolor,
                                            ),
                                          ),
                                          content: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                4.5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      250,
                                                ),
                                                MaterialButton(
                                                    onPressed: () {
                                                      Get.to(() => cart(),
                                                          transition: Transition
                                                              .rightToLeft);
                                                    },
                                                    child: Text(
                                                      "Medicines And Products",
                                                      style: TextStyle(
                                                        fontFamily: 'medium',
                                                        fontSize: 18,
                                                        color: textcolor,
                                                      ),
                                                    )),
                                                MaterialButton(
                                                    onPressed: () {
                                                      Get.to(() => lab_cart(),
                                                          transition: Transition
                                                              .rightToLeft);
                                                    },
                                                    child: Text(
                                                      "Lab Test",
                                                      style: TextStyle(
                                                        fontFamily: 'medium',
                                                        fontSize: 18,
                                                        color: textcolor,
                                                      ),
                                                    )),
                                                MaterialButton(
                                                    onPressed: () {
                                                      Get.to(
                                                          () => surgical_cart(),
                                                          transition: Transition
                                                              .rightToLeft);
                                                    },
                                                    child: Text(
                                                      "Surgical",
                                                      style: TextStyle(
                                                        fontFamily: 'medium',
                                                        fontSize: 18,
                                                        color: textcolor,
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              child: Text(
                                                "Close",
                                                style: TextStyle(
                                                  fontFamily: 'semibold',
                                                  fontSize: 18,
                                                  color: redcolor,
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.shopping_cart_outlined),
                                  color: textcolor,
                                ),
                              ),
                            ],
                          )
                        ],
                      ), //toprow
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 100),

                      //searchbar
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
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
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height / 60,
                            right: MediaQuery.of(context).size.height / 60,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 1.35,
                                decoration: BoxDecoration(
                                  color: background,
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
                                    color: background,
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 35,
                        ),
                        Container(
                          color: white,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 90,
                              // left: MediaQuery.of(context).size.height / 60,
                              //right: MediaQuery.of(context).size.height / 90,
                              bottom: MediaQuery.of(context).size.height / 110,
                            ),
                            child: SizedBox(
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: starting_tiles_image_list.length,
                                    itemBuilder: (context, index) {
                                      return Theme(
                                        data: ThemeData(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                        ),
                                        child: MaterialButton(
                                          onPressed: () {
                                            Get.to(() => populardiscounts(),
                                                transition:
                                                    Transition.rightToLeft);
                                          },
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.16,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                          "${starting_tiles_image_list[index]}")))),
                                        ),
                                      );
                                    })),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 35,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0.0, 0.0001),
                                blurRadius: 0.0001,
                                spreadRadius: 0.0003,
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
                                    top:
                                        MediaQuery.of(context).size.height / 60,
                                    left:
                                        MediaQuery.of(context).size.height / 60,
                                    right: MediaQuery.of(context).size.height /
                                        200,
                                    bottom:
                                        MediaQuery.of(context).size.height / 60,
                                  ),
                                  child: Text(
                                    "Popular Services",
                                    style: TextStyle(
                                      fontFamily: 'semibold',
                                      fontSize: 21,
                                      color: textcolor,
                                    ),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).size.height /
                                              50,
                                      left: MediaQuery.of(context).size.height /
                                          60,
                                      right:
                                          MediaQuery.of(context).size.height /
                                              200),
                                  child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              7,
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          physics: BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: files.length,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                                onTap: () {
                                                  if (index == 0) {
                                                    Get.to(
                                                        () =>
                                                            medicineforbutton(),
                                                        transition: Transition
                                                            .rightToLeft);
                                                  } else if (index == 1) {
                                                    Get.to(
                                                        () => const labtest(),
                                                        transition: Transition
                                                            .rightToLeft);
                                                  } else if (index == 2) {
                                                    Get.to(() => doctor(),
                                                        transition: Transition
                                                            .rightToLeft);
                                                  } else if (index == 3) {
                                                    Get.to(() => const rental(),
                                                        transition: Transition
                                                            .rightToLeft);
                                                  } else if (index == 4) {
                                                    Get.to(
                                                        () => const homecare(),
                                                        transition: Transition
                                                            .rightToLeft);
                                                  } else if (index == 5) {
                                                    Get.to(
                                                        () => const surgical(),
                                                        transition: Transition
                                                            .rightToLeft);
                                                  }
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      right:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              25),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                          height:
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  10,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              9.5,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            child: FittedBox(
                                                              child: Image.network(
                                                                  "${files[index]}"),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          )),
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            100,
                                                      ),
                                                      Text(
                                                        "${popular_categories[index].name}",
                                                        style: TextStyle(
                                                          fontFamily: 'medium',
                                                          fontSize: 14,
                                                          color:
                                                              textcolor_white,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ));
                                          }))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  //starting tiles
                  //popular services
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 35,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      //  top: MediaQuery.of(context).size.height / 60,
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 60,
                      // bottom: MediaQuery.of(context).size.height / 60,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 7,
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
                      child: orderbyprescription(),
                    ),
                  ), //prescription
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 35,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      //  top: MediaQuery.of(context).size.height / 60,
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 60,
                      // bottom: MediaQuery.of(context).size.height / 80,
                    ),
                    child: Container(
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
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 60,
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                        bottom: MediaQuery.of(context).size.height / 80,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Shop By Category",
                            style: TextStyle(
                              fontFamily: 'semibold',
                              fontSize: 21,
                              color: textcolor,
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 250,
                              child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 3 / 3,
                                    mainAxisSpacing: 20,
                                    crossAxisCount: 2,
                                  ),
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: shop_by_category_list.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(
                                            () => shop_by_category_items(
                                                heading3:
                                                    shop_by_category[index]
                                                        .name),
                                            transition: Transition.rightToLeft);
                                      },
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                20,
                                          ),
                                          ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            child: Image.network(
                                              "${shop_by_category_list[index]}",
                                              scale: 8,
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                50,
                                          ),
                                          Container(
                                            height: 32,
                                            child: Text(
                                              "${shop_by_category[index].name}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                                fontSize: 15,
                                                color: textcolor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  })),
                        ],
                      ),
                    ),
                  ), //Shop By Category
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 35,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10),
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 40,
                          spreadRadius: 3,
                          color: Color(0xffD2D1D5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 60,
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                        bottom: MediaQuery.of(context).size.height / 40,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Deals of the day",
                            style: TextStyle(
                              fontFamily: 'semibold',
                              fontSize: 21,
                              color: textcolor,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 5.5,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: deals_of_the_day_image_list.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(() => populardiscounts(),
                                              transition:
                                                  Transition.rightToLeft);
                                        },
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.2,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        "${deals_of_the_day_image_list[index]}")))),
                                      ),
                                    );
                                  })),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 35,
                  ), //deal of the day
                  Padding(
                    padding: EdgeInsets.only(
                      // top: MediaQuery.of(context).size.height / 60,
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 60,
                      // bottom: MediaQuery.of(context).size.height / 80,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => everyday_essentials(),
                                transition: Transition.rightToLeft);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            height: MediaQuery.of(context).size.height / 8,
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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Everyday\nEssentials",
                                    style: TextStyle(
                                      fontFamily: 'semibold',
                                      fontSize: 18,
                                      color: Color(0xff3635A3),
                                    ),
                                  ),
                                  Image.asset(
                                    "images/mh2.png",
                                    scale: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => ngocollabs(),
                                transition: Transition.rightToLeft);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            height: MediaQuery.of(context).size.height / 8,
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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Our NGO's\nCollabs",
                                    style: TextStyle(
                                      fontFamily: 'semibold',
                                      fontSize: 18,
                                      color: Color(0xffFF2D55),
                                    ),
                                  ),
                                  Image.asset(
                                    "images/ngo.png",
                                    scale: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ), //essentials and ngos
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 35,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10),
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 40,
                          spreadRadius: 3,
                          color: Color(0xffD2D1D5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 60,
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                        bottom: MediaQuery.of(context).size.height / 60,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Shop By Concern",
                            style: TextStyle(
                              fontFamily: 'semibold',
                              fontSize: 21,
                              color: textcolor,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                  ),
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: shop_by_concern_list.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(
                                            () => shopbyconcern(
                                                  heading3:
                                                      shop_by_concern[index]
                                                          .name,
                                                ),
                                            transition: Transition.rightToLeft);
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.network(
                                              "${shop_by_concern_list[index]}",
                                              scale: 7),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                35,
                                          ),
                                          Text(
                                            "${shop_by_concern[index].name}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'medium',
                                              fontSize: 14,
                                              color: textcolor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  })),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
              Container(
                height: MediaQuery.of(context).size.height / 15,
                decoration: BoxDecoration(
                  color: white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(UniconsLine.capsule),
                      color: textcolor,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(UniconsLine.flask),
                      color: textcolor,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(UniconsLine.estate),
                      color: textcolor,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(UniconsLine.ambulance),
                      color: textcolor,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(UniconsLine.book_medical),
                      color: textcolor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  navigationfunction(index) {
    if (index == 0) {
      Get.to(() => medicine(), transition: Transition.rightToLeft);
    }
  }

  fetch_popular_categories() async {
    var popular_categories =
        await FirebaseFirestore.instance.collection('popular categories').get();
    map_fetch_popular_categories(popular_categories);

    var shop_by_category =
        await FirebaseFirestore.instance.collection('shop by category').get();
    map_fetch_shop_by_category(shop_by_category);

    var shop_by_concern =
        await FirebaseFirestore.instance.collection('shop by concern').get();
    map_fetch_shop_by_concern(shop_by_concern);
  }

  map_fetch_popular_categories(QuerySnapshot<Map<String, dynamic>> data) {
    var _popular_categories_data =
        data.docs.map((item) => Item(id: item.id, name: item['Name'])).toList();

    setState(() {
      popular_categories = _popular_categories_data;
    });
  }

  map_fetch_shop_by_category(QuerySnapshot<Map<String, dynamic>> data) {
    var _shop_by_category_data =
        data.docs.map((item) => Item(id: item.id, name: item['Name'])).toList();

    setState(() {
      shop_by_category = _shop_by_category_data;
    });
  }

  map_fetch_shop_by_concern(QuerySnapshot<Map<String, dynamic>> data) {
    var _shop_by_concern_data =
        data.docs.map((item) => Item(id: item.id, name: item['Name'])).toList();

    setState(() {
      shop_by_concern = _shop_by_concern_data;
    });
  }

  Future loadImages() async {
    ListResult result =
        await FirebaseStorage.instance.ref().child("/popularcategories").list();
    List<Reference> allFiles = result.items;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));
    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      files.add(fileUrl);
    });
    setState(() {
      files;
    });
    return files;
  }

  Future shop_by_category_images() async {
    ListResult result =
        await FirebaseStorage.instance.ref().child("/shop by category").list();
    List<Reference> allFiles = result.items;
    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      shop_by_category_list.add(fileUrl);
    });
    setState(() {
      shop_by_category_list;
    });
    return shop_by_category_list;
  }

  Future shop_by_concern_images() async {
    ListResult result =
        await FirebaseStorage.instance.ref().child("/shop by concern").list();
    List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      shop_by_concern_list.add(fileUrl);
    });

    setState(() {
      shop_by_concern_list;
    });

    return shop_by_concern_list;
  }

  Future deals_of_the_day_image() async {
    ListResult result =
        await FirebaseStorage.instance.ref().child("/deals of the day").list();
    List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      deals_of_the_day_image_list.add(fileUrl);
    });

    setState(() {
      deals_of_the_day_image_list;
    });
    shop_by_concern_images();
    return deals_of_the_day_image_list;
  }

  Future starting_tiles() async {
    ListResult result =
        await FirebaseStorage.instance.ref().child("/starting_tiles").list();
    List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      starting_tiles_image_list.add(fileUrl);
    });

    setState(() {
      starting_tiles_image_list;
    });
    Navigator.of(context).pop();
    return starting_tiles_image_list;
  }
}
