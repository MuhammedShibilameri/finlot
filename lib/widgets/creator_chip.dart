import 'package:flutter/material.dart';

import '../core/app_colors.dart';

/// Small chip: "Zuha · Creator" with avatar.
class CreatorChip extends StatelessWidget {
  final String name;

  const CreatorChip({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(4, 3, 10, 3),
      decoration: BoxDecoration(
        color: AppColors.limeSoft,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/avatar_zuha.png',
              width: 18,
              height: 18,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => const CircleAvatar(
                radius: 9,
                backgroundColor: Color(0xFF6B21A8),
                child: Icon(Icons.person, size: 12, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            '$name · Creator',
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}