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
  Color cuttextcolor = Color(0xff2b1700);
  Color grey = Color(0xffd1d1d6);
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
                    fontSize: 20,
                    color: textcolor,
                  ),
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
                                margin: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    color: bluecolor_bg,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
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
                                      height:
                                          MediaQuery.of(context).size.height /
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
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontFamily: 'medium',
                                            fontSize: 16,
                                            color: cuttextcolor,
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
