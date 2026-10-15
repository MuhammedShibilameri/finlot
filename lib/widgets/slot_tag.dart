import 'package:flutter/material.dart';

import '../core/app_colors.dart';

/// Tag matching the slot, acceptance, and date badges from the reference designs.
class SlotTag extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool positive;
  final bool isTrophy;

  const SlotTag({
    super.key,
    required this.label,
    this.icon,
    this.positive = false,
    this.isTrophy = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isGreen = positive || isTrophy;
    final Color fg = isGreen ? AppColors.green : const Color(0xFFFF5C8E);
    final Color bg = isGreen ? const Color(0xFFE5F7EB) : const Color(0xFFFFEDF3);
    final Color borderColor = isGreen
        ? const Color(0xFFA6E7B6)
        : const Color(0xFFFFBCCF);

    IconData defaultIcon;
    if (isTrophy) {
      defaultIcon = Icons.emoji_events_rounded;
    } else if (positive) {
      defaultIcon = Icons.check_circle_outline_rounded;
    } else {
      defaultIcon = Icons.view_agenda_outlined;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, width: 0.8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon ?? defaultIcon, size: 11, color: fg),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: fg,
            ),
          ),
        ],
      ),
    );
  }
}