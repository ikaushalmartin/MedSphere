import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Color(0xFF7A8C99)),
  contentPadding: EdgeInsets.all(5),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffffffff), width: 1.8),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffffffff), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
