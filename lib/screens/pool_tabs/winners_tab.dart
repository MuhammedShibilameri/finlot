import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../widgets/member_avatar.dart';
import '../../widgets/slot_tag.dart';

class WinnersTab extends StatelessWidget {
  const WinnersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Featured Winner Banner Card
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.limeCard,
            borderRadius: BorderRadius.circular(26),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0C000000),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(26),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Left crowd doodle
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/images/crowd_left.png',
                    fit: BoxFit.contain,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                // Right crowd doodle
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/images/crowd_right.png',
                    fit: BoxFit.contain,
                    alignment: Alignment.centerRight,
                  ),
                ),
                // Center content
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: Column(
                    children: [
                      const Text(
                        'Zuha & Nihala just won!',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 3),
                      const Text(
                        'November Winner',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF444444),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _WinnerAvatar(
                            name: 'Zuha',
                            asset: 'assets/images/avatar_zuha.png',
                          ),
                          const SizedBox(width: 24),
                          _WinnerAvatar(
                            name: 'Nihala',
                            asset: 'assets/images/avatar_nihala.png',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 14),

        // Winners list Card 1 (Vidhun & Nouman)
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(26),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0A000000),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              _WinnerListRow(
                name: 'Vidhun',
                phone: '+91 9495969798',
                date: 'Oct 05, 2025',
                slot: 'Half slot',
              ),
              const Divider(
                height: 20,
                thickness: 0.8,
                color: Color(0xFFEFEFEF),
              ),
              _WinnerListRow(
                name: 'Nouman',
                phone: '+91 9495969798',
                date: 'Oct 05, 2025',
                slot: 'Half slot',
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // Winners list Card 2 (Rijas)
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(26),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0A000000),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: _WinnerListRow(
            name: 'Rijas',
            phone: '+91 9495969798',
            date: 'Sept 05, 2025',
            slot: 'Full slot',
          ),
        ),
      ],
    );
  }
}

class _WinnerAvatar extends StatelessWidget {
  final String name;
  final String asset;

  const _WinnerAvatar({required this.name, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            asset,
            width: 58,
            height: 58,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => CircleAvatar(
              radius: 29,
              backgroundColor: const Color(0xFFB33939),
              child: Text(
                name[0],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          name,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}

class _WinnerListRow extends StatelessWidget {
  final String name;
  final String phone;
  final String date;
  final String slot;

  const _WinnerListRow({
    required this.name,
    required this.phone,
    required this.date,
    required this.slot,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MemberAvatar(name: name, radius: 22),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                phone,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  SlotTag(
                    label: date,
                    isTrophy: true,
                  ),
                  const SizedBox(width: 6),
                  SlotTag(label: slot),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
