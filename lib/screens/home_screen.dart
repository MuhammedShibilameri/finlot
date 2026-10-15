import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../data/mock_data.dart';
import '../models/pool.dart';
import '../widgets/gradient_background.dart';
import '../widgets/pill_tab_bar.dart';
import '../widgets/pool_card.dart';
import 'pool_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _poolTab = 0; // 0 = Manage Pool, 1 = Joined Pool
  int _navIndex = 1; // bottom nav: 0 swap, 1 home, 2 profile (only home built)

  void _openPool(Pool pool) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => PoolDetailsScreen(pool: pool)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Pool> pools = _poolTab == 0 ? managedPools : joinedPools;

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 110),
                children: [
                  const _Header(),
                  const SizedBox(height: 16),
                  const Text(
                    "Glad you're here,",
                    style: TextStyle(fontSize: 13, color: AppColors.grey),
                  ),
                  const Text(
                    'Vidhun',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 16),
                  _UpcomingDrawCard(onViewPool: () => _openPool(bikePool)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      PillTabBar(
                        labels: const ['Manage Pool', 'Joined Pool'],
                        selectedIndex: _poolTab,
                        onChanged: (i) => setState(() => _poolTab = i),
                      ),
                      const Spacer(),
                      const Text(
                        'View all',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  for (final pool in pools)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: PoolCard(pool: pool, onTap: () => _openPool(pool)),
                    ),
                ],
              ),
              Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: Center(
                  child: _BottomNav(
                    selectedIndex: _navIndex,
                    onChanged: (i) => setState(() => _navIndex = i),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: Colors.deepOrange.shade200,
          child: const Icon(Icons.person, size: 18, color: Colors.white),
        ),
        Container(
          width: 36,
          height: 36,
          decoration: const BoxDecoration(
            color: AppColors.limeCard,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.notifications_none, size: 20),
        ),
      ],
    );
  }
}

class _UpcomingDrawCard extends StatelessWidget {
  final VoidCallback onViewPool;

  const _UpcomingDrawCard({required this.onViewPool});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.limeCard,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Upcoming Draw',
                    style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'The pool draw for Bike Pool is happening tomorrow. Stay tuned!',
                  style: TextStyle(fontSize: 11),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: onViewPool,
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(0, 28),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        foregroundColor: AppColors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'View Pool',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 28,
                      height: 28,
                      decoration: const BoxDecoration(
                        color: AppColors.black,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_outward,
                        size: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Placeholder for the illustration in the design.
          const Icon(Icons.person_outline, size: 80, color: AppColors.black),
        ],
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const _BottomNav({required this.selectedIndex, required this.onChanged});

  static const List<IconData> _icons = [
    Icons.swap_horiz,
    Icons.home_outlined,
    Icons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < _icons.length; i++)
            GestureDetector(
              onTap: () => onChanged(i),
              child: Container(
                width: 48,
                height: 48,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: i == selectedIndex
                      ? AppColors.limeCard
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Icon(_icons[i], color: AppColors.black),
              ),
            ),
        ],
      ),
    );
  }
}
