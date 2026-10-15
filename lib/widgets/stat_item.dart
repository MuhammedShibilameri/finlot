import 'package:flutter/material.dart';

import '../core/app_colors.dart';

/// Icon + small label + bold value. Used for "Draws won", "Amount", etc.
class StatItem extends StatelessWidget {
  final IconData? icon;
  final Color iconColor;
  final String label;
  final String value;

  const StatItem({
    super.key,
    this.icon,
    this.iconColor = AppColors.lime,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) ...[
          Icon(icon, size: 16, color: iconColor),
          const SizedBox(width: 6),
        ],
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 9, color: AppColors.grey),
              ),
              Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}