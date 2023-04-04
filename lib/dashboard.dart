import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/Medicine/medicine.dart';
import 'package:medicineapp2/Models/popularcategories_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:medicineapp2/pick/pick_drop.dart';
import 'package:medicineapp2/profile.dart';
import 'package:medicineapp2/rentals/rental.dart';
import 'package:medicineapp2/shopby_concern.dart';
import 'package:medicineapp2/shopbycategory.dart';
import 'package:medicineapp2/surgical/surgical.dart';
import 'package:unicons/unicons.dart';
import 'Medicine/medicine_forbutton.dart';
import 'Models/topdeals_model.dart';
import 'buy and cart/cart.dart';
import 'buy and cart/surgical_cart.dart';
import 'const.dart';
import 'Search_screen/dashboard_search.dart';
import 'discounts/discount_products.dart';

import 'doctor/doctor.dart';
import 'doctors_corner/image_upload.dart';
import 'doctors_corner/mainscreen.dart';
import 'emergency_services.dart';
import 'everyday_essential/everyday_essentials.dart';
import 'homecare/homecare.dart';
import 'lab/lab_cart.dart';
import 'lab/labtest.dart';
import 'main.dart';
import 'ngocollabs.dart';
import 'notification_services.dart';
import 'orderbyprescription.dart';

