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
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color textcolor_light = Color(0xffACAEBA);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
  Color bluecolor_bg = Color(0xffDAE1FF);

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
              color: white,
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height / 60,
                    right: MediaQuery.of(context).size.height / 200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: textcolor,
                            size: 20,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height / 60,
                        ),
                        Text(
                          "Product Info",
                          style: TextStyle(
                            fontFamily: 'medium',
                            fontSize: 16,
                            color: textcolor,
                          ),
                        ),
                      ],
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
                        iconSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    color: white,
                    child: ClipRRect(
                      child: Image.network(
                        "${widget.imageurl}",
                        scale: 2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  Container(
                    color: white,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 60,
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                        bottom: MediaQuery.of(context).size.height / 60,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.9,
                                child: Text(
                                  "${widget.name}",
                                  style: TextStyle(
                                    fontFamily: 'medium',
                                    fontSize: 16,
                                    color: textcolor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 450,
                              ), //name
                              //quantity
                              Text(
                                "${widget.company}",
                                style: TextStyle(
                                  fontFamily: 'semibold',
                                  fontSize: 12,
                                  color: bluecolor,
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 60,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "₹${widget.price}",
                                            style: TextStyle(
                                              fontFamily: 'medium',
                                              fontSize: 14,
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
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontFamily: 'medium',
                                              fontSize: 14,
                                              color: textcolor_light,
                                            ),
                                          ),
                                        ],
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
                                height: MediaQuery.of(context).size.height / 20,
                                width: MediaQuery.of(context).size.height / 7,
                                decoration: BoxDecoration(
                                  color: background,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Theme(
                                  data: ThemeData(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
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
                                                        child: Text('${x + 1}'),
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
                                        fontFamily: 'medium',
                                        fontSize: 14,
                                        color: textcolor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100,
                              ),
                              Theme(
                                data: ThemeData(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                ),
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
                                        content:
                                            const Text("Item Already Added!"),
                                        backgroundColor: textcolor,
                                        shape: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(1)),
                                        duration: Duration(milliseconds: 2000),
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
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Container(
                                      constraints: BoxConstraints(
                                        minHeight:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        minWidth:
                                            MediaQuery.of(context).size.height /
                                                7,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Add to cart",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'medium',
                                          fontSize: 14,
                                          color: white,
                                        ),
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
                                  fontSize: 14,
                                  color: textcolor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 250,
                          ),
                          ReadMoreText(
                            "${widget.description}",
                            style: TextStyle(
                              fontFamily: 'regular',
                              fontSize: 16,
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
                  ), //medicical disription
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Size",
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 16,
                              color: textcolor,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 300,
                          ),
                          Text(
                            "${widget.size}",
                            style: TextStyle(
                              fontFamily: 'regular',
                              fontSize: 14,
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
                              fontSize: 16,
                              color: textcolor,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 300,
                          ),
                          Text(
                            "${widget.use}",
                            style: TextStyle(
                              fontFamily: 'regular',
                              fontSize: 14,
                              color: textcolor_light,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), //dose
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sterile",
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 16,
                              color: textcolor,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 300,
                          ),
                          Text(
                            "${widget.sterile}",
                            style: TextStyle(
                              fontFamily: 'regular',
                              fontSize: 14,
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
                              fontSize: 16,
                              color: textcolor,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 300,
                          ),
                          Text(
                            "${widget.category}",
                            style: TextStyle(
                              fontFamily: 'regular',
                              fontSize: 14,
                              color: textcolor_light,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), //Precautions And Warning
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 35,
                  ),
                ],
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
    Get.to(() => const surgical_cart(), transition: Transition.rightToLeft);
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
