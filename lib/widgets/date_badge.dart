import 'package:flutter/material.dart';

import '../core/app_colors.dart';

/// Small calendar-style badge: "02 / OCT".
class DateBadge extends StatelessWidget {
  final String day;
  final String month;

  const DateBadge({super.key, required this.day, required this.month});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          Text(
            month,
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w600,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}