import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:torliga/core/theming/colors.dart';

import '../../../../core/theming/app_spacing.dart';
import '../../../../core/theming/app_text_styles.dart';

class HomeCompetitionTopBar extends StatelessWidget {
  bool isExpanded;
  HomeCompetitionTopBar({super.key, this.isExpanded = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Theme.of(context).secondaryHeaderColor,
      ),
      child: Row(
        children: [
          Image.network(
              'https://img.thesports.com/football/competition/6b38f4015a6b3309ad9462e6ce27ae99.png'),
          const HorizontalSpacer(2),
          Text(
            'Competition',
            style: AppTextStyles.bold(),
          ),
          Spacer(),
          Icon(
            isExpanded
                ? Icons.keyboard_arrow_down_outlined
                : Icons.keyboard_arrow_up_outlined,
            color: cOnSecondary,
          ),
        ],
      ),
    );
  }
}
