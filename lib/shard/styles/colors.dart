import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

final defaultColor = HexColor("#FEDE3F");
const GroceryColor = Color.fromRGBO(130, 255, 176, 0.73);
const yellowLightColor = Color.fromRGBO(255, 251, 130, 0.73);
const greyColor = Colors.grey;

const blackColor = Colors.black;
final myMaterialColor = MaterialColor(defaultColor.value, <int, Color>{
  50: defaultColor,
  100: defaultColor,
  200: defaultColor,
  300: defaultColor,
  400: defaultColor,
  500: defaultColor,
  600: defaultColor,
  700: defaultColor,
  800: defaultColor,
  900: defaultColor,
});
