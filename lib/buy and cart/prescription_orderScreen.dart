import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../Models/address_model.dart';
import '../const.dart';
import '../main.dart';

class prescription_orderscreen extends StatefulWidget {
  var selectedFile;
  prescription_orderscreen({Key? key, required this.selectedFile})
      : super(key: key);

  @override
  State<prescription_orderscreen> createState() =>
      _prescription_orderscreenState();
}

class _prescription_orderscreenState extends State<prescription_orderscreen> {
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color textcolor_light = Color(0xffACAEBA);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);

  final _formKey = GlobalKey<FormState>();
  TextEditingController patientname = TextEditingController();
  TextEditingController patientphone = TextEditingController();
  TextEditingController patientpincode = TextEditingController();
  TextEditingController patientaddress = TextEditingController();

  List<address_model> user_address = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_user_address();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: Column(
          children: [
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Container(
                    color: white,
                    child: Column(
                      children: [
                        Padding(
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
                                "Deatils",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 16,
                                  color: textcolor,
                                ),
                              ),
                              Theme(
                                data: ThemeData(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.circle),
                                  color: white,
                                  iconSize: 0,
                                ),
                              )
                            ],
                          ), //toprow
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height / 60,
                        top: MediaQuery.of(context).size.height / 60,
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Prescription",
                            style: TextStyle(
                              fontFamily: 'medium',
                              fontSize: 16,
                              color: textcolor,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 100,
                          ),
                          Center(
                            child: Image.file(
                              widget.selectedFile,
                              height: MediaQuery.of(context).size.height / 3,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 100),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 60,
                        left: MediaQuery.of(context).size.height / 60,
                        right: MediaQuery.of(context).size.height / 60,
                        bottom: MediaQuery.of(context).size.height / 60,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your Details",
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 16,
                                color: textcolor,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 65),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  decoration: BoxDecoration(
                                    color: background,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: TextFormField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(30),
                                    ],
                                    enableInteractiveSelection: false,
                                    controller: patientname,
                                    keyboardType: TextInputType.name,
                                    style: TextStyle(color: textcolor),
                                    textAlign: TextAlign.left,
                                    decoration: kTextFieldDecoration.copyWith(
                                        contentPadding:
                                            EdgeInsets.only(left: 20),
                                        hintText: "Name"),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (firstname) =>
                                        firstname != null &&
                                                firstname.length! < 1
                                            ? 'Name cannot be empty'
                                            : null,
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  decoration: BoxDecoration(
                                    color: background,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: TextFormField(
                                    enableInteractiveSelection: false,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(7),
                                    ],
                                    onChanged: (value) {},
                                    controller: patientpincode,
                                    keyboardType: TextInputType.phone,
                                    style: TextStyle(color: textcolor),
                                    textAlign: TextAlign.left,
                                    decoration: kTextFieldDecoration.copyWith(
                                        contentPadding:
                                            EdgeInsets.only(left: 20),
                                        hintText: "Pincode"),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (phone) =>
                                        phone != null && phone.length < 6
                                            ? 'Enter a valid pincode'
                                            : null,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 80),
                            Container(
                              //  width: MediaQuery.of(context).size.width / 2.4,
                              decoration: BoxDecoration(
                                color: background,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: TextFormField(
                                onChanged: (value) {},
                                enableInteractiveSelection: false,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(12),
                                ],
                                controller: patientphone,
                                keyboardType: TextInputType.phone,
                                style: TextStyle(color: textcolor),
                                textAlign: TextAlign.left,
                                decoration: kTextFieldDecoration.copyWith(
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: "Phone"),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (phone) =>
                                    phone != null && phone.length < 10
                                        ? 'Enter a valid phone number'
                                        : null,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 80),
                            Container(
                              //  width: MediaQuery.of(context).size.width / 2.4,
                              decoration: BoxDecoration(
                                color: background,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: TextFormField(
                                onChanged: (value) {},
                                enableInteractiveSelection: false,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(60),
                                ],
                                controller: patientaddress,
                                keyboardType: TextInputType.name,
                                style: TextStyle(color: textcolor),
                                textAlign: TextAlign.left,
                                decoration: kTextFieldDecoration.copyWith(
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: "Address"),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (phone) =>
                                    phone != null && phone.length < 10
                                        ? 'Enter a valid address'
                                        : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 100),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 60,
                    ),
                    child: Text(
                      "Saved Address",
                      style: TextStyle(
                        fontFamily: 'medium',
                        fontSize: 16,
                        color: textcolor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height / 60,
                      right: MediaQuery.of(context).size.height / 60,
                    ),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: user_address.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height / 60,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                patientname.text = user_address[index].name;
                                patientpincode.text =
                                    user_address[index].pincode;
                                patientphone.text = user_address[index].phone;
                                patientaddress.text =
                                    user_address[index].useraddress;
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top:
                                        MediaQuery.of(context).size.height / 80,
                                    left:
                                        MediaQuery.of(context).size.height / 60,
                                    right:
                                        MediaQuery.of(context).size.height / 60,
                                    bottom:
                                        MediaQuery.of(context).size.height / 80,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${user_address[index].name}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'medium',
                                          fontSize: 16,
                                          color: textcolor,
                                        ),
                                      ),
                                      Text(
                                        "Phone : ${user_address[index].phone}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'medium',
                                          fontSize: 14,
                                          color: textcolor_light,
                                        ),
                                      ),
                                      Text(
                                        "${user_address[index].useraddress}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'regular',
                                          fontSize: 14,
                                          color: textcolor_light,
                                        ),
                                      ),
                                      Text(
                                        "${user_address[index].pincode}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'regular',
                                          fontSize: 14,
                                          color: textcolor_light,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Container(
              color: white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 15,
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Prescription",
                      style: TextStyle(
                        fontFamily: 'medium',
                        fontSize: 14,
                        color: textcolor,
                      ),
                    ),
                    SizedBox(
                      height: 38.0,
                      child: MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            uploadImageToFirebaseStorage();
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        child: Ink(
                          decoration: BoxDecoration(
                              color: bluecolor,
                              borderRadius: BorderRadius.circular(6)),
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 150.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Order",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontFamily: "medium"),
                            ),
                          ),
                        ),
                      ),
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

  Future<void> uploadImageToFirebaseStorage() async {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));
    FirebaseStorage storage = FirebaseStorage.instance;
    final currentTime = DateTime.now();
    final formatter = DateFormat('yyyyMMdd_HHmmss');
    final imageName = formatter.format(currentTime);
    String fileName = imageName.toString() + uid.toString();
    String uniqueFileName = fileName;

    // Create a reference to the storage location
    Reference storageRef =
        storage.ref().child('Doctors_Identity/$uniqueFileName');

    // Upload the image to storage
    TaskSnapshot uploadTask = await storageRef.putFile(widget.selectedFile);

    // Get the download URL for the image
    String imageUrl = await storageRef.getDownloadURL();

    // Do something with the download URL, like store it in Cloud Firestore or display it in your app
    print(imageUrl);
    book_rentals(imageUrl);
  }

  Future book_rentals(String uniqueFileName) async {
    await FirebaseFirestore.instance
        .collection('/ORDERS')
        .doc('prescription_orders')
        .collection("$uid")
        .doc("${DateTime.now()}")
        .set({
      'Url': uniqueFileName,
      'Coustmer Name': patientname.text,
      'pincode': patientpincode.text,
      'phone': patientphone.text,
      'status': 'Pending',
      'Cutprice': "NIL"
    });

    await FirebaseFirestore.instance
        .collection('Order_Status')
        .doc(uid)
        .collection("oders")
        .add({
      "Cutprice": "NA",
      "Info": "NA",
      "Name": "Prescription",
      "Price": "NA",
      "Status": "Pending",
      "Quantity": 0
    });

    Navigator.of(context).pop();
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      headerAnimationLoop: false,
      dialogType: DialogType.success,
      title: 'Success',
      desc: 'Got Your Details!\nWill Get Back To You Soon!!',
      btnOkOnPress: () {
        debugPrint('OnClcik');
      },
      btnOkIcon: Icons.check_circle,
    )..show();
  }

  fetch_user_address() async {
    var address_var = await FirebaseFirestore.instance
        .collection('/Saved_address/$uid/Saved Addesses')
        .get();
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));
    map_rental_details(address_var);
  }

  map_rental_details(QuerySnapshot<Map<String, dynamic>> data) {
    var _doctor_deatils_list = data.docs
        .map((item) => address_model(
              id: item.id,
              name: item['Customer Name'],
              useraddress: item['address'],
              phone: item['phone'],
              pincode: item['pincode'],
            ))
        .toList();

    setState(() {
      user_address = _doctor_deatils_list;
    });
    Navigator.of(context).pop();
  }
}
