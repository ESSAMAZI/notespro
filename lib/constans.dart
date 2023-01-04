// ignore_for_file: constant_identifier_names, non_constant_identifier_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const KPrimaryColor = Color(0xff62FCD7);
const kNotesBox = 'notes_box';
//color palette generator
List<Color> kColors = const [
  Color(0xff19535f),
  Color(0xff0b7a75),
  Color(0xffD7C9AA),
  Color(0xff7B2D26),
  Color(0xffF0F3F5),
];
// /// برمجه الاشعارات الرسائل الصغيرة السفليه
void ShowToast({required String text, required ToastStates states}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(states),
        textColor: Colors.white,
        fontSize: 16.0);

// ignore: constant_identifier_names
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates states) {
  Color color;
  switch (states) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
