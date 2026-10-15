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
  int _navIndex = 1; // 0 swap, 1 home, 2 profile

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
                padding: const EdgeInsets.fromLTRB(18, 14, 18, 110),
                children: [
                  const _Header(),
                  const SizedBox(height: 18),
                  const Text(
                    "Glad you're here,",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF1E1E1E),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    'Vidhun',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: AppColors.black,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const SizedBox(height: 18),
                  _UpcomingDrawCard(onViewPool: () => _openPool(bikePool)),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      PillTabBar(
                        labels: const ['Manage Pool', 'Joined Pool'],
                        icons: const [Icons.hexagon_outlined, null],
                        selectedIndex: _poolTab,
                        onChanged: (i) => setState(() => _poolTab = i),
                      ),
                      const Spacer(),
                      const Text(
                        'View all',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  for (final pool in pools)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: PoolCard(
                        pool: pool,
                        onTap: () => _openPool(pool),
                      ),
                    ),
                ],
              ),
              Positioned(
                bottom: 18,
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
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.asset(
            'assets/images/avatar_home_top.png',
            width: 44,
            height: 44,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Container(
              width: 44,
              height: 44,
              color: const Color(0xFFFFD1BD),
              child: const Icon(Icons.person, color: Colors.white),
            ),
          ),
        ),
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.limeCard,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Icons.notifications_none_rounded,
            size: 22,
            color: AppColors.black,
          ),
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 14,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Left content
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.limeCard,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Upcoming Draw',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 12.5,
                            color: AppColors.black,
                            height: 1.35,
                          ),
                          children: [
                            TextSpan(text: '⏳ The pool draw for '),
                            TextSpan(
                              text: 'Bike Pool',
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            TextSpan(
                              text: ' is happening tomorrow. Stay tuned!"',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: onViewPool,
                        behavior: HitTestBehavior.opaque,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 7,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF1F1F1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'View Pool',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                color: AppColors.black,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_outward_rounded,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Right Lady Illustration
              Expanded(
                flex: 4,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    'assets/images/lady_home.png',
                    fit: BoxFit.contain,
                    alignment: Alignment.bottomRight,
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

class _BottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const _BottomNav({required this.selectedIndex, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(44),
        boxShadow: const [
          BoxShadow(
            color: Color(0x18000000),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Swap / Transfer
          _NavItem(
            icon: Icons.swap_vert_rounded,
            isSelected: selectedIndex == 0,
            isHome: false,
            onTap: () => onChanged(0),
          ),
          const SizedBox(width: 8),
          // Home
          _NavItem(
            icon: Icons.home_rounded,
            isSelected: selectedIndex == 1,
            isHome: true,
            onTap: () => onChanged(1),
          ),
          const SizedBox(width: 8),
          // Profile
          _NavItem(
            icon: Icons.person_outline_rounded,
            isSelected: selectedIndex == 2,
            isHome: false,
            onTap: () => onChanged(2),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final bool isHome;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.isSelected,
    required this.isHome,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: isHome
              ? AppColors.limeCard
              : (isSelected ? const Color(0xFFF0F0F0) : Colors.transparent),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 24,
          color: AppColors.black,
        ),
      ),
    );
  }
}
