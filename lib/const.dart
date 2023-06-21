import 'package:flutter/material.dart';

Color bluecolor = Color(0xff6588E6);
Color redcolor = Color(0xffE46473);
Color yellowcolor = Color(0xffF9BF80);
Color light_red = Color(0xffF2F1F6);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Color(0xff575F75), fontSize: 13),
  contentPadding: EdgeInsets.all(5),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffCDCFD6), width: 0),
    borderRadius: BorderRadius.all(Radius.circular(6.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffCDCFD6), width: 0),
    borderRadius: BorderRadius.all(Radius.circular(6.0)),
  ),
);
