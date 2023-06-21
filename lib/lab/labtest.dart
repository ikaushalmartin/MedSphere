import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/Models/price_model.dart';
import 'package:medicineapp2/Models/popularcategories_model.dart';
import 'package:medicineapp2/lab/packagesscreen_labtest.dart';
import 'package:unicons/unicons.dart';

import '../Medicine/medicine.dart';
import '../Medicine/medicine_forbutton.dart';
import '../Search_screen/lab_search.dart';
import '../buy and cart/cart.dart';
import '../dashboard.dart';
import '../Search_screen/dashboard_search.dart';
import '../Profile/profile.dart';
import 'lab_cart.dart';
import '../const.dart';
import '../orderbyprescription.dart';

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

  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color textcolor_white = Color(0xff42474e);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);

  Color bottom1 = Color(0xff575F75);
  Color bottom2 = Color(0xff01BDF3);
  Color bottom3 = Color(0xff575F75);
  Color bottom4 = Color(0xff575F75);
  Color bottom5 = Color(0xff575F75);

  @override
  void initState() {
    super.initState();

    fetch_labtestbyhealthconcern_labes();
    healthbyconcern_images();
    labtest_discounts();
  }

  void makecall_med() async {
    await FlutterPhoneDirectCaller.callNumber('$emergenncy_number');
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
                  color: white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          //   top: MediaQuery.of(context).size.height / 80,
                          left: MediaQuery.of(context).size.height / 60,
                          right: MediaQuery.of(context).size.height / 200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Lab Test",
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 16,
                              color: textcolor,
                            ),
                          ),
                          Theme(
                            data: ThemeData(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                            ),
                            child: IconButton(
                              onPressed: () {
                                Get.to(() => const lab_cart(),
                                    transition: Transition.rightToLeft);
                              },
                              icon: Icon(Icons.shopping_cart_outlined),
                              color: textcolor,
                              iconSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
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
                            Get.to(() => const lab_search(),
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
                              hintText: "Search for Lab Packages"),
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 60,
                          left: MediaQuery.of(context).size.height / 60,
                          right: MediaQuery.of(context).size.height / 60,
                          bottom: MediaQuery.of(context).size.height / 60,
                        ),
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height / 5.5,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 60,
                                left: MediaQuery.of(context).size.height / 60,
                                // right: MediaQuery.of(context).size.height / 200,
                                // bottom: MediaQuery.of(context).size.height / 60,
                              ),
                              child: Text(
                                "Lab Test by Health Concern",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 16,
                                  color: textcolor,
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
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
                                      itemCount:
                                          labtestbyhealthconcern_images.length,
                                      itemBuilder: (context, index) {
                                        return MaterialButton(
                                          onPressed: () {
                                            Get.to(
                                                () => packages_commonnscreen(
                                                    heading:
                                                        '${labtestbyhealthconcern_labes[index].name}'),
                                                transition:
                                                    Transition.rightToLeft);
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                radius: 32,
                                                backgroundColor: background,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8)),
                                                  child: Image.network(
                                                      "${labtestbyhealthconcern_images[index]}",
                                                      scale: 7),
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    140,
                                              ),
                                              Text(
                                                "${labtestbyhealthconcern_labes[index].name}",
                                                style: TextStyle(
                                                  fontFamily: 'regular',
                                                  fontSize: 12,
                                                  color: textcolor_white,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        );
                                      }))),
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
                    ),
                  ],
                ),
              ),
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
                        Get.off(() => const medicineforbutton(),
                            transition: Transition.noTransition);
                      },
                      icon: const Icon(UniconsLine.capsule),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      color: bottom1,
                    ),
                    IconButton(
                      onPressed: () {},
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
                        Get.off(() => const profile(),
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

  Future fetch_labtestbyhealthconcern_labes() async {
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
      ),
    );
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
    Navigator.of(context).pop();
    return labtestbyhealthconcern_images;
  }
}