var emergenncy_number;

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color textcolor_white = Color(0xffACAEBA);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
  final user = FirebaseAuth.instance.currentUser!;
  List<Item> popular_categories = [];
  List<Item> shop_by_category = [];
  List<Item> shop_by_concern = [];
  List<Item> dr_check_data = [];
  List files = [];
  List shop_by_category_list = [];
  List shop_by_concern_list = [];
  List deals_of_the_day_image_list = [];
  List starting_tiles_image_list = [];

  List deals_of_the_day_image_list2 = [];
  List<topdeals> top_deals_deatils_list = [];
  List<topdeals> deal_ofthedayitems = [];

  List dealoftheday_items = [];
  int doctor_checked = 0;
  late var everyday_essential_image_url;

  Color bottom1 = Color(0xff575F75);
  Color bottom2 = Color(0xff575F75);
  Color bottom3 = Color(0xff01BDF3);
  Color bottom4 = Color(0xff575F75);
  Color bottom5 = Color(0xff575F75);

  void initState() {
    fetch_number();
    starting_tiles();
    fetch_popular_categories();
    loadImages();
    shop_by_category_images();
    deals_of_the_day_image();
    deals_of_the_day_imagessss();
  }

  String searchitem = "";

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height / 60,
                          right: MediaQuery.of(context).size.height / 200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.to(() => const profile(),
                                    transition: Transition.rightToLeft);
                                // FirebaseAuth.instance.signOut();
                              },
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: bluecolor,
                                child: Icon(
                                  UniconsLine.user,
                                  color: white,
                                  size: 20,
                                ),
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
                                              fontSize: 20,
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
                                                      "Surgicals And Instruments",
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
                                  iconSize: 20,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ), //toprow
                    SizedBox(height: MediaQuery.of(context).size.height / 120),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 20,
                        decoration: BoxDecoration(
                          color: background,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: TextFormField(
                          readOnly: true,
                          onTap: () {
                            Get.to(() => SearchScreen(),
                                transition: Transition.rightToLeft);
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: textcolor_white),
                          textAlign: TextAlign.left,
                          decoration: kTextFieldDecoration.copyWith(
                              prefixIcon: Icon(
                                UniconsLine.search,
                                color: bluecolor,
                                size: 23,
                              ),
                              contentPadding: EdgeInsets.only(left: 20),
                              hintText: "Search for Medicine and Products"),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 80),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 35,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: starting_tiles_image_list.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4.0, right: 6),
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.085,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "${starting_tiles_image_list[index]}")))),
                                  );
                                })),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 35,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  Container(
                    color: white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 80,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height / 60,
                            right: MediaQuery.of(context).size.height / 60,
                          ),
                          child: Text(
                            "Popular Services",
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 16,
                              color: textcolor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 80,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.height / 60,
                                    right: MediaQuery.of(context).size.height /
                                        60),
                                child: SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        3.3,
                                    child: GridView.builder(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 3.5 / 2.8,
                                          mainAxisSpacing: 0,
                                          crossAxisCount: 2,
                                        ),
                                        shrinkWrap: true,
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: files.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                              onTap: () {
                                                if (index == 0) {
                                                  Get.to(
                                                      () => medicineforbutton(),
                                                      transition: Transition
                                                          .rightToLeft);
                                                } else if (index == 1) {
                                                  Get.to(() => const labtest(),
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
                                                  Get.to(() => const homecare(),
                                                      transition: Transition
                                                          .rightToLeft);
                                                } else if (index == 5) {
                                                  Get.to(() => const surgical(),
                                                      transition: Transition
                                                          .rightToLeft);
                                                } else if (index == 6) {
                                                  if (doctor_checked == 0) {
                                                    Get.to(
                                                        () => dr_image_upload(),
                                                        transition: Transition
                                                            .rightToLeft);
                                                  } else {
                                                    Get.to(
                                                        () =>
                                                            const mainscreen(),
                                                        transition: Transition
                                                            .rightToLeft);
                                                  }
                                                } else if (index == 7) {
                                                  Get.to(() => LocationScreen(),
                                                      transition: Transition
                                                          .rightToLeft);
                                                }
                                              },
                                              child: Column(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 32,
                                                    backgroundColor: background,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8)),
                                                      child: Image.network(
                                                          "${files[index]}"),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            140,
                                                  ),
                                                  Text(
                                                    "${popular_categories[index].name}",
                                                    style: TextStyle(
                                                      fontFamily: 'regular',
                                                      fontSize: 12,
                                                      color: textcolor_white,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ));
                                        }))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 8,
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.circular(8),
                      color: white,
                    ),
                    child: orderbyprescription(),
                  ), //prescription
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  Container(
                    color: white,
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 60,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 80,
                        ),
                        Text(
                          "Shop By Category",
                          style: TextStyle(
                            fontFamily: 'medium',
                            fontSize: 16,
                            color: textcolor,
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 3,
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 2.4 / 2.1,
                                  mainAxisSpacing: 0,
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
                                                  shop_by_category[index].name),
                                          transition: Transition.rightToLeft);
                                    },
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              35,
                                        ),
                                        ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          child: Image.network(
                                            "${shop_by_category_list[index]}",
                                            scale: 7,
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              60,
                                        ),
                                        Container(
                                          height: 32,
                                          child: Text(
                                            "${shop_by_category[index].name}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'regular',
                                              fontSize: 13,
                                              color: textcolor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                })),
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 35,
                        ),
                      ],
                    ),
                  ), //Shop By Category
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  Container(
                    color: white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 80,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height / 60,
                            right: MediaQuery.of(context).size.height / 60,
                          ),
                          child: Text(
                            "Deals of the day",
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 16,
                              color: textcolor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 80,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 5.5,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: deals_of_the_day_image_list.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      deal_ofthedayitems.clear();
                                      dealoftheday_items.clear();
                                      fetch_deal_of_the_day(index + 1);
                                      dealofthedayimages(index + 1);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.height /
                                                60,
                                      ),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.2,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "${deals_of_the_day_image_list[index]}")))),
                                    ),
                                  );
                                })),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
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
                              borderRadius: BorderRadius.circular(6),
                              color: white,
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
                              borderRadius: BorderRadius.circular(6),
                              color: white,
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
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  Container(
                    color: white,
                    child: Padding(
                      padding: EdgeInsets.only(
                        //top: MediaQuery.of(context).size.height / 60,
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                        //bottom: MediaQuery.of(context).size.height / 60,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 100,
                          ),
                          Text(
                            "Shop By Concern",
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 16,
                              color: textcolor,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 80,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            child: Image.network(
                                                "${shop_by_concern_list[index]}",
                                                fit: BoxFit.cover,
                                                scale: 8),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                140,
                                          ),
                                          Text(
                                            "${shop_by_concern[index].name}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'regular',
                                              fontSize: 16,
                                              color: textcolor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  })),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 100,
                          ),
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
                      onPressed: () {
                        Get.to(() => const medicineforbutton(),
                            transition: Transition.noTransition);
                      },
                      icon: Icon(UniconsLine.capsule),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      color: bottom1,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(() => const labtest(),
                            transition: Transition.noTransition);
                      },
                      icon: Icon(UniconsLine.flask),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      color: bottom2,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(UniconsLine.home_alt),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      color: bottom3,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(() => SearchScreen(),
                            transition: Transition.noTransition);
                      },
                      icon: Icon(UniconsLine.search),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      color: bottom4,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(() => const profile(),
                            transition: Transition.noTransition);
                      },
                      icon: Icon(UniconsLine.user),
                      color: bottom5,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
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

    getdocvalue();
  }

  getdocvalue() async {
    var dr_data = await FirebaseFirestore.instance
        .collection('Doctor_check')
        .doc(uid)
        .get();
    print("<<<<<<<<<<<<<<<<<<<<<<<<<<${dr_data['Verified']}");
    doctor_checked = dr_data['Verified'];
    setState(() {
      doctor_checked;
    });
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

    Navigator.of(context).popUntil((route) => route.isFirst);
    pop_up();
    return starting_tiles_image_list;
  }

  fetch_number() async {
    var number = await FirebaseFirestore.instance
        .collection('/your_number')
        .doc('/number')
        .get();

    emergenncy_number = number['number'];
    setState(() {
      emergenncy_number;
    });
  }

  pop_up() async {
    final FirebaseStorage storage = FirebaseStorage.instance;
    final ref = storage.ref().child('/pop_up/images.jpg');
    final String url = await ref.getDownloadURL();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Image.network(url),
        );
      },
    );
  }

  Future deals_of_the_day_imagessss() async {
    ListResult result =
        await FirebaseStorage.instance.ref().child("/deals of the day").list();
    List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      deals_of_the_day_image_list2.add(fileUrl);
    });

    setState(() {
      deals_of_the_day_image_list2;
    });

    return deals_of_the_day_image_list2;
  }

  fetch_deal_of_the_day(int x) async {
    var _packages_name = await FirebaseFirestore.instance
        .collection('DEAL_OFTHE_DAY')
        .doc('$x')
        .collection('discount_items')
        .get();
    map_dealsoftheday(_packages_name, x);
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));
  }

  map_dealsoftheday(QuerySnapshot<Map<String, dynamic>> data, int x) {
    var topdeal_name = data.docs
        .map((item) => topdeals(
            id: item.id,
            cuttopdeals: item['Cutprice'],
            name: item['Name'],
            price: item['Price'],
            quantity: item['Quantity'],
            company: item['Company'],
            medicaldiscription: item['Medical_Discription'],
            uses: item['Uses'],
            doses: item['Doses'],
            sideeffect: item['Side_Effect'],
            precaution_and_warning: item['Precaution_and_warning'],
            salts: item['Salts']))
        .toList();

    setState(() {
      deal_ofthedayitems = topdeal_name;
    });
  }

  Future dealofthedayimages(int x) async {
    ListResult result = await FirebaseStorage.instance
        .ref()
        .child("/deals of the day/$x")
        .list();
    List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      dealoftheday_items.add(fileUrl);
    });

    setState(() {
      dealoftheday_items;
    });
    Navigator.of(context).pop();

    Get.to(
        () => discount_products(
            productlist: deal_ofthedayitems, item_image: dealoftheday_items),
        transition: Transition.rightToLeft);
    return dealoftheday_items;
  }
}
