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
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            children: [
              _TopBar(onBack: () => Navigator.of(context).pop()),
              const SizedBox(height: 12),
              _HeaderCard(pool: widget.pool),
              const SizedBox(height: 12),
              PillTabBar(
                labels: const ['Transactions', 'Winners', 'Members'],
                selectedIndex: _tab,
                expand: true,
                onChanged: (i) => setState(() => _tab = i),
              ),
              const SizedBox(height: 12),
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
      height: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: onBack,
              child: Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: AppColors.limeCard,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.chevron_left, size: 22),
              ),
            ),
          ),
          const FinlotLogo(size: 22),
        ],
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  final Pool pool;

  const _HeaderCard({required this.pool});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Expanded(
                child: Column(
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
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: StatItem(
                        icon: Icons.emoji_events_outlined,
                        iconColor: Colors.orange,
                        label: 'Draws won',
                        value: pool.drawsWon,
                      ),
                    ),
                    Expanded(
                      child: StatItem(
                        icon: Icons.attach_money,
                        iconColor: Colors.green,
                        label: 'Amount',
                        value: pool.amount,
                      ),
                    ),
                    Expanded(
                      child: StatItem(
                        icon: Icons.account_balance_wallet_outlined,
                        iconColor: Colors.amber,
                        label: 'Lot Amount',
                        value: pool.lotAmount,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: StatItem(
                        icon: Icons.autorenew,
                        iconColor: AppColors.lime,
                        label: 'Pool Type',
                        value: pool.poolType,
                      ),
                    ),
                    Expanded(
                      child: StatItem(
                        icon: Icons.group_outlined,
                        iconColor: Colors.lightBlue,
                        label: 'Members',
                        value: pool.members,
                      ),
                    ),
                    Expanded(
                      child: StatItem(
                        icon: Icons.grid_view,
                        iconColor: Colors.pinkAccent,
                        label: 'Slot Count',
                        value: pool.slotCount,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              'Started on ${pool.startedOn}  •  valid till ${pool.validTill}',
              style: const TextStyle(fontSize: 9, color: AppColors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
