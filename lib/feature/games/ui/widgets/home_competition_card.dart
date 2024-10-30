import 'package:flutter/material.dart';
import 'package:torliga/core/theming/app_spacing.dart';

import 'home_competition_top_bar.dart';
import 'home_match_item.dart';

class HomeCompetitionCard extends StatefulWidget {
  const HomeCompetitionCard({super.key});

  @override
  State<HomeCompetitionCard> createState() => _HomeCompetitionCardState();
}

class _HomeCompetitionCardState extends State<HomeCompetitionCard> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpacer(2),
        InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: HomeCompetitionTopBar(
            isExpanded: isExpanded,
          ),
        ),
        if (isExpanded)
          ListView.builder(
            itemCount: 6,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return const HomeMatchItem();
            },
          ),
      ],
    );
  }
}
