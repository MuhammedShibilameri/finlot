import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../data/mock_data.dart';
import '../../models/member.dart';
import '../../widgets/member_avatar.dart';
import '../../widgets/slot_tag.dart';

class TransactionsTab extends StatefulWidget {
  const TransactionsTab({super.key});

  @override
  State<TransactionsTab> createState() => _TransactionsTabState();
}

class _TransactionsTabState extends State<TransactionsTab> {
  // Copies so tapping "Mark Received" can move a member from pending to paid.
  late final List<Member> _pending = List<Member>.from(pendingMembers);
  late final List<Member> _paid = List<Member>.from(paidMembers);

  void _markReceived(Member member) {
    setState(() {
      _pending.remove(member);
      _paid.add(
        Member(
          name: member.name,
          phone: member.phone,
          amount: member.amount,
          date: 'Today',
          slot: member.slot,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final int total = _pending.length + _paid.length;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.calendar_today_outlined, size: 14),
                SizedBox(width: 6),
                Text(
                  'September 2025',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
                Icon(Icons.keyboard_arrow_down, size: 18),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _SectionChip(label: 'Pending (${_pending.length}/$total)'),
          for (final m in _pending)
            _TransactionTile(
              member: m,
              trailing: OutlinedButton(
                onPressed: () => _markReceived(m),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(0, 30),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  foregroundColor: AppColors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Mark Received',
                  style: TextStyle(fontSize: 9),
                ),
              ),
            ),
          const SizedBox(height: 8),
          _SectionChip(label: 'Paid (${_paid.length}/$total)'),
          for (final m in _paid)
            _TransactionTile(
              member: m,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.check_circle,
                    size: 12,
                    color: AppColors.green,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    m.date,
                    style: const TextStyle(
                      fontSize: 9,
                      color: AppColors.green,
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

class _SectionChip extends StatelessWidget {
  final String label;

  const _SectionChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.limeCard,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class _TransactionTile extends StatelessWidget {
  final Member member;
  final Widget trailing;

  const _TransactionTile({required this.member, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          MemberAvatar(name: member.name),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member.name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  member.amount,
                  style: const TextStyle(fontSize: 11, color: AppColors.grey),
                ),
                const SizedBox(height: 3),
                SlotTag(label: member.slot),
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}
