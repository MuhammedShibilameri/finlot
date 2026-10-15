import 'package:flutter/material.dart';

import '../core/app_colors.dart';

enum StatType {
  drawsWon,
  amount,
  lotAmount,
  poolType,
  members,
  slotCount,
}

/// StatItem matching the reference icons and typography.
class StatItem extends StatelessWidget {
  final StatType type;
  final String label;
  final String value;

  const StatItem({
    super.key,
    required this.type,
    required this.label,
    required this.value,
  });

  Widget _buildIcon() {
    switch (type) {
      case StatType.drawsWon:
        return Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: const Color(0xFFFFE8EE),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFFFB5C8), width: 1),
          ),
          child: const Icon(
            Icons.refresh_rounded,
            size: 13,
            color: Color(0xFFFF487C),
          ),
        );
      case StatType.amount:
        return Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: const Color(0xFFE2F7E7),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFA5E6B4), width: 1),
          ),
          child: const Center(
            child: Text(
              '\$',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w900,
                color: Color(0xFF239A4D),
                height: 1.1,
              ),
            ),
          ),
        );
      case StatType.lotAmount:
        return Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: const Color(0xFFFFF6D8),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFFFDF7D), width: 1),
          ),
          child: const Center(
            child: Text(
              '\$',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w900,
                color: Color(0xFFD49A00),
                height: 1.1,
              ),
            ),
          ),
        );
      case StatType.poolType:
        return Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: const Color(0xFFE7F8D8),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFBBE59B), width: 1),
          ),
          child: const Icon(
            Icons.swap_calls_rounded,
            size: 13,
            color: Color(0xFF5BA425),
          ),
        );
      case StatType.members:
        return Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: const Color(0xFFE3F3FC),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFAED8F5), width: 1),
          ),
          child: const Icon(
            Icons.group_outlined,
            size: 13,
            color: Color(0xFF2885C7),
          ),
        );
      case StatType.slotCount:
        return Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: const Color(0xFFFFECEE),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFFFBCC3), width: 1),
          ),
          child: const Icon(
            Icons.view_agenda_outlined,
            size: 12,
            color: Color(0xFFE04A5F),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildIcon(),
        const SizedBox(width: 6),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 9.5,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 1),
              Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w800,
                  color: AppColors.black,
                  letterSpacing: -0.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}