import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../data/mock_data.dart';
import '../../widgets/member_avatar.dart';
import '../../widgets/slot_tag.dart';

class MembersTab extends StatelessWidget {
  const MembersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final m in allMembers)
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x08000000),
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                MemberAvatar(name: m.name, radius: 24),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            m.name,
                            style: const TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w800,
                              color: AppColors.black,
                            ),
                          ),
                          if (m.role != null) ...[
                            const SizedBox(width: 4),
                            Text(
                              '• ${m.role}',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF555555),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 3),
                      if (m.amount.isNotEmpty)
                        Text(
                          m.amount,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: AppColors.black,
                          ),
                        )
                      else
                        Text(
                          m.phone,
                          style: const TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey,
                          ),
                        ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          if (m.date.isNotEmpty)
                            SlotTag(label: m.date, positive: true)
                          else
                            const SlotTag(label: 'Accepted', positive: true),
                          const SizedBox(width: 8),
                          SlotTag(label: m.slot),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
