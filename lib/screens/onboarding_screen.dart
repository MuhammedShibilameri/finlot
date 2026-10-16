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
    illustrationPath: 'assets/images/ob_phone_mockup_1.png',
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
    illustrationPath: 'assets/images/ob_phone_mockup_2.png',
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
    illustrationPath: 'assets/images/ob_phone_mockup_3.png',
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
                padding: const EdgeInsets.fromLTRB(40, 14, 40, 18),
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
    return Column(
      children: [
        // Seamless device mockup illustration containing lady, logo & floating cards
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Image.asset(
                data.illustrationPath,
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            ),
          ),
        ),

        const SizedBox(height: 12),

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
  }
}
