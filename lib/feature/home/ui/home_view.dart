import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redacted/redacted.dart';
import 'package:torliga/core/theming/app_paddings.dart';
import 'package:torliga/core/theming/app_spacing.dart';
import 'package:torliga/core/theming/colors.dart';

import '../logic/matches/matches_bloc.dart';
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
                  const VerticalSpacer(1),
                  Expanded(
                    child: BlocBuilder<MatchesBloc, MatchesState>(
                      bloc: matchesBloc..add(GetMatchesEvent('todayMatches')),
                      builder: (context, state) {
                        return ListView.builder(
                                shrinkWrap: true,
                                itemCount: matchesBloc.competitions?.length ?? 1,
                                itemBuilder: (context, index) {
                                  final _competition =
                                      matchesBloc.competitions?[index];
                                  return HomeCompetitionCard(
                                    competition: state is MatchesLoading
                                        ? null
                                        : _competition,
                                    isLoading: state is MatchesLoading,
                                  );
                                },
                              );
                      },
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
