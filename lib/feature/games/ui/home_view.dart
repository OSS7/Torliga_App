import 'package:flutter/material.dart';
import 'package:torliga/core/theming/app_paddings.dart';
import 'package:torliga/core/theming/colors.dart';

import 'widgets/home_background_effect.dart';
import 'widgets/home_competition_card.dart';
import 'widgets/home_tabs.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: cSecondary,
        body: Stack(
          alignment: Alignment.centerRight,
          children: [
            const HomeBackgroundEffect(),
            Padding(
              padding: AppPadding.pagePadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const HomeTabs(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          HomeCompetitionCard(),
                          HomeCompetitionCard(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
