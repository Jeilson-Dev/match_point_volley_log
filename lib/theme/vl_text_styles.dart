import 'package:flutter/material.dart';

class VLTextStyle {
  static TextStyle timer({Color? color}) => TextStyle(fontSize: 60, fontFamily: 'Digital', fontWeight: FontWeight.bold, color: color);
  static TextStyle score({Color? color}) => TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: color);
  static TextStyle scoreText({Color? color}) => TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color);
  static TextStyle dialogTitle({Color? color}) => TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color);
  static TextStyle dialogButton({Color? color}) => TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color);
  static TextStyle dialogMessage({Color? color}) => TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: color);
}
