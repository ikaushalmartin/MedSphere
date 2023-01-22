import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class labtest_commonscreen extends StatefulWidget {
  labtest_commonscreen(
      {Key? key,
      required this.name,
      required this.cutprice,
      required this.info,
      required this.price,
      required this.sampletype,
      required this.fastingrequired,
      required this.tubetype,
      required this.packagesinclude,
      required this.description})
      : super(key: key);

  String cutprice;
  String info;
  String price;
  String sampletype;
  String fastingrequired;
  String tubetype;
  String packagesinclude;
  String description;
  String name;

  @override
  State<labtest_commonscreen> createState() => _labtest_commonscreenState();
}

class _labtest_commonscreenState extends State<labtest_commonscreen> {
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
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: background,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                              "${widget.name}",
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

                      SizedBox(
                          height: MediaQuery.of(context).size.height / 100),
                      //searchbar
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height / 60,
                    left: MediaQuery.of(context).size.height / 60,
                    right: MediaQuery.of(context).size.height / 60),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.24,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Text("${widget.price}"),
                      Text("${widget.name}"),
                      Text("${widget.cutprice}"),
                      Text("${widget.packagesinclude}"),
                      Text("${widget.tubetype}"),
                      Text("${widget.info}"),
                      Text("${widget.sampletype}"),
                      Text("${widget.fastingrequired}"),
                      Text("${widget.description}"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
