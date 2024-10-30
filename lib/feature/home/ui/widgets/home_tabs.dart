import 'package:flutter/material.dart';

import '../../../../core/theming/app_paddings.dart';
import '../../logic/matches/matches_bloc.dart';
import 'home_tabs_tab_item.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
        (index) => HomeTabsTabItem(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            matchesBloc
                .add(GetMatchesEvent(tabs[index]['endpoint'].toString()));
          },
          isSelected: (selectedIndex == index),
          title: tabs[index]['title'].toString(),
          endpoint: tabs[index]['endpoint'].toString(),
        ),
      ),
    );
  }
}

List<Map<String, String>> tabs = [
  {
    'endpoint': 'todayMatches',
    'title': 'Today',
  },
  {
    'endpoint': 'tomorrowMatches',
    'title': 'Upcoming',
  },
  {
    'endpoint': 'yesterdayMatches',
    'title': 'Past',
  },
];
