import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Medicine/medicine.dart';

class orderbyprescription extends StatelessWidget {
  Color textcolor = Colors.white;

  Color buttontextcolor = Color(0xff273238);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "images/prescription.png",
            scale: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upload Prescription",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'semibold',
                  fontSize: 19,
                  color: textcolor,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 350,
              ),
              Text(
                "Order via prescription",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'regular',
                  fontSize: 16,
                  color: textcolor,
                ),
              ),
            ],
          ),
          ButtonTheme(
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  Get.to(() => medicine(), transition: Transition.rightToLeft);
                },
                elevation: 0,
                hoverElevation: 0,
                focusElevation: 0,
                highlightElevation: 0,
                height: MediaQuery.of(context).size.height / 20,
                minWidth: MediaQuery.of(context).size.height / 9,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Upload",
                  style: TextStyle(
                      color: buttontextcolor,
                      fontFamily: 'semibold',
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class noorderbyprescription extends StatelessWidget {
  Color textcolor = Colors.white;

  Color buttontextcolor = Color(0xff273238);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "images/questonmark.png",
            scale: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "No Prescription?",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'semibold',
                  fontSize: 19,
                  color: textcolor,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 350,
              ),
              Text(
                "Order after verifying",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'regular',
                  fontSize: 16,
                  color: textcolor,
                ),
              ),
            ],
          ),
          ButtonTheme(
            child: Center(
              child: MaterialButton(
                onPressed: () async {},
                elevation: 0,
                hoverElevation: 0,
                focusElevation: 0,
                highlightElevation: 0,
                height: MediaQuery.of(context).size.height / 20,
                minWidth: MediaQuery.of(context).size.height / 9,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Verify",
                  style: TextStyle(
                      color: buttontextcolor,
                      fontFamily: 'semibold',
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}

class orderbyprescription_medicinepage extends StatelessWidget {
  const orderbyprescription_medicinepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textcolor = Color(0xffdae1ff);
    Color buttontextcolor = Color(0xff273238);
    Color upload_prescription_button_bg = Color(0xffdae1ff);
    Color upload_prescription_button_text = Color(0xff001849);

    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Upload Prescription",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'semibold',
                      fontSize: 19,
                      color: textcolor,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 120,
                  ),
                  Text(
                    "Upload the photo and we will \ndeliver the medicine",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'regular',
                      fontSize: 14,
                      color: textcolor,
                    ),
                  ),
                ],
              ),
              Image.asset(
                "images/prescription.png",
                scale: 8,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonTheme(
                  child: Center(
                    child: MaterialButton(
                      onPressed: () {},
                      elevation: 0,
                      hoverElevation: 0,
                      focusElevation: 0,
                      highlightElevation: 0,
                      height: MediaQuery.of(context).size.height / 18,
                      minWidth: MediaQuery.of(context).size.height / 6,
                      color: upload_prescription_button_bg,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.camera_alt_rounded,
                            size: 25,
                            color: upload_prescription_button_text,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height / 80,
                          ),
                          Text(
                            "Camera",
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 18,
                              color: upload_prescription_button_text,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height / 20,
                ),
                ButtonTheme(
                  child: Center(
                    child: MaterialButton(
                      onPressed: () async {},
                      elevation: 0,
                      hoverElevation: 0,
                      focusElevation: 0,
                      highlightElevation: 0,
                      height: MediaQuery.of(context).size.height / 18,
                      minWidth: MediaQuery.of(context).size.height / 6,
                      color: upload_prescription_button_bg,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.photo,
                            size: 25,
                            color: upload_prescription_button_text,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height / 80,
                          ),
                          Text(
                            "Gallery",
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 18,
                              color: upload_prescription_button_text,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
    ;
  }
}

class callus_to_place_order extends StatelessWidget {
  const callus_to_place_order({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textcolor = Color(0xffffdadb);
    Color buttontextcolor = Color(0xff40000e);
    Color buttonbg = Color(0xffffdadb);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "images/call2.png",
            scale: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Call And Order",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'semibold',
                  fontSize: 19,
                  color: textcolor,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 350,
              ),
              Text(
                "Place your order via call",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'regular',
                  fontSize: 16,
                  color: textcolor,
                ),
              ),
            ],
          ),
          ButtonTheme(
            child: Center(
              child: MaterialButton(
                onPressed: () async {},
                elevation: 0,
                hoverElevation: 0,
                focusElevation: 0,
                highlightElevation: 0,
                height: MediaQuery.of(context).size.height / 20,
                minWidth: MediaQuery.of(context).size.height / 9,
                color: buttonbg,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Call",
                  style: TextStyle(
                      color: buttontextcolor,
                      fontFamily: 'semibold',
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
