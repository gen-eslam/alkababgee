import 'package:alkababgee/core/helper/enums.dart';
import 'package:flutter/material.dart';

abstract class ColorsManager {
  static const Color yellow = Color.fromARGB(255, 255, 183, 0);
  //8b2323
  static const Color deepRed = Color(0xff8b2323);
  static const Color white = Color(0xffFFFFFF);
  static const Color gray = Color(0xff707070);
  static const Color green = Color(0xff04AF70);
  static const Color red = Color(0xffFF0000);

  static Color colorState(ColorState colorState) {
    switch (colorState) {
      case ColorState.sucess:
        return green;
      case ColorState.failure:
        return red;
      case ColorState.warning:
        return yellow;
    }
  }
}
