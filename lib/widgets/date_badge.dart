import 'package:flutter/material.dart';

import '../core/app_colors.dart';

/// Calendar-style badge shown on pool cards.
/// Displays spiral loops + day/month for scheduled pools,
/// or a 3x3 dot grid for pending/custom pools like Home Pool.
class DateBadge extends StatelessWidget {
  final String day;
  final String month;
  final bool isGrid;

  const DateBadge({
    super.key,
    required this.day,
    required this.month,
    this.isGrid = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: isGrid
          ? Center(
              child: SizedBox(
                width: 26,
                height: 26,
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(9, (index) {
                    final bool isDotted = index == 8;
                    return Container(
                      decoration: BoxDecoration(
                        color: isDotted
                            ? Colors.transparent
                            : const Color(0xFFC7D3CD),
                        shape: BoxShape.circle,
                        border: isDotted
                            ? Border.all(
                                color: const Color(0xFFC7D3CD),
                                width: 1.2,
                              )
                            : null,
                      ),
                    );
                  }),
                ),
              ),
            )
          : Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // Top spiral hooks
                Positioned(
                  top: -4,
                  left: 12,
                  child: _SpiralHook(),
                ),
                Positioned(
                  top: -4,
                  right: 12,
                  child: _SpiralHook(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        day,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: AppColors.green,
                          height: 1.05,
                        ),
                      ),
                      Text(
                        month,
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFFE24C12),
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class _SpiralHook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 10,
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}