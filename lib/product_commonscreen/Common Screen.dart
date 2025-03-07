import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/const.dart';
import 'package:medicineapp2/main.dart';
import 'package:readmore/readmore.dart';

import '../Models/cart_model.dart';
import '../Models/popularcategories_model.dart';
import '../buy and cart/cart.dart';

class product_common_screen extends StatefulWidget {
  // String id;
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
  String ingredients;

  product_common_screen(
      {Key? key,
      //  required this.id,
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
      required this.ingredients})
      : super(key: key);

  @override
  State<product_common_screen> createState() => _product_common_screenState();
}

class _product_common_screenState extends State<product_common_screen> {
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color textcolor_light = Color(0xffACAEBA);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);

  int quantity_second = 1;
  List<cartmodel> deliveryandminval_list_for_check = [];
  bool enable = true;
  late int quantity_index;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_cart_data_for_check();
  }

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
                color: white,
                child: Padding(
                  padding: EdgeInsets.only(
                      // top: MediaQuery.of(context).size.height / 50,
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
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${widget.heading}",
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 16,
                                color: textcolor,
                              ),
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
                            Get.to(() => cart(),
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
                          "${widget.image_url}",
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
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.9,
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
                                Text(
                                  "${widget.quantity}",
                                  style: TextStyle(
                                    fontFamily: 'bold',
                                    fontSize: 11,
                                    color: textcolor_light,
                                  ),
                                ), //quantity
                                Text("${widget.company}",
                                    style: TextStyle(
                                      fontFamily: 'semibold',
                                      fontSize: 12,
                                      color: bluecolor,
                                    )),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 60,
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
                                              "MRP₹${widget.cuttopdeals}",
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
                                  height:
                                      MediaQuery.of(context).size.height / 20,
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
                                                          quantity_second =
                                                              x + 1;
                                                          checkButton();
                                                          if (enable == false) {
                                                            updateDocument(
                                                                deliveryandminval_list_for_check[
                                                                        quantity_index]
                                                                    .id);
                                                          }

                                                          Navigator.of(context)
                                                              .pop();
                                                          setState(() {
                                                            quantity_second;
                                                          });
                                                        },
                                                        child: SizedBox(
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
                                        'Qty - $quantity_second',
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
                                        addtocart(widget.name, widget.price,
                                            widget.company);
                                      } else {
                                        var checksnackbar = SnackBar(
                                          content:
                                              const Text("Item Already Added!"),
                                          // backgroundColor: textcolor,
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
                                    child: Ink(
                                      decoration: BoxDecoration(
                                          color: bluecolor,
                                          borderRadius:
                                              BorderRadius.circular(6.0)),
                                      child: Container(
                                        constraints: BoxConstraints(
                                          minHeight: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
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
                                  "Medical Discription",
                                  style: TextStyle(
                                    fontFamily: 'medium',
                                    fontSize: 16,
                                    color: textcolor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 250,
                            ),
                            ReadMoreText(
                              "${widget.medicaldiscription}",
                              style: TextStyle(
                                fontFamily: 'regular',
                                fontSize: 14,
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
                              "Dose",
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
                              "${widget.doses}",
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
                              "${widget.uses}",
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
                              "Salts or Ingredients",
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
                              "${widget.ingredients}",
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
                              "${widget.uses}",
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
                              "Precautions And Warning",
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
                              "${widget.precaution_and_warning}",
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
                              "Side Effects",
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
                              "${widget.sideeffect}",
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
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Future addtocart(String productname, String price, String company) async {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));
    await FirebaseFirestore.instance
        .collection('medicine_cart')
        .doc(uid)
        .collection("cartitems")
        .add({
      'cutprice': widget.cuttopdeals,
      'company': company,
      'price': price,
      'productname': productname,
      'imageurl': widget.image_url,
      'quantity': quantity_second,
      'Medical_Discription': widget.medicaldiscription,
      'Uses': widget.uses,
      'Doses': widget.doses,
      'Side_Effect': widget.sideeffect,
      'Precaution_and_warning': widget.precaution_and_warning,
      'Salts': widget.ingredients
    });
    Navigator.of(context).pop();
    var vpasswordsnackbar = SnackBar(
      content: const Text("Item Added To Cart!"),
      //  backgroundColor: textcolor,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),
      duration: Duration(milliseconds: 2000),
      behavior: SnackBarBehavior.floating,
    );
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(vpasswordsnackbar);
    });
    Get.to(() => const cart(), transition: Transition.rightToLeft);
  }

  fetch_cart_data_for_check() async {
    var _cart_data = await FirebaseFirestore.instance
        .collection('medicine_cart')
        .doc(uid)
        .collection("cartitems")
        .get();
    map_cart_dataforcheck(_cart_data);
  }

  map_cart_dataforcheck(QuerySnapshot<Map<String, dynamic>> data) {
    var cart_item = data.docs
        .map((item) => cartmodel(
            id: item.id,
            cutprice: item['cutprice'],
            url: item['imageurl'],
            company: item['company'],
            productname: item['productname'],
            price: item['price'],
            quantity: item['quantity']))
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
        quantity_index = i;

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

  void updateDocument(String documentId) async {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));
    await FirebaseFirestore.instance
        .collection('medicine_cart')
        .doc(uid)
        .collection("cartitems")
        .doc(documentId)
        .update({
      "quantity": quantity_second,
    });

    Navigator.of(context).pop();
  }
}
