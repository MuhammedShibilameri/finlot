import 'package:flutter/material.dart';

import '../core/app_colors.dart';

/// Small tag such as "Half slot" (pink) or "Accepted" (green).
class SlotTag extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool positive;

  const SlotTag({
    super.key,
    required this.label,
    this.icon = Icons.pie_chart_outline,
    this.positive = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color fg = positive ? AppColors.green : AppColors.pink;
    final Color bg = positive ? AppColors.greenSoft : AppColors.pinkSoft;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 10, color: fg),
          const SizedBox(width: 3),
          Text(
            label,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w600,
              color: fg,
            ),
          ),
        ],
      ),
    );
  }
}