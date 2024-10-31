import 'package:flutter/material.dart';

import '../../../../core/theming/app_paddings.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/theming/colors.dart';

class HomeTabsTabItem extends StatefulWidget {
  final bool isSelected;
  final String title;
  final VoidCallback onTap;

  const HomeTabsTabItem({
    super.key,
    required this.isSelected,
    required this.title,
    required this.onTap,
  });

  @override
  _HomeTabsTabItemState createState() => _HomeTabsTabItemState();
}

class _HomeTabsTabItemState extends State<HomeTabsTabItem> {
  /// animation properties
  late Color _color;
  late Color _textColor;
  Gradient? _gradient;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: InkWell(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: AppPadding.xSmall),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            color: _color,
            gradient: _gradient,
          ),
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: AppTextStyles.bold(
              fontSize: 12,
              color: _textColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    /// initialize selected item
    _changeSelectedItem();
  }

  @override
  void didUpdateWidget(covariant HomeTabsTabItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    /// change back and fore color smoothly with animation when tab changes
    setState(() {
      _changeSelectedItem();
    });
  }

  _changeSelectedItem() {
    _color = widget.isSelected ? cPrimary : cOnPrimary.withOpacity(0.7);
    _textColor = widget.isSelected ? cOnPrimary : cOnSecondary;
    _gradient = widget.isSelected
        ? const LinearGradient(
            colors: [
              cPrimary,
              cAccentPrimary,
            ],
          )
        : null;
  }
}
