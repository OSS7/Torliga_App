import 'package:flutter/material.dart';
import 'package:torliga/feature/games/ui/widgets/home_tabs_tab_item.dart';

import '../../../../core/theming/app_paddings.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  int selectedIndex = 0;
  List<String> tabs = const ['Today', 'Upcoming', 'Past'];
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
          },
          isSelected: (selectedIndex == index),
          text: tabs[index],
        ),
      ),
    );
  }
}