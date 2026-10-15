import 'package:flutter/material.dart';

import '../core/app_colors.dart';

/// PillTabBar matching the reference screenshots.
/// Displays an active pink rounded pill with an optional icon and white text.
class PillTabBar extends StatelessWidget {
  final List<String> labels;
  final List<IconData?>? icons;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final bool expand;

  const PillTabBar({
    super.key,
    required this.labels,
    this.icons,
    required this.selectedIndex,
    required this.onChanged,
    this.expand = false,
  });

  Widget _tab(int i) {
    final bool selected = i == selectedIndex;
    final IconData? icon = icons != null && i < icons!.length ? icons![i] : null;

    return GestureDetector(
      onTap: () => onChanged(i),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.pink : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (selected && icon != null) ...[
              Icon(
                icon,
                size: 14,
                color: Colors.white,
              ),
              const SizedBox(width: 5),
            ],
            Text(
              labels[i],
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: selected ? Colors.white : AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      for (int i = 0; i < labels.length; i++)
        expand ? Expanded(child: _tab(i)) : _tab(i),
    ];

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
        children: tabs,
      ),
    );
  }
}