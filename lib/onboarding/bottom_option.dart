import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Auth/login.dart';

class bottomoption extends StatelessWidget {
  const bottomoption({required this.totalpages, required this.activepages});
  final int totalpages;
  final int activepages;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(totalpages, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: activepages == index ? 15 : 7,
                  height: 7,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: activepages == index
                          ? Color(0xff014CC4)
                          : Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5)),
                );
              })),
        ),
        SizedBox(height: 8),
        ButtonTheme(
            child: MaterialButton(
          onPressed: () {
            Get.offAll(() => const login(), transition: Transition.rightToLeft);
          },
          elevation: 0,
          hoverElevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          minWidth: MediaQuery.of(context).size.width / 1.17,
          height: 52,
          color: Color(0xff014CC4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Text(
            "Get Started",
            style: TextStyle(
                color: Colors.white, fontFamily: 'Poppins', fontSize: 18),
          ),
        )),
      ],
    );
  }
}
