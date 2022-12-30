import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

class dashboardcenter extends StatefulWidget {
  const dashboardcenter({Key? key}) : super(key: key);

  @override
  State<dashboardcenter> createState() => _dashboardcenterState();
}

class _dashboardcenterState extends State<dashboardcenter> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // height: MediaQuery.of(context).size.height / 1.451,
        //  width: MediaQuery.of(context).size.width,
        //color: Colors.black54,
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
