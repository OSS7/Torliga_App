import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// a widget provide a vertical  space like: put vertical space with 25% of screen size  between 2 widget
/// example: VerticalSpacer(2.5)
class VerticalSpacer extends StatelessWidget {
  const VerticalSpacer(this.value, {super.key});

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.01.sh * value,
    );
  }
}

/// a widget provide a horizontal  space like: put vertical space with 25% of screen size  between 2 widget
/// example: HorizontalSpacer(2.5)
class HorizontalSpacer extends StatelessWidget {
  const HorizontalSpacer(this.value, {super.key});

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.01.sw * value,
    );
  }
}
