import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:latlong2/latlong.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:http/http.dart' as http;
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
  final apiURL = 'https://api.openrouteservice.org/v2/directions/driving-car';
  final apiKey = '5b3ce3597851110001cf624879014225f1aa41329b4115112d47602b';
  final startLat = 8.681495;
  final startLon = 49.41461;
  final endLat = 8.687872;
  final endLon = 49.420318;

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
                            builder: (ctx) => Icon(
                              Icons.location_on,
                              size: 50,
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
                            fetch_distance();
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

  fetch_distance() async {
    final response = await http.get(Uri.parse(
        '$apiURL?api_key=$apiKey&start=$startLat,$startLon&end=$endLat,$endLon'));

    if (response.statusCode == 200) {
      // API request successful, parse the JSON response
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
    } else {
      // API request failed, handle the error
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
