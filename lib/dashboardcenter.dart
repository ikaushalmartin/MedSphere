import 'package:flutter/material.dart';

class dashboardcenter extends StatefulWidget {
  const dashboardcenter({Key? key}) : super(key: key);

  @override
  State<dashboardcenter> createState() => _dashboardcenterState();
}

class _dashboardcenterState extends State<dashboardcenter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
    );
  }
}
