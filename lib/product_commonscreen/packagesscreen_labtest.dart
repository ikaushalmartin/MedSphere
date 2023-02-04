import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Models/labtest_package_detail.dart';
import '../Models/price_model.dart';
import '../buy and cart/cart.dart';
import '../buy and cart/lab_cart.dart';
import 'labtest_commonscreen.dart';

class packages_commonnscreen extends StatefulWidget {
  packages_commonnscreen({Key? key, required this.heading}) : super(key: key);
  String heading;

  @override
  State<packages_commonnscreen> createState() => _packages_commonnscreenState();
}

class _packages_commonnscreenState extends State<packages_commonnscreen> {
  List<labtest_packages> packages = [];
  @override
  Color light_red = Color(0xffdae1ff);
  Color white = Color(0xffffffff);
  Color textcolor = Color(0xff1D1D1F);
  Color textcolor_white = Color(0xff949494);
  Color bluecolor = Color(0xff007AFF);
  Color bluecolor_bg = Color(0xffDAE1FF);
  Color redcolor = Color(0xffFE2D54);
  Color background = Color(0xffF2F1F6);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetch_labtestbyhealthconcern_labes(widget.heading);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: background,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: background,
                ),
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
                              "${widget.heading}",
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
                              onPressed: () {
                                Get.to(() => lab_cart(),
                                    transition: Transition.rightToLeft);
                              },
                              icon: Icon(Icons.shopping_cart_outlined),
                              color: textcolor,
                            ),
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
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 60,
                    bottom: MediaQuery.of(context).size.height / 60,
                    left: MediaQuery.of(context).size.height / 60,
                    right: MediaQuery.of(context).size.height / 60),
                child: Text(
                  "Recommended Packages",
                  style: TextStyle(
                    fontFamily: 'semibold',
                    fontSize: 21,
                    color: textcolor,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 35,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: background,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height / 60,
                    right: MediaQuery.of(context).size.height / 60,
                  ),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: packages.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                    () => labtest_commonscreen(
                                          heading: widget.heading,
                                          name: packages[index].name,
                                          cutprice: packages[index].cutprice,
                                          info: packages[index].info,
                                          price: packages[index].price,
                                          sampletype:
                                              packages[index].sampletype,
                                          fastingrequired:
                                              packages[index].fastingrequired,
                                          tubetype: packages[index].tubetype,
                                          packagesinclude:
                                              packages[index].packagesinclude,
                                          description:
                                              packages[index].description,
                                        ),
                                    transition: Transition.rightToLeft);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(10.0),
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${packages[index].name}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'medium',
                                        fontSize: 18,
                                        color: textcolor,
                                      ),
                                    ),
                                    Text(
                                      "${packages[index].info}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'regular',
                                        fontSize: 13,
                                        color: bluecolor,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              80,
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
                                            fontSize: 17,
                                            color: textcolor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              25,
                                        ),
                                        Text(
                                          "₹${packages[index].cutprice}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontFamily: 'medium',
                                            fontSize: 17,
                                            color: textcolor_white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    /*Text(
                                      "${packages[index].description}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'regular',
                                        fontSize: 12,
                                        color: textcolor_white,
                                      ),
                                    ),*/
                                  ],
                                ),
                              ),
                            );
                          })),
                ),
              ),
            ],
          ),
        ));
  }

  fetch_labtestbyhealthconcern_labes(String packagename) async {
    var _packages_name = await FirebaseFirestore.instance
        .collection('/labtest_by_concern_packages/$packagename/packages')
        .get();
    map_packages_name(_packages_name);
  }

  fetch_popular_data(String packagename) async {
    var _packages_name = await FirebaseFirestore.instance
        .collection('/labtest_by_concern_packages/$packagename/packages')
        .get();
    map_packages_name(_packages_name);
  }

  map_packages_name(QuerySnapshot<Map<String, dynamic>> data) {
    var pack_name = data.docs
        .map((item) => labtest_packages(
            id: item.id,
            cutprice: item['Cutprice'],
            info: item['Info'],
            name: item['Name'],
            price: item['Price'],
            sampletype: item['SampleType'],
            fastingrequired: item['FastingRequired'],
            tubetype: item['TubeType'],
            packagesinclude: item['PackagesInclude'],
            description: item['Description']))
        .toList();

    setState(() {
      packages = pack_name;
    });
  }
}
