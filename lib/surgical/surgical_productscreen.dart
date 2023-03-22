import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:readmore/readmore.dart';

import '../Models/cart_model.dart';
import '../buy and cart/surgical_cart.dart';
import '../const.dart';
import '../main.dart';

class surgical_productscreen extends StatefulWidget {
  String imageurl,
      category,
      company,
      cutprice,
      description,
      name,
      price,
      size,
      sterile,
      use;
  surgical_productscreen(
      {Key? key,
      required this.name,
      required this.company,
      required this.size,
      required this.description,
      required this.category,
      required this.sterile,
      required this.use,
      required this.cutprice,
      required this.price,
      required this.imageurl})
      : super(key: key);

  @override
  State<surgical_productscreen> createState() => _surgical_productscreenState();
}

class _surgical_productscreenState extends State<surgical_productscreen> {
  Color textcolor = Color(0xD9181818);
  Color textcolor_light = Color(0x99181818);
  Color medicine_colour_button_1 = Color(0xff07DAEB);
  Color medicine_colour_button_2 = Color(0xff5093FE);
  Color background = Color(0xffD9D9D9);
  Color white = Color(0xffffffff);
  Color search_bg = Color(0x1A000000);

  List<cartmodel> deliveryandminval_list_for_check = [];

  bool enable = true;
  int quantity = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_cart_data_for_check();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: white,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    // top: MediaQuery.of(context).size.height / 50,
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
                            "Product Info",
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
                              Get.to(() => surgical_cart(),
                                  transition: Transition.rightToLeft);
                            },
                            icon: Icon(Icons.shopping_cart_outlined),
                            color: textcolor,
                          ),
                        )
                      ],
                    ), //toprow

                    SizedBox(height: MediaQuery.of(context).size.height / 100),
                    //searchbar
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 35,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3,
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            "${widget.imageurl}",
                            scale: 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 35,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                      ),
                      child: Container(
                        //  height: MediaQuery.of(context).size.height / 4.5,
                        width: MediaQuery.of(context).size.width,
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
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      "${widget.name}",
                                      style: TextStyle(
                                        fontFamily: 'semibold',
                                        fontSize: 20,
                                        color: textcolor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        450,
                                  ), //name
                                  /* Text(
                                    "${widget.quantity},",
                                    style: TextStyle(
                                      fontFamily: 'bold',
                                      fontSize: 11,
                                      color: textcolor_light,
                                    ),
                                  ),*/ //quantity
                                  Text("${widget.company}",
                                      style: TextStyle(
                                        fontFamily: 'semibold',
                                        fontSize: 14,
                                        color: bluecolor,
                                      )),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 50,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "₹${widget.price}",
                                                style: TextStyle(
                                                  fontFamily: 'medium',
                                                  fontSize: 16,
                                                  color: textcolor,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    30,
                                              ),
                                              Text(
                                                "MRP₹${widget.cutprice}",
                                                style: TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontFamily: 'medium',
                                                  fontSize: 16,
                                                  color: textcolor_light,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1,
                                          ),
                                          Text(
                                            "Inclusive all taxes",
                                            style: TextStyle(
                                              fontFamily: 'medium',
                                              fontSize: 12,
                                              color: textcolor_light,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ), //price
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 17,
                                    width:
                                        MediaQuery.of(context).size.height / 7,
                                    decoration: BoxDecoration(
                                      color: background,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                'Quantity',
                                                style: TextStyle(
                                                    color: bluecolor,
                                                    fontFamily: 'semibold',
                                                    fontSize: 16),
                                              ),
                                              content: Container(
                                                height: 500,
                                                width: 1,
                                                child: ListView.builder(
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: 30,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int x) {
                                                    return ListTile(
                                                      title: GestureDetector(
                                                        onTap: () {
                                                          quantity = x + 1;

                                                          Navigator.of(context)
                                                              .pop();
                                                          setState(() {
                                                            quantity;
                                                          });
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: 50,
                                                          child:
                                                              Text('${x + 1}'),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Text(
                                        'Qty - $quantity',
                                        style: TextStyle(
                                            color: textcolor,
                                            fontFamily: 'semibold',
                                            fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        100,
                                  ),
                                  Container(
                                    //  height: 50.0,
                                    child: MaterialButton(
                                      onPressed: () {
                                        fetch_cart_data_for_check();
                                        if (deliveryandminval_list_for_check
                                            .isEmpty) {
                                          enable = true;
                                        }
                                        setState(() {
                                          enable;
                                        });

                                        if (enable == true) {
                                          addtocart();
                                        } else {
                                          var checksnackbar = SnackBar(
                                            content: const Text(
                                                "Item Already Added!"),
                                            backgroundColor: textcolor,
                                            shape: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(1)),
                                            duration:
                                                Duration(milliseconds: 2000),
                                            behavior: SnackBarBehavior.floating,
                                          );
                                          setState(() {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(checksnackbar);
                                          });
                                        }
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.0)),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                            color: bluecolor,
                                            borderRadius:
                                                BorderRadius.circular(30.0)),
                                        child: Container(
                                          constraints: BoxConstraints(
                                            minHeight: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                17,
                                            minWidth: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                7,
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Add to cart",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: white,
                                                fontFamily: 'semibold',
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 35,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
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
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Product Discription",
                                    style: TextStyle(
                                      fontFamily: 'medium',
                                      fontSize: 18,
                                      color: textcolor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 250,
                              ),
                              ReadMoreText(
                                "${widget.description}",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 13,
                                  color: textcolor_light,
                                ),
                                trimLines: 5,
                                colorClickableText: bluecolor,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'Show more',
                                trimExpandedText: 'Show less',
                                moreStyle: TextStyle(
                                    fontSize: 14,
                                    color: bluecolor,
                                    fontFamily: "medium"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ), //medicical disription
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 35,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
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
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Size",
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
                                "${widget.size}",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 13,
                                  color: textcolor_light,
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
                                "${widget.use}",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 13,
                                  color: textcolor_light,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ), //dose
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 35,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
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
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sterile",
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
                                "${widget.sterile}",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 13,
                                  color: textcolor_light,
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 50,
                              ),
                              Text(
                                "Category",
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
                                "${widget.category}",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 13,
                                  color: textcolor_light,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ), //Precautions And Warning
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 35,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future addtocart() async {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));
    await FirebaseFirestore.instance
        .collection('CARTS')
        .doc(uid)
        .collection("Surgical Cart")
        .add({
      'Cutprice': widget.cutprice,
      'Company': widget.company,
      'Price': widget.price,
      'Name': widget.name,
      'Imageurl': widget.imageurl,
      'Quantity': quantity,
      'Use': widget.use,
      "Sterlie": widget.sterile,
      "Size": widget.size,
      "Imageurl": widget.imageurl,
      "Category": widget.category,
      'Description': widget.description,
      'Precaution_and_warning': ''
    });
    Navigator.of(context).pop();
    var vpasswordsnackbar = SnackBar(
      content: const Text("Item Added To Cart!"),
      backgroundColor: textcolor,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),
      duration: Duration(milliseconds: 2000),
      behavior: SnackBarBehavior.floating,
    );
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(vpasswordsnackbar);
    });
  }

  fetch_cart_data_for_check() async {
    var _cart_data = await FirebaseFirestore.instance
        .collection('CARTS')
        .doc(uid)
        .collection("Surgical Cart")
        .get();
    map_cart_dataforcheck(_cart_data);
  }

  map_cart_dataforcheck(QuerySnapshot<Map<String, dynamic>> data) {
    var cart_item = data.docs
        .map((item) => cartmodel(
            id: item.id,
            cutprice: item['Cutprice'],
            url: item['Imageurl'],
            company: item['Company'],
            productname: item['Name'],
            price: item['Price'],
            quantity: item['Quantity']))
        .toList();

    setState(() {
      deliveryandminval_list_for_check = cart_item;
    });
    checkButton();
    return deliveryandminval_list_for_check;
  }

  void checkButton() {
    for (int i = 0; i < deliveryandminval_list_for_check.length; i++) {
      print(
          '${widget.company}---------------${deliveryandminval_list_for_check[i].company}');
      if (widget.name == deliveryandminval_list_for_check[i].productname &&
          widget.company == deliveryandminval_list_for_check[i].company) {
        enable = false;
        break;
      } else {
        enable = true;
      }
    }

    setState(() {
      enable;
    });
  }
}
