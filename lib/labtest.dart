import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/Models/price_model.dart';
import 'package:medicineapp2/Models/popularcategories_model.dart';
import 'package:medicineapp2/product_commonscreen/packagesscreen_labtest.dart';

import 'Medicine/medicine.dart';
import 'const.dart';
import 'orderbyprescription.dart';

class labtest extends StatefulWidget {
  const labtest({Key? key}) : super(key: key);

  @override
  State<labtest> createState() => _labtestState();
}

class _labtestState extends State<labtest> {
  List tabtest_discount = [];
  List labtestbyhealthconcern_images = [];
  List<Item> labtestbyhealthconcern_labes = [];
  List<Price> packages = [];
  List packages_images = [];

  Color cuttextcolor = Color(0xff2b1700);
  Color grey = Color(0xffececef);

  Color heading_bluecolor_bg = Color(0xff001849);
  Color textcolor = Color(0xff001849);
  Color textcolor_white = Color(0xff001849);
  Color bluecolor = Color(0xff6588E6);
  Color bluecolor_bg = Color(0xffDAE1FF);
  Color redcolor = Color(0xffE46473);
  Color yellowcolor = Color(0xffF9BF80);
  Color background = Color(0xffF4F3FB);
  Color light_red = Color(0xffdae1ff);

  @override
  void initState() {
    super.initState();

    fetch_labtestbyhealthconcern_labes();
    healthbyconcern_images();
    popular_packages_images();
    labtest_discounts();
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
                              "Lab Test",
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
                    // color: background,
                    child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
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
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height / 5.5,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: tabtest_discount.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, right: 10),
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        decoration: BoxDecoration(
                                            color: background,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "${tabtest_discount[index]}")))),
                                  );
                                })),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 60,
                          left: MediaQuery.of(context).size.height / 60,
                          right: MediaQuery.of(context).size.height / 200,
                          bottom: MediaQuery.of(context).size.height / 60,
                        ),
                        child: Text(
                          "Lab Test By Health Concern",
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
                            right: MediaQuery.of(context).size.height / 200),
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height / 6.5,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: labtestbyhealthconcern_images.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    margin: const EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                        color: bluecolor_bg,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: MaterialButton(
                                      onPressed: () {
                                        Get.to(
                                            () => packages_commonnscreen(
                                                  heading:
                                                      '${labtestbyhealthconcern_labes[index].name}',
                                                ),
                                            transition: Transition.rightToLeft);
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.network(
                                              "${labtestbyhealthconcern_images[index]}",
                                              scale: 10),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                35,
                                          ),
                                          Text(
                                            "${labtestbyhealthconcern_labes[index].name}",
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
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height / 60,
                          top: MediaQuery.of(context).size.height / 60,
                          left: MediaQuery.of(context).size.height / 60,
                          right: MediaQuery.of(context).size.height / 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => medicine(),
                                  transition: Transition.rightToLeft);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.2,
                              height: MediaQuery.of(context).size.height / 8,
                              decoration: BoxDecoration(
                                color: bluecolor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Upload\nPrescription",
                                      style: TextStyle(
                                        fontFamily: 'semibold',
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Image.asset(
                                      "images/prescription.png",
                                      scale: 10,
                                    )
                                  ],
                                ),
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
                                    "Call Us\nTo Book",
                                    style: TextStyle(
                                      fontFamily: 'semibold',
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Image.asset(
                                    "images/com.png",
                                    scale: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                              "Popular Health Packages",
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
                                      crossAxisCount: 2,
                                    ),
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemCount: packages_images.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                            color: bluecolor_bg,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.network(
                                                "${packages_images[index]}",
                                                scale: 10),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  30,
                                            ),
                                            Text(
                                              "${packages[index].name}",
                                              // textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontFamily: 'medium',
                                                fontSize: 16,
                                                color: textcolor_white,
                                              ),
                                            ),
                                            Text(
                                              "${packages[index].info}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'regular',
                                                fontSize: 12,
                                                color: textcolor_white,
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  100,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "₹${packages[index].price}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'medium',
                                                    fontSize: 16,
                                                    color: textcolor_white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      20,
                                                ),
                                                Text(
                                                  "₹${packages[index].cutprice}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    fontFamily: 'medium',
                                                    fontSize: 16,
                                                    color: cuttextcolor,
                                                  ),
                                                ),
                                              ],
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
              ),
            ],
          ),
        ));
  }

  fetch_labtestbyhealthconcern_labes() async {
    var labtestbyhealthconcern_labes = await FirebaseFirestore.instance
        .collection('labtest_by_concern_label')
        .get();
    map_labtestbyhealthconcern_labes(labtestbyhealthconcern_labes);

    var _packages_name =
        await FirebaseFirestore.instance.collection('packages_name').get();
    map_packages_name(_packages_name);
  }

  map_labtestbyhealthconcern_labes(QuerySnapshot<Map<String, dynamic>> data) {
    var labtestbyhealthconcern_labes_data =
        data.docs.map((item) => Item(id: item.id, name: item['Name'])).toList();

    setState(() {
      labtestbyhealthconcern_labes = labtestbyhealthconcern_labes_data;
    });
  }

  map_packages_name(QuerySnapshot<Map<String, dynamic>> data) {
    var pack_name = data.docs
        .map((item) => Price(
              id: item.id,
              cutprice: item['Cutprice'],
              info: item['Info'],
              name: item['Name'],
              price: item['Price'],
            ))
        .toList();

    setState(() {
      packages = pack_name;
    });
  }

  Future labtest_discounts() async {
    ListResult result =
        await FirebaseStorage.instance.ref().child("/labtest_discount").list();
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
      tabtest_discount.add(fileUrl);
    });

    setState(() {
      tabtest_discount;
    });

    return tabtest_discount;
  }

  Future healthbyconcern_images() async {
    ListResult result = await FirebaseStorage.instance
        .ref()
        .child("/labtest_by_concern")
        .list();
    List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      labtestbyhealthconcern_images.add(fileUrl);
    });

    setState(() {
      labtestbyhealthconcern_images;
    });

    return labtestbyhealthconcern_images;
  }

  Future popular_packages_images() async {
    ListResult result =
        await FirebaseStorage.instance.ref().child("/packages").list();
    List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      packages_images.add(fileUrl);
    });

    setState(() {
      packages_images;
    });
    Navigator.of(context).pop();
    return packages_images;
  }
}
