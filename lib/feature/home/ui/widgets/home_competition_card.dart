import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redacted/redacted.dart';
import 'package:torliga/feature/home/data/models/competition_model.dart';
import '../../../../core/theming/app_paddings.dart';

import 'home_competition_top_bar.dart';
import 'home_match_item.dart';

class HomeCompetitionCard extends StatefulWidget {
  final CompetitionModel? competition;
  final bool isLoading;
  const HomeCompetitionCard({
    super.key,
    this.competition,
    this.isLoading = true,
  });

  @override
  State<HomeCompetitionCard> createState() => _HomeCompetitionCardState();
}

class _HomeCompetitionCardState extends State<HomeCompetitionCard> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppPadding.small),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: HomeCompetitionTopBar(
                competitionImage: widget.competition?.logo,
                competitionName: widget.competition?.name,
                isExpanded: isExpanded),
          ).redacted(
            context: context,
            redact: widget.isLoading,
          ),
          if (isExpanded)
            ListView.builder(
              itemCount: widget.competition?.matches?.length ?? 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final _match = widget.competition?.matches?[index];
                return HomeMatchItem(match: _match).redacted(
                  context: context,
                  redact: widget.isLoading,
                );
              },
            ),
        ],
      ),
    );
  }
}
