import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../models/pool.dart';
import 'creator_chip.dart';
import 'date_badge.dart';
import 'stat_item.dart';

/// Lime pool card shown on the home screen.
class PoolCard extends StatelessWidget {
  final Pool pool;
  final VoidCallback onTap;

  const PoolCard({super.key, required this.pool, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.limeCard,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                DateBadge(day: pool.day, month: pool.month),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pool.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    CreatorChip(name: pool.creator),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.white70,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: StatItem(label: 'Draws won', value: pool.drawsWon),
                  ),
                  Expanded(
                    child: StatItem(
                      icon: Icons.attach_money,
                      label: 'Amount',
                      value: pool.amount,
                    ),
                  ),
                  Expanded(
                    child: StatItem(
                      icon: Icons.attach_money,
                      label: 'Lot Amount',
                      value: pool.lotAmount,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.fromLTRB(14, 6, 6, 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      pool.footerText,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: AppColors.green,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_outward,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}