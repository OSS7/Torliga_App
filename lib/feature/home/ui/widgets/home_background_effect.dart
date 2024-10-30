import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class HomeBackgroundEffect extends StatelessWidget {
  const HomeBackgroundEffect({super.key});

  @override
  Widget build(BuildContext context) {
    /// green circle and blur effect for background
    return Align(
      alignment: Alignment.centerLeft,
      widthFactor: 0.5,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              cPrimary.withOpacity(0.5),
              cAccentPrimary.withOpacity(0.5),
            ],
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
          child: Container(
            width: 0.6.sw,
          ),
        ),
      ),
    );
  }
}
