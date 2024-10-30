import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:torliga/core/theming/colors.dart';

class AppTextStyles {
  AppTextStyles._();
  static TextStyle regular({
    double fontSize = 12,
    Color? color,
    TextDecoration? textDecoration,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontWeight: FontWeight.normal,
      color: color ?? cOnSecondary,
      decoration: textDecoration,
    );
  }

  static TextStyle bold(
      {double fontSize = 12, Color? color, TextDecoration? textDecoration}) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontWeight: FontWeight.w700,
      color: color ?? cOnSecondary,
      decoration: textDecoration,
    );
  }
}
