import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/dashboardcenter.dart';
import 'package:medicineapp2/Medicine/medicine.dart';
import 'package:medicineapp2/homecare.dart';
import 'package:medicineapp2/popular_discounts.dart';
import 'package:medicineapp2/Models/popularcategories_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:medicineapp2/rental.dart';
import 'package:unicons/unicons.dart';
import 'Medicine/medicine_forbutton.dart';
import 'const.dart';
import 'doctor.dart';
import 'labtest.dart';
import 'orderbyprescription.dart';

var emergenncy_number;

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  Color heading_bluecolor_bg = Color(0xff001849);
  Color textcolor = Color(0xff001849);
  Color textcolor_white = Color(0xff001849);
  Color bluecolor = Color(0xff6588E6);
  Color bluecolor_bg = Color(0xffDAE1FF);

  Color redcolor = Color(0xffE46473);
  Color yellowcolor = Color(0xffF9BF80);
  Color background = Color(0xffF4F3FB);
  Color light_red = Color(0xffdae1ff);

  final user = FirebaseAuth.instance.currentUser!;
  List<Item> popular_categories = [];
  List<Item> shop_by_category = [];
  List<Item> shop_by_concern = [];
  List files = [];
  List shop_by_category_list = [];
  List shop_by_concern_list = [];
  List deals_of_the_day_image_list = [];
  List starting_tiles_image_list = [];
  List<Item> emergency = [];

  late var everyday_essential_image_url;
  void initState() {
    // TODO: implement initState
    // super.initState();
    starting_tiles();
    fetch_popular_categories();
    loadImages();
    shop_by_category_images();
    deals_of_the_day_image();
    shop_by_concern_images();
  }

  void makecall() async {
    await FlutterPhoneDirectCaller.callNumber('${emergency[0].name}');
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
                              "APPNAME",
                              style: TextStyle(
                                fontFamily: 'bold',
                                fontSize: 24,
                                color: heading_bluecolor_bg,
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
                                color: light_red,
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
                                  color: light_red,
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
                                            transition: Transition.rightToLeft);
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
                    ), //starting tiles
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: background,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 60,
                                left: MediaQuery.of(context).size.height / 60,
                                right: MediaQuery.of(context).size.height / 200,
                                bottom: MediaQuery.of(context).size.height / 60,
                              ),
                              child: Text(
                                "Popular Services",
                                style: TextStyle(
                                  fontFamily: 'semibold',
                                  fontSize: 20,
                                  color: textcolor,
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  //top:MediaQuery.of(context).size.height / 50,
                                  left: MediaQuery.of(context).size.height / 60,
                                  right:
                                      MediaQuery.of(context).size.height / 200),
                              child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 6.5,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: files.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4,
                                          margin: const EdgeInsets.all(6.0),
                                          decoration: BoxDecoration(
                                              color: bluecolor_bg,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: MaterialButton(
                                            onPressed: () {
                                              if (index == 0) {
                                                Get.to(
                                                    () => medicineforbutton(),
                                                    transition:
                                                        Transition.rightToLeft);
                                              } else if (index == 1) {
                                                Get.to(() => labtest(),
                                                    transition:
                                                        Transition.rightToLeft);
                                              } else if (index == 2) {
                                                Get.to(() => doctor(),
                                                    transition:
                                                        Transition.rightToLeft);
                                              } else if (index == 3) {
                                                makecall();
                                              } else if (index == 4) {
                                                Get.to(() => rental(),
                                                    transition:
                                                        Transition.rightToLeft);
                                              } else if (index == 5) {
                                                Get.to(() => homecare(),
                                                    transition:
                                                        Transition.rightToLeft);
                                              }
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.network("${files[index]}",
                                                    scale: 10),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      35,
                                                ),
                                                Text(
                                                  "${popular_categories[index].name}",
                                                  style: TextStyle(
                                                    fontFamily: 'medium',
                                                    fontSize: 13,
                                                    color: textcolor_white,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }))),
                        ],
                      ),
                    ), //popular services
                    Container(
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
                              height: MediaQuery.of(context).size.height / 7,
                              decoration: BoxDecoration(
                                color: bluecolor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: orderbyprescription(),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 60),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 7,
                              decoration: BoxDecoration(
                                color: redcolor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: noorderbyprescription(),
                            ),
                          ],
                        ),
                      ),
                    ), //prescription
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Shop By Category ",
                              style: TextStyle(
                                fontFamily: 'semibold',
                                fontSize: 20,
                                color: textcolor,
                              ),
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
                                    itemCount: shop_by_category_list.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            color: bluecolor_bg,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.network(
                                                "${shop_by_category_list[index]}",
                                                scale: 10),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  35,
                                            ),
                                            Text(
                                              "${shop_by_category[index].name}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                                fontSize: 13,
                                                color: textcolor_white,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Deals of the day",
                              style: TextStyle(
                                fontFamily: 'semibold',
                                fontSize: 20,
                                color: textcolor,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 5.5,
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        deals_of_the_day_image_list.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, right: 10),
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
                                      );
                                    })),
                          ],
                        ),
                      ),
                    ), //deal of the day
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: background,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 60,
                          left: MediaQuery.of(context).size.height / 60,
                          right: MediaQuery.of(context).size.height / 60,
                          bottom: MediaQuery.of(context).size.height / 60,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.2,
                              height: MediaQuery.of(context).size.height / 8,
                              decoration: BoxDecoration(
                                color: bluecolor,
                                borderRadius: BorderRadius.circular(10),
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
                                        color: Colors.white,
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
                            Container(
                              width: MediaQuery.of(context).size.width / 2.2,
                              height: MediaQuery.of(context).size.height / 8,
                              decoration: BoxDecoration(
                                color: redcolor,
                                borderRadius: BorderRadius.circular(10),
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
                                        color: Colors.white,
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
                          ],
                        ),
                      ),
                    ), //essentials and ngos
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Shop By Concern",
                              style: TextStyle(
                                fontFamily: 'semibold',
                                fontSize: 20,
                                color: textcolor,
                              ),
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
                                      return Container(
                                        margin: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            color: bluecolor_bg,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.network(
                                                "${shop_by_concern_list[index]}",
                                                scale: 10),
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
                                                color: textcolor_white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    })),
                          ],
                        ),
                      ),
                    ), //shop by consern
                  ],
                )),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 15,
                decoration: BoxDecoration(
                  color: background,
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

    var emergency =
        await FirebaseFirestore.instance.collection('emergency number').get();
    map_emergency(emergency);
  }

  map_fetch_popular_categories(QuerySnapshot<Map<String, dynamic>> data) {
    var _popular_categories_data =
        data.docs.map((item) => Item(id: item.id, name: item['Name'])).toList();

    setState(() {
      popular_categories = _popular_categories_data;
    });
  }

  map_emergency(QuerySnapshot<Map<String, dynamic>> data) {
    print('----------------------------------------');
    var _emergency_number_data = data.docs
        .map((item) => Item(id: item.id, name: item['number']))
        .toList();

    setState(() {
      emergency = _emergency_number_data;
      emergenncy_number = emergency[0].name;
    });
    print(emergency[0].name);
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
