import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../widgets/finlot_logo.dart';
import '../widgets/gradient_background.dart';
import 'home_screen.dart';

class _Feature {
  final IconData icon;
  final String title;
  final String description;

  const _Feature(this.icon, this.title, this.description);
}

class _OnboardData {
  final String title;
  final String subtitle;
  final List<_Feature> features;

  const _OnboardData(this.title, this.subtitle, this.features);
}

const List<_OnboardData> _pages = [
  _OnboardData(
    'Create Your Pool',
    'Bring your friends or teammates together and start a shared pool for any goal.',
    [
      _Feature(
        Icons.tune,
        'Custom Pools',
        'Set your own goals, names, and purpose for trips, gifts, or group savings.',
      ),
      _Feature(
        Icons.group_add_outlined,
        'Invite Members',
        'Easily add friends or teammates using a link or code to join your pool.',
      ),
    ],
  ),
  _OnboardData(
    'Track Everything',
    'Stay updated with real-time balance, contributions, and expenses.',
    [
      _Feature(
        Icons.insights_outlined,
        'Real-Time Insights',
        'Monitor every contribution and expense instantly as they happen.',
      ),
      _Feature(
        Icons.pie_chart_outline,
        'Smart Analytics',
        'Get detailed breakdowns and trends to understand your pool growth.',
      ),
    ],
  ),
  _OnboardData(
    'Easy to Use',
    'Manage your pools effortlessly with a clean and simple interface.',
    [
      _Feature(
        Icons.touch_app_outlined,
        'Smooth Navigation',
        'Everything you need is right at your fingertips, just a tap away.',
      ),
      _Feature(
        Icons.tune,
        'Simple Controls',
        'Create, track, and manage your pools effortlessly, clean and fast.',
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
              // Top progress segments
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 12, 40, 16),
                child: Row(
                  children: List.generate(_pages.length, (i) {
                    return Expanded(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        height: 3,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          color: i <= _index
                              ? AppColors.black
                              : AppColors.black20,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: _pages.length,
                  onPageChanged: (i) => setState(() => _index = i),
                  itemBuilder: (_, i) => _OnboardPage(data: _pages[i]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _next,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
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
        // Illustration area: phone frame + two floating feature cards.
        Expanded(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(48, 0, 48, 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: AppColors.black, width: 4),
                ),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 14),
                      child: FinlotLogo(size: 18),
                    ),
                    Expanded(
                      child: Center(
                        // Placeholder: replace with Image.asset('assets/...')
                        child: Icon(
                          Icons.person_outline,
                          size: 110,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20,
                right: 20,
                bottom: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (final f in data.features) _FeatureCard(feature: f),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          data.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Text(
            data.subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: AppColors.grey),
          ),
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final _Feature feature;

  const _FeatureCard({required this.feature});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.limeSoft,
            child: Icon(feature.icon, size: 16, color: AppColors.black),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  feature.title,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  feature.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 9, color: AppColors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
