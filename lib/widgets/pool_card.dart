import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../models/pool.dart';
import 'creator_chip.dart';
import 'date_badge.dart';
import 'stat_item.dart';

/// Premium Lime & White Pool card matching the exact Figma reference graphics.
class PoolCard extends StatelessWidget {
  final Pool pool;
  final VoidCallback onTap;

  const PoolCard({super.key, required this.pool, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFD6EA4E), Color(0xFFE4F274)],
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x10000000),
              blurRadius: 16,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Upper Yellow / Lime section with 3D calendar, title & creator chip
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
              child: Row(
                children: [
                  DateBadge(
                    day: pool.day,
                    month: pool.month,
                    isGrid: pool.isGrid,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pool.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: AppColors.black,
                            letterSpacing: -0.3,
                          ),
                        ),
                        const SizedBox(height: 5),
                        CreatorChip(name: pool.creator),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Floating White Container with rounded corners & soft shadow
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0C000000),
                    blurRadius: 12,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  // Upper inner stats container
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F7E8),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: StatItem(
                            type: StatType.drawsWon,
                            label: 'Draws won',
                            value: pool.drawsWon,
                          ),
                        ),
                        Expanded(
                          child: StatItem(
                            type: StatType.amount,
                            label: 'Amount',
                            value: pool.amount,
                          ),
                        ),
                        Expanded(
                          child: StatItem(
                            type: StatType.lotAmount,
                            label: 'Lot Amount',
                            value: pool.lotAmount,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Lower inner action container
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 6, 6, 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F7E8),
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            pool.footerText,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: 38,
                          height: 38,
                          decoration: const BoxDecoration(
                            color: AppColors.green,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x281C9E48),
                                blurRadius: 8,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.arrow_outward_rounded,
                            size: 19,
                            color: Colors.white,
                          ),
                        ),
                      ],
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
