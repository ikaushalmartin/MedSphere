import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medicineapp2/product_commonscreen/Common%20Screen.dart';

import '../Models/topdeals_model.dart';
import '../buy and cart/cart.dart';

class discount_products extends StatefulWidget {
  List<topdeals> productlist = [];
  List item_image = [];
  discount_products(
      {Key? key, required this.productlist, required this.item_image})
      : super(key: key);

  @override
  State<discount_products> createState() => _discount_productsState();
}

class _discount_productsState extends State<discount_products> {
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
  Color textcolor_white = Color(0xffACAEBA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: background,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: white,
                height: MediaQuery.of(context).size.height / 16,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 200),
                  child: Row(
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
                        "Discounted Deals",
                        style: TextStyle(
                          fontFamily: 'medium',
                          fontSize: 16,
                          color: textcolor,
                        ),
                      ),
                    ],
                  ), //toprow
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height / 60,
                    right: MediaQuery.of(context).size.height / 60,
                  ),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: widget.item_image.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                                () => product_common_screen(
                                      heading: "Medicine Detail",
                                      image_url: widget.item_image[index],
                                      name: widget.productlist[index].name,
                                      precaution_and_warning: widget
                                          .productlist[index]
                                          .precaution_and_warning,
                                      sideeffect:
                                          widget.productlist[index].sideeffect,
                                      doses: widget.productlist[index].doses,
                                      uses: widget.productlist[index].uses,
                                      medicaldiscription: widget
                                          .productlist[index]
                                          .medicaldiscription,
                                      company:
                                          widget.productlist[index].company,
                                      quantity:
                                          widget.productlist[index].quantity,
                                      cuttopdeals:
                                          widget.productlist[index].cuttopdeals,
                                      price: widget.productlist[index].price,
                                      ingredients:
                                          widget.productlist[index].salts,
                                    ),
                                transition: Transition.rightToLeft);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height / 60,
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 80,
                                  left: MediaQuery.of(context).size.height / 60,
                                  right:
                                      MediaQuery.of(context).size.height / 60,
                                  bottom:
                                      MediaQuery.of(context).size.height / 80,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      child: Image.network(
                                        widget.item_image[index],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.6,
                                          child: Text(
                                            "${widget.productlist[index].name}",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'medium',
                                              fontSize: 14,
                                              color: textcolor,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Offer Price - ₹${widget.productlist[index].price}",
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                fontFamily: 'medium',
                                                fontSize: 12,
                                                color: Colors.red,
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  20,
                                            ),
                                            Text(
                                              "MRP ₹${widget.productlist[index].cuttopdeals}",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                fontFamily: 'medium',
                                                fontSize: 12,
                                                color: textcolor_white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ));
  }
}
