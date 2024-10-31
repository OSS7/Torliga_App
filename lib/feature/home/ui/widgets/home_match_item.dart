import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redacted/redacted.dart';
import 'package:torliga/feature/home/data/models/match_model.dart';

import '../../../../core/theming/app_spacing.dart';
import '../../../../core/theming/app_text_styles.dart';

class HomeMatchItem extends StatelessWidget {
  final MatchModel? match;
  final bool isLoading;
  const HomeMatchItem({super.key, this.match, this.isLoading = true});

  @override
  Widget build(BuildContext context) {
    final homeTeamName = match?.homeTeam?.name ?? 'N/A';
    final awayTeamName = match?.awayTeam?.name ?? 'N/A';
    final homeTeamShirt = match?.homeTeam?.shirt ??
        'https://img.thesports.com/football/team/3e724dc0e6fffd01a630b65af348fab6.png';
    final awayTeamShirt = match?.awayTeam?.shirt ??
        'https://img.thesports.com/football/team/3e724dc0e6fffd01a630b65af348fab6.png';
    final homeTeamGoal = match?.homeTeam?.score?[0] ?? 0;
    final awayTeamGoal = match?.homeTeam?.score?[0] ?? 0;
    final matchStarted = match?.kickOff ?? 0;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          /// first team name and shirt
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 0.22.sw,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      homeTeamName,
                      style: AppTextStyles.bold(),
                    ),
                  ),
                ),
                const HorizontalSpacer(2),
                Image.network(
                  homeTeamShirt,
                  height: 0.04.sh,
                ),
              ],
            ),
          ).redacted(
            context: context,
            redact: isLoading,
          ),
          const HorizontalSpacer(2),

          /// if match is not started yet, show match time, if started, show scores
          Text(
            matchStarted != 0
                ? '$homeTeamGoal - $awayTeamGoal'
                : match?.matchTime ?? 'N/A',
            style: AppTextStyles.bold(),
            textAlign: TextAlign.center,
          ).redacted(
            context: context,
            redact: isLoading,
          ),
          const HorizontalSpacer(2),

          /// second team name and shirt
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  awayTeamShirt,
                  height: 0.04.sh,
                ),
                const HorizontalSpacer(2),
                SizedBox(
                  width: 0.22.sw,
                  child: Text(
                    awayTeamName,
                    style: AppTextStyles.bold(),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ).redacted(
            context: context,
            redact: isLoading,
          ),
        ],
      ),
    );
  }
}
