import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redacted/redacted.dart';
import 'package:torliga/core/theming/colors.dart';
import 'package:torliga/feature/home/logic/matches/matches_bloc.dart';

import '../../../../core/theming/app_spacing.dart';
import '../../../../core/theming/app_text_styles.dart';

class HomeCompetitionTopBar extends StatelessWidget {
  final String? competitionName;
  final String? competitionImage;
  bool isExpanded;
  bool isLoading;
  HomeCompetitionTopBar(
      {super.key,
      this.isExpanded = true,
      this.competitionName,
      this.competitionImage,
      this.isLoading = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        /// circular card when expanded
        borderRadius: !isExpanded
            ? BorderRadius.all(Radius.circular(15.r))
            : BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              ),
        color: Theme.of(context).secondaryHeaderColor,
      ),
      child: Row(
        children: [
          Image.network(
            competitionImage ?? '',
            height: 44.h,
          ).redacted(
            context: context,
            redact: isLoading,
          ),
          const HorizontalSpacer(2),
          Expanded(
            child: Text(
              competitionName ?? 'N/A',
              style: AppTextStyles.bold(),
            ),
          ).redacted(
            context: context,
            redact: isLoading,
          ),
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
