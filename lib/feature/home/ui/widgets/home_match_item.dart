import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:torliga/feature/home/data/models/match_model.dart';

import '../../../../core/theming/app_spacing.dart';
import '../../../../core/theming/app_text_styles.dart';

class HomeMatchItem extends StatelessWidget {
  final MatchModel? match;
  const HomeMatchItem({super.key, this.match});

  @override
  Widget build(BuildContext context) {
    final homeTeamGoal = match?.homeTeam?.score?[0] ?? 0;
    final awayTeamGoal = match?.homeTeam?.score?[0] ?? 0;
    final matchStarted = match?.kickOff ?? 0;
    return Container(
      height: 0.08.sh,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          /// first team name and t-shirt
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  match?.homeTeam?.name ?? 'N/A',
                  style: AppTextStyles.bold(),
                ),
                const HorizontalSpacer(2),
                Image.network(
                  match?.homeTeam?.shirt ?? '',
                  height: 0.04.sh,
                ),
              ],
            ),
          ),
          const HorizontalSpacer(2),

          /// if match is not started yet, show match time, if started, show scores
          Text(
            matchStarted == 1
                ? '$homeTeamGoal - $awayTeamGoal'
                : match?.matchTime ?? 'N/A',
            style: AppTextStyles.bold(),
            textAlign: TextAlign.center,
          ),
          const HorizontalSpacer(2),

          /// second team name and t-shirt
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  match?.awayTeam?.shirt ?? '',
                  height: 0.04.sh,
                ),
                const HorizontalSpacer(2),
                Text(
                  match?.awayTeam?.name ?? 'N/A',
                  style: AppTextStyles.bold(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
