import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:latlong2/latlong.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:http/http.dart' as http;
import 'package:medicineapp2/pick/pick_drop_final.dart';
import '../Models/popularcategories_model.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Color textcolor = Color(0xff1A1D44);
  Color bluecolor = Color(0xff014CC4);
  Color textcolor_white = Color(0xffACAEBA);
  Color white = Color(0xffffffff);
  Color background = Color(0xffF1F1F1);
  List<LatLng> _selectedPoints = [];

  late var startLat;
  late var startLon;
  late var endLat;
  late var endLon;

  void _handleTap(LatLng point) {
    setState(() {
      _selectedPoints.add(point);
      if (_selectedPoints.length > 2) {
        _selectedPoints.removeAt(0);
      }
    });
  }

  void _getSelectedCoordinates() {
    if (_selectedPoints.length == 2) {
      LatLng firstPoint = _selectedPoints[0];
      LatLng secondPoint = _selectedPoints[1];
      print('First point: ${firstPoint.latitude}, ${firstPoint.longitude}');
      print('Second point: ${secondPoint.latitude}, ${secondPoint.longitude}');
      startLat = firstPoint.latitude;
      startLon = firstPoint.longitude;
      endLat = secondPoint.latitude;
      endLon = secondPoint.longitude;
      print("$startLat,$startLon,$endLat,$endLon");
      fetchDistanceMatrix();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select two points on the map.'),
        ),
      );
    }
  }

  List<Item> deliveryandminval_list = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                          "Pick and Drop",
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
            Expanded(
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(30.3398, 76.3869),
                  zoom: 9.2,
                  onTap: (tapPosition, point) => _handleTap(point),
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayer(
                    markers: _selectedPoints
                        .map(
                          (point) => Marker(
                            width: 80.0,
                            height: 80.0,
                            point: point,
                            builder: (ctx) => const Icon(
                              Icons.location_on,
                              size: 30,
                              color: Colors.red,
                            ),
                          ),
                        )
                        .toList(),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
                    ),
                    Container(
                      height: 38.0,
                      child: Theme(
                        data: ThemeData(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            _getSelectedCoordinates();
                            fetch_discount_and_minimumvalue();
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
                                "Calculate Price",
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

  fetch_discount_and_minimumvalue() async {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: LoadingAnimationWidget.waveDots(
                color: Color(0xff273238),
                size: 80,
              ),
            ));
    var _map_deli_min = await FirebaseFirestore.instance
        .collection('deliverycharges and minimum value')
        .get();
    map_deliverychargesandminimumvalue(_map_deli_min);
  }

  map_deliverychargesandminimumvalue(QuerySnapshot<Map<String, dynamic>> data) {
    var deliveryandminval = data.docs
        .map((item) => Item(id: item.id, name: item['amount']))
        .toList();
    setState(() {
      deliveryandminval_list = deliveryandminval;
    });
    print(deliveryandminval_list[6].name);
    return deliveryandminval_list;
  }

  Future fetchDistanceMatrix() async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=$startLat,$startLon&destinations=$endLat,$endLon&key=AIzaSyBSfEJ-HVQI8VD-yrs5xJpFSrgLu7ZXZYU');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      var address1 = result['destination_addresses'];
      var destinationAddressString1 = address1.join(', ');
      var address2 = result['origin_addresses'];
      var destinationAddressString2 = address2.join(', ');
      var distance = result['rows'][0]['elements'][0]['distance']['text'];
      var time = result['rows'][0]['elements'][0]['duration']['text'];

      final distanceInKm =
          double.parse(distance.replaceAll(RegExp('[^0-9.]'), ''));
      print(time);

      Get.to(pick_and_drop_final(
        orgin_address: destinationAddressString2,
        destination_address: destinationAddressString1,
        Expected_time: time,
        price_km: deliveryandminval_list[6].name,
        total_distance: "$distanceInKm KM",
        total_price:
            "${distanceInKm * double.parse(deliveryandminval_list[6].name)}",
      ));
    } else {
      throw Exception('Failed to load distance matrix');
    }
  }
}
