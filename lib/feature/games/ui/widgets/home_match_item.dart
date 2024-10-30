import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_spacing.dart';
import '../../../../core/theming/app_text_styles.dart';

class HomeMatchItem extends StatelessWidget {
  const HomeMatchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      padding: const EdgeInsets.all(10),
      color: Theme.of(context).colorScheme.onPrimaryContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Competition',
            style: AppTextStyles.bold(),
          ),
          const HorizontalSpacer(2),
          Image.network(
              'https://torliga-forge-staging.s3.eu-central-1.amazonaws.com/thesports/teams/shirts/atalanta_gx7lm7phyw6m2wd_1714292564.png'),
          const HorizontalSpacer(2),
          Text(
            '10:00',
            style: AppTextStyles.bold(),
          ),
          const HorizontalSpacer(2),
          Image.network(
              'https://torliga-forge-staging.s3.eu-central-1.amazonaws.com/thesports/teams/shirts/atalanta_gx7lm7phyw6m2wd_1714292564.png'),
          const HorizontalSpacer(2),
          Text(
            'Competition',
            style: AppTextStyles.bold(),
          ),
        ],
      ),
    );
  }
}
