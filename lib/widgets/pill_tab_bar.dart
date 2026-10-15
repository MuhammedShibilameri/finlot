import 'package:flutter/material.dart';

import '../core/app_colors.dart';

/// White rounded bar with pink selected pill (Manage/Joined, Transactions/...).
class PillTabBar extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  /// true  -> tabs share the full width (pool details)
  /// false -> tabs only take the space they need (home)
  final bool expand;

  const PillTabBar({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onChanged,
    this.expand = false,
  });

  Widget _tab(int i) {
    final bool selected = i == selectedIndex;
    return GestureDetector(
      onTap: () => onChanged(i),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.pink : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          labels[i],
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: selected ? Colors.white : AppColors.black,
          ),
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
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
        children: tabs,
      ),
    );
  }
}