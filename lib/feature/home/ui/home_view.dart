import 'package:flutter/material.dart';
import 'package:torliga/core/theming/app_paddings.dart';
import 'package:torliga/core/theming/app_spacing.dart';
import 'package:torliga/feature/home/ui/widgets/home_body.dart';

import 'widgets/home_background_effect.dart';
import 'widgets/home_tabs.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.centerRight,
        children: [
          const HomeBackgroundEffect(),
          Padding(
            padding: AppPadding.pagePadding,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeTabs(),
                VerticalSpacer(1),
                Expanded(
                  child: HomeBody(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
