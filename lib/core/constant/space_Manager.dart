import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppPadding {
  static double p4 = 4.0.r;
  static double p8 = 8.0.r;
  static double p12 = 12.0.r;
  static double p16 = 16.0.r;
  static double p24 = 24.0.r;
  static double p32 = 32.0.r;
  static double p48 = 48.0.r;
}

abstract class AppSpace {
  static double s8 = 8.0;
  static double s12 = 12.0;
  static double s16 = 16.0;
  static double s24 = 24.0;
  static double s32 = 32.0;
  static double s48 = 48.0;
}

abstract class AppSizedBox {
  static SizedBox h4 = SizedBox(
    height: 4.r,
    width: 4.r,
  );
  static SizedBox h8 = SizedBox(
    height: 8.r,
    width: 8.r,
  );
  static SizedBox h10 = SizedBox(
    height: 10.r,
    width: 10.r,
  );
  static SizedBox h12 = SizedBox(
    height: 12.r,
    width: 12.r,
  );
  static SizedBox h16 = SizedBox(
    height: 16.r,
    width: 16.r,
  );
  static SizedBox h24 = SizedBox(
    height: 24.r,
    width: 24.r,
  );
  static SizedBox h32 = SizedBox(
    height: 32.r,
    width: 32.r,
  );
  static SizedBox h48 = SizedBox(
    height: 48.r,
    width: 48.r,
  );
  static SizedBox h64 = SizedBox(
    height: 64.r,
    width: 64.r,
  );
  static SizedBox h100 = SizedBox(
    height: 100.r,
    width: 100.r,
  );
}
