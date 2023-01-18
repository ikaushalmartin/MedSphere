import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class product_common_screen extends StatefulWidget {
  String heading;
  String image_url;
  String cuttopdeals;
  String name;
  String price;
  String quantity;
  String company;
  String medicaldiscription;
  String uses;
  String doses;
  String sideeffect;
  String precaution_and_warning;

  product_common_screen({
    Key? key,
    required this.heading,
    required this.image_url,
    required this.name,
    required this.precaution_and_warning,
    required this.sideeffect,
    required this.doses,
    required this.uses,
    required this.medicaldiscription,
    required this.company,
    required this.quantity,
    required this.cuttopdeals,
    required this.price,
  }) : super(key: key);

  @override
  State<product_common_screen> createState() => _product_common_screenState();
}

class _product_common_screenState extends State<product_common_screen> {
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "${widget.image_url}",
                          scale: 2,
                        ),
                      ),
                      Divider(color: bluecolor),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 150,
                      ),
                      Container(
                        //  height: MediaQuery.of(context).size.height / 4.5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: bluecolor_bg,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.name}",
                                style: TextStyle(
                                  fontFamily: 'semibold',
                                  fontSize: 20,
                                  color: textcolor,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 200,
                              ), //name
                              Text(
                                "${widget.quantity},",
                                style: TextStyle(
                                  fontFamily: 'bold',
                                  fontSize: 11,
                                  color: bluecolor,
                                ),
                              ), //quantity
                              Text("${widget.company}",
                                  style: TextStyle(
                                    fontFamily: 'semibold',
                                    fontSize: 14,
                                    color: bluecolor,
                                  )),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 120,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "MRP ₹ ${widget.price}",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                      fontSize: 16,
                                      color: textcolor,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 18,
                                  ),
                                  Text(
                                    "₹ ${widget.cuttopdeals}",
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontFamily: 'medium',
                                      fontSize: 16,
                                      color: cuttextcolor,
                                    ),
                                  ),
                                ],
                              ), //price
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    height:
                                        MediaQuery.of(context).size.height / 18,
                                    decoration: BoxDecoration(
                                      color: redcolor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Buy Now",
                                            style: TextStyle(
                                              fontFamily: 'semibold',
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              18,
                                      decoration: BoxDecoration(
                                        color: bluecolor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Add To Cart",
                                              style: TextStyle(
                                                fontFamily: 'semibold',
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ), //buyandadd to cart
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: bluecolor_bg,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Medical Discription",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 18,
                                  color: textcolor,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 250,
                              ),
                              Text(
                                "${widget.medicaldiscription}",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 13,
                                  color: bluecolor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ), //medicical disription
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 120,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: bluecolor_bg,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dose",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 18,
                                  color: textcolor,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 300,
                              ),
                              Text(
                                "${widget.doses}",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 13,
                                  color: bluecolor,
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 50,
                              ),
                              Text(
                                "Uses",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 18,
                                  color: textcolor,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 300,
                              ),
                              Text(
                                "${widget.uses}",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 13,
                                  color: bluecolor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ), //dose
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 120,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: bluecolor_bg,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Precautions And Warning",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 18,
                                  color: textcolor,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 300,
                              ),
                              Text(
                                "${widget.precaution_and_warning}",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 13,
                                  color: bluecolor,
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 50,
                              ),
                              Text(
                                "Side Effects",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 18,
                                  color: textcolor,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 300,
                              ),
                              Text(
                                "${widget.sideeffect}",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 13,
                                  color: bluecolor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ), //Precautions And Warning
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
