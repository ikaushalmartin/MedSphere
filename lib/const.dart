import 'package:flutter/material.dart';

Color bluecolor = Color(0xff6588E6);
Color redcolor = Color(0xffE46473);
Color yellowcolor = Color(0xffF9BF80);
Color light_red = Color(0x33000000);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Color(0x80181818)),
  contentPadding: EdgeInsets.all(5),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0x33000000), width: 1),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0x33000000), width: 0.2),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
