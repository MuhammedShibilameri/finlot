import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../widgets/gradient_background.dart';
import 'home_screen.dart';

class _FeatureItem {
  final String avatarPath;
  final String title;
  final String description;

  const _FeatureItem({
    required this.avatarPath,
    required this.title,
    required this.description,
  });
}

class _OnboardData {
  final String title;
  final String subtitle;
  final String illustrationPath;
  final List<_FeatureItem> features;

  const _OnboardData({
    required this.title,
    required this.subtitle,
    required this.illustrationPath,
    required this.features,
  });
}

const List<_OnboardData> _pages = [
  _OnboardData(
    title: 'Create Your Pool',
    subtitle:
        'Bring your friends or teammates together and start a shared pool for any goal.',
    illustrationPath: 'assets/images/pure_hero_1.png',
    features: [
      _FeatureItem(
        avatarPath: 'assets/images/ob_feature_avatar_1.png',
        title: 'Custom Pools',
        description:
            'Set your own goal, name, and purpose — whether it\'s for trips, gifts, or group savings.',
      ),
      _FeatureItem(
        avatarPath: 'assets/images/ob_feature_avatar_2.png',
        title: 'Invite Members',
        description:
            'Easily add friends or teammates using a link or code to join your pool.',
      ),
    ],
  ),
  _OnboardData(
    title: 'Track Everything',
    subtitle:
        'Stay updated with real-time balance, contributions, and expenses.',
    illustrationPath: 'assets/images/pure_hero_2.png',
    features: [
      _FeatureItem(
        avatarPath: 'assets/images/ob_feature_avatar_1.png',
        title: 'Real-Time Insights',
        description:
            'Monitor every contribution and expense instantly as they happen.',
      ),
      _FeatureItem(
        avatarPath: 'assets/images/ob_feature_avatar_2.png',
        title: 'Smart Analytics',
        description:
            'View detailed breakdowns and trends to understand your pool\'s growth.',
      ),
    ],
  ),
  _OnboardData(
    title: 'Easy to Use',
    subtitle:
        'Manage your pools effortlessly with a clean and simple interface.',
    illustrationPath: 'assets/images/pure_hero_3.png',
    features: [
      _FeatureItem(
        avatarPath: 'assets/images/ob_feature_avatar_1.png',
        title: 'Smooth Navigation',
        description:
            'Everything you need is right at your fingertips — just a tap away.',
      ),
      _FeatureItem(
        avatarPath: 'assets/images/ob_feature_avatar_2.png',
        title: 'Simple Controls',
        description:
            'Create, track, and manage your pools effortlessly — clear, fast, and hassle-free.',
      ),
    ],
  ),
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _next() {
    if (_index == _pages.length - 1) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              // Segmented top progress indicator
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 12),
                child: Row(
                  children: List.generate(_pages.length, (i) {
                    final bool active = i <= _index;
                    return Expanded(
                      child: Container(
                        height: 3,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          color: active ? const Color(0xFF2C2D2E) : Colors.white,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              // Page carousel
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: _pages.length,
                  onPageChanged: (i) => setState(() => _index = i),
                  itemBuilder: (_, i) => _OnboardPage(data: _pages[i]),
                ),
              ),

              // Bottom CTA
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 12, 24, 18),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _next,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.black,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.2,
                      ),
                    ),
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

class _OnboardPage extends StatelessWidget {
  final _OnboardData data;

  const _OnboardPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            // Framed device mockup with illustration & overlay cards
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    // Outer phone frame container
                    Container(
                      margin: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(
                          color: AppColors.black,
                          width: 4.5,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(27),
                        child: Column(
                          children: [
                            Image.asset(
                              data.illustrationPath,
                              width: double.infinity,
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter,
                            ),
                            const Expanded(
                              child: ColoredBox(
                                color: Colors.white,
                                child: SizedBox.expand(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Floating feature cards
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (final f in data.features)
                            _FeatureCard(feature: f),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 14),

            // Titles
            Text(
              data.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: AppColors.black,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                data.subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12.5,
                  color: AppColors.grey,
                  height: 1.35,
                ),
              ),
            ),
            const SizedBox(height: 6),
          ],
        );
      },
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final _FeatureItem feature;

  const _FeatureCard({required this.feature});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x18000000),
            blurRadius: 18,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              feature.avatarPath,
              width: 38,
              height: 38,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  feature.title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  feature.description,
                  style: const TextStyle(
                    fontSize: 9.5,
                    color: AppColors.grey,
                    height: 1.25,
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
