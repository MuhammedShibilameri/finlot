import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../models/pool.dart';
import '../widgets/creator_chip.dart';
import '../widgets/date_badge.dart';
import '../widgets/finlot_logo.dart';
import '../widgets/gradient_background.dart';
import '../widgets/pill_tab_bar.dart';
import '../widgets/stat_item.dart';
import 'pool_tabs/members_tab.dart';
import 'pool_tabs/transactions_tab.dart';
import 'pool_tabs/winners_tab.dart';

class PoolDetailsScreen extends StatefulWidget {
  final Pool pool;

  const PoolDetailsScreen({super.key, required this.pool});

  @override
  State<PoolDetailsScreen> createState() => _PoolDetailsScreenState();
}

class _PoolDetailsScreenState extends State<PoolDetailsScreen> {
  int _tab = 0; // 0 Transactions, 1 Winners, 2 Members

  Widget _tabContent() {
    if (_tab == 0) return const TransactionsTab();
    if (_tab == 1) return const WinnersTab();
    return const MembersTab();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 30),
            children: [
              _TopBar(onBack: () => Navigator.of(context).pop()),
              const SizedBox(height: 14),
              _HeaderCard(
                pool: widget.pool,
                showEdit: _tab == 2,
              ),
              const SizedBox(height: 14),
              PillTabBar(
                labels: const ['Transactions', 'Winners', 'Members'],
                icons: const [
                  Icons.bookmark_border_rounded,
                  Icons.star_border_rounded,
                  Icons.group_outlined,
                ],
                selectedIndex: _tab,
                expand: true,
                onChanged: (i) => setState(() => _tab = i),
              ),
              const SizedBox(height: 14),
              _tabContent(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final VoidCallback onBack;

  const _TopBar({required this.onBack});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: onBack,
              behavior: HitTestBehavior.opaque,
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: AppColors.limeCard,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.chevron_left_rounded,
                  size: 26,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
          const FinlotLogo(size: 26),
        ],
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  final Pool pool;
  final bool showEdit;

  const _HeaderCard({
    required this.pool,
    this.showEdit = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DateBadge(
                day: pool.day.isEmpty ? '02' : pool.day,
                month: pool.month.isEmpty ? 'OCT' : pool.month,
                isGrid: pool.isGrid,
              ),
              const SizedBox(width: 12),
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
                    const SizedBox(height: 4),
                    CreatorChip(name: pool.creator),
                  ],
                ),
              ),
              if (showEdit)
                Container(
                  width: 34,
                  height: 34,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2C2D2E),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.edit_outlined,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F7EB),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
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
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: StatItem(
                        type: StatType.poolType,
                        label: 'Pool Type',
                        value: pool.poolType,
                      ),
                    ),
                    Expanded(
                      child: StatItem(
                        type: StatType.members,
                        label: 'Members',
                        value: pool.members,
                      ),
                    ),
                    Expanded(
                      child: StatItem(
                        type: StatType.slotCount,
                        label: 'Slot Count',
                        value: pool.slotCount,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              'Started on ${pool.startedOn}  valid till ${pool.validTill}',
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFF444444),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
