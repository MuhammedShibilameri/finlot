import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../data/mock_data.dart';
import '../../widgets/member_avatar.dart';
import '../../widgets/slot_tag.dart';

class MembersTab extends StatelessWidget {
  const MembersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          for (int i = 0; i < allMembers.length; i++) ...[
            if (i > 0) const Divider(height: 16),
            Row(
              children: [
                MemberAvatar(name: allMembers[i].name),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        allMembers[i].name,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        allMembers[i].role ?? allMembers[i].phone,
                        style: const TextStyle(
                          fontSize: 10,
                          color: AppColors.grey,
                        ),
                      ),
                      if (allMembers[i].amount.isNotEmpty)
                        Text(
                          allMembers[i].amount,
                          style: const TextStyle(
                            fontSize: 10,
                            color: AppColors.grey,
                          ),
                        ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          const SlotTag(
                            label: 'Accepted',
                            icon: Icons.check_circle_outline,
                            positive: true,
                          ),
                          const SizedBox(width: 6),
                          SlotTag(label: allMembers[i].slot),
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
    );
  }
}
