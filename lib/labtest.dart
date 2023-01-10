import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/popularcategories_model.dart';

import 'const.dart';

class labtest extends StatefulWidget {
  const labtest({Key? key}) : super(key: key);

  @override
  State<labtest> createState() => _labtestState();
}

class _labtestState extends State<labtest> {
  List tabtest_discount = [];
  List labtestbyhealthconcern_images = [];
  List<Item> labtestbyhealthconcern_labes = [];

  Color bluecolor = Color(0xff2c64e3);
  Color textcolor = Color(0xff273238);
  Color grey = Color(0xffececef);
  Color prescription = Color(0xff8353AA);
  Color noprescription = Color(0xffE091C9);
  Color prescription_bg = Color(0xffF2DAFF);
  Color nopres_bg = Color(0xffffd7ef);
  Color nopres = Color(0xffffade6);
  Color shopbycategory = Color(0xffEEF1FF);

  @override
  void initState() {
    super.initState();

    fetch_labtestbyhealthconcern_labes();
    healthbyconcern_images();
    labtest_discounts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF8F8FC),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],
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
                                color: bluecolor,
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
                                color: Color(0xffececef),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextField(
                                onChanged: (value) {},
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(color: Color(0xff01bdf3)),
                                textAlign: TextAlign.left,
                                decoration: kTextFieldDecoration.copyWith(
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: "Search"),
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width / 6,
                                decoration: BoxDecoration(
                                  color: Color(0xffececef),
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
                      color: Colors.white,
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
                                            color: Colors.white,
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
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
                                        return Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4,
                                          margin: const EdgeInsets.all(6.0),
                                          decoration: BoxDecoration(
                                              color: shopbycategory,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: MaterialButton(
                                            onPressed: () {},
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
                                                    fontSize: 14,
                                                    color: textcolor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }))),
                        ],
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
  }

  map_labtestbyhealthconcern_labes(QuerySnapshot<Map<String, dynamic>> data) {
    var labtestbyhealthconcern_labes_data =
        data.docs.map((item) => Item(id: item.id, name: item['Name'])).toList();

    setState(() {
      labtestbyhealthconcern_labes = labtestbyhealthconcern_labes_data;
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
    Navigator.of(context).pop();
    return tabtest_discount;
  }

  Future healthbyconcern_images() async {
    ListResult result = await FirebaseStorage.instance
        .ref()
        .child("/labtest_by_concern")
        .list();
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
      labtestbyhealthconcern_images.add(fileUrl);
    });

    setState(() {
      labtestbyhealthconcern_images;
    });
    Navigator.of(context).pop();
    return labtestbyhealthconcern_images;
  }
}
