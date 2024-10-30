import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPadding {
  static double xSmall = 4.r;
  static double small = 8.r;
  static double medium = 16.r;
  static double large = 20.r;
  static double xLarge = 24.r;
  static double xxLarge = 28.r;

  static EdgeInsets pagePadding = EdgeInsets.only(
    top: AppPadding.medium,
    right: AppPadding.medium,
    left: AppPadding.medium,
    bottom: 0,
  );
}
