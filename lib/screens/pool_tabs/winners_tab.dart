import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../data/mock_data.dart';
import '../../widgets/member_avatar.dart';
import '../../widgets/slot_tag.dart';

class WinnersTab extends StatelessWidget {
  const WinnersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Winner banner
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.limeCard,
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Column(
            children: [
              Text(
                'Zuha & Nihala just won!',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 2),
              Text(
                'November Winner',
                style: TextStyle(fontSize: 10, color: AppColors.grey),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _WinnerAvatar(name: 'Zuha'),
                  SizedBox(width: 24),
                  _WinnerAvatar(name: 'Nihala'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Winners list
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              for (int i = 0; i < winners.length; i++) ...[
                if (i > 0) const Divider(height: 16),
                Row(
                  children: [
                    MemberAvatar(name: winners[i].name),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            winners[i].name,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_today_outlined,
                                size: 10,
                                color: AppColors.green,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                winners[i].date,
                                style: const TextStyle(
                                  fontSize: 9,
                                  color: AppColors.green,
                                ),
                              ),
                              const SizedBox(width: 8),
                              SlotTag(label: winners[i].slot),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _WinnerAvatar extends StatelessWidget {
  final String name;

  const _WinnerAvatar({required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MemberAvatar(name: name, radius: 26),
        const SizedBox(height: 4),
        Text(
          name,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
