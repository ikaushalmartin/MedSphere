import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medicineapp2/rentals/rental_commonscreen.dart';

import '../buy and cart/cart.dart';
import '../const.dart';
import '../doctor/doctor_model.dart';

class rental extends StatefulWidget {
  const rental({Key? key}) : super(key: key);

  @override
  State<rental> createState() => _rentalState();
}

class _rentalState extends State<rental> {
  List rental_machine_image = [];
  List<doc> rental_machine_info = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_rentals_details();
    top_images();
  }

  @override
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
  Color textcolor_light = Color(0xffACAEBA);

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
                        "Medical Rentals",
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
              Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height / 60,
                    right: MediaQuery.of(context).size.height / 60,
                    bottom: MediaQuery.of(context).size.height / 100,
                  ),
                  child: Text(
                    "Available Rentals",
                    style: TextStyle(
                      fontFamily: 'medium',
                      fontSize: 16,
                      color: textcolor,
                    ),
                  )),
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
                      itemCount: rental_machine_image.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                                () => rental_commonscreen(
                                    name: rental_machine_info[index].name,
                                    company:
                                        rental_machine_info[index].hospital,
                                    description: rental_machine_info[index].bio,
                                    available_for_time:
                                        rental_machine_info[index].workinghours,
                                    priceperday:
                                        rental_machine_info[index].experience,
                                    use: rental_machine_info[index].specialist,
                                    imageurl: rental_machine_image[index]),
                                transition: Transition.rightToLeft);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.height / 60,
                                right: MediaQuery.of(context).size.height / 60,
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        foregroundImage: NetworkImage(
                                          rental_machine_image[index],
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "${rental_machine_info[index].name}",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'medium',
                                              fontSize: 16,
                                              color: textcolor,
                                            ),
                                          ),
                                          Text(
                                            "${rental_machine_info[index].hospital}",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'medium',
                                              fontSize: 14,
                                              color: textcolor_light,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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

  fetch_rentals_details() async {
    var doctor_details =
        await FirebaseFirestore.instance.collection('rental details').get();
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));
    map_rental_details(doctor_details);
  }

  map_rental_details(QuerySnapshot<Map<String, dynamic>> data) {
    var _doctor_deatils_list = data.docs
        .map((item) => doc(
            id: item.id,
            hospital: item['Company'],
            name: item['Name'],
            specialist: item['Use'],
            bio: item['Description'],
            experience: item['priceperday'],
            workinghours: item['application']))
        .toList();

    setState(() {
      rental_machine_info = _doctor_deatils_list;
    });
  }

  Future top_images() async {
    ListResult result =
        await FirebaseStorage.instance.ref().child("/rental images").list();
    List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      String fileUrl = await file.getDownloadURL();
      rental_machine_image.add(fileUrl);
    });

    setState(() {
      rental_machine_image;
    });
    Navigator.of(context).pop();
    return rental_machine_image;
  }
}
