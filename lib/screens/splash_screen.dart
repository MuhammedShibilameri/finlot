import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../widgets/coin_3d.dart';
import '../widgets/finlot_logo.dart';
import 'onboarding_screen.dart';

/// Configuration for an animated 3D coin in the splash choreography.
class _CoinConfig {
  final Offset initialOffset;
  final double orbitAngle;
  final double orbitRadius;
  final double size;
  final double yawSpeed;
  final double pitchSpeed;
  final double pitchPhase;

  const _CoinConfig({
    required this.initialOffset,
    required this.orbitAngle,
    required this.orbitRadius,
    required this.size,
    required this.yawSpeed,
    required this.pitchSpeed,
    required this.pitchPhase,
  });
}

/// Premium Finlot logo reveal animated splash screen.
///
/// Animation Sequence:
/// 1. 3D metallic coins float gently inward from various directions.
/// 2. Coins move in a smooth circular orbit with continuous 3D tumbling & lighting.
/// 3. Coins disperse smoothly outward and fade away.
/// 4. Subtle lime-green aura glow expands behind the center.
/// 5. Finlot brand logo scales smoothly into view with an elegant settle.
/// 6. Transitions seamlessly into the existing onboarding flow.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _navigated = false;

  // 5 coins with staggered radial orbits and 3D tumbling dynamics
  static const List<_CoinConfig> _coins = [
    _CoinConfig(
      initialOffset: Offset(-220, -260),
      orbitAngle: 0.0,
      orbitRadius: 92,
      size: 52,
      yawSpeed: 6.8,
      pitchSpeed: 4.2,
      pitchPhase: 0.0,
    ),
    _CoinConfig(
      initialOffset: Offset(240, -200),
      orbitAngle: 1.25,
      orbitRadius: 88,
      size: 46,
      yawSpeed: 5.4,
      pitchSpeed: 3.8,
      pitchPhase: 1.2,
    ),
    _CoinConfig(
      initialOffset: Offset(260, 220),
      orbitAngle: 2.51,
      orbitRadius: 96,
      size: 56,
      yawSpeed: 7.2,
      pitchSpeed: 5.0,
      pitchPhase: 2.4,
    ),
    _CoinConfig(
      initialOffset: Offset(-200, 240),
      orbitAngle: 3.77,
      orbitRadius: 90,
      size: 48,
      yawSpeed: 6.0,
      pitchSpeed: 4.5,
      pitchPhase: 3.6,
    ),
    _CoinConfig(
      initialOffset: Offset(0, -320),
      orbitAngle: 5.02,
      orbitRadius: 100,
      size: 54,
      yawSpeed: 5.8,
      pitchSpeed: 3.5,
      pitchPhase: 4.8,
    ),
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigateToNext();
      }
    });

    _controller.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Respect reduced-motion accessibility preference
    if (MediaQuery.of(context).disableAnimations && !_navigated) {
      _navigateToNext();
    }
  }

  void _navigateToNext() {
    if (_navigated || !mounted) return;
    _navigated = true;

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, animation, _) => const OnboardingScreen(),
        transitionsBuilder: (_, animation, _, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(gradient: AppColors.background),
        child: SizedBox.expand(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final double t = _controller.value;

              return Stack(
                alignment: Alignment.center,
                children: [
                  // Subtle ambient background glow in center
                  _buildAmbientGlow(t),

                  // Floating & Orbiting 3D coins
                  ..._buildCoins(t),

                  // Center Finlot Logo with scale, fade, and lime glow
                  _buildCenterLogo(t),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  /// Ambient lime-green glow behind the logo
  Widget _buildAmbientGlow(double t) {
    // Glow expands as coins disperse (0.55 - 0.85)
    final double glowProgress = ((t - 0.55) / 0.30).clamp(0.0, 1.0);
    final double glowOpacity = Curves.easeOut.transform(glowProgress) * 0.85;
    final double glowScale =
        0.6 + Curves.easeOutBack.transform(glowProgress) * 0.45;

    // Subtle breathing pulse at the end
    final double pulse = t > 0.85 ? math.sin((t - 0.85) * 20) * 0.05 : 0.0;

    if (glowOpacity <= 0) return const SizedBox.shrink();

    return Opacity(
      opacity: glowOpacity.clamp(0.0, 1.0),
      child: Transform.scale(
        scale: glowScale + pulse,
        child: Container(
          width: 220,
          height: 220,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                Color(0x4DB5D300), // Lime glow center
                Color(0x22B5D300),
                Colors.transparent,
              ],
              stops: [0.0, 0.5, 1.0],
            ),
          ),
        ),
      ),
    );
  }

  /// Animated 3D coins orbiting and dispersing
  List<Widget> _buildCoins(double t) {
    // Phase 1: Float in (0.00 -> 0.35)
    final double floatProgress = ((t - 0.0) / 0.35).clamp(0.0, 1.0);
    final double floatCurved = Curves.easeOutCubic.transform(floatProgress);

    // Fade in coins at start (0.0 -> 0.20)
    final double fadeIn = ((t - 0.0) / 0.20).clamp(0.0, 1.0);

    // Phase 2: Orbit rotation (0.20 -> 0.75)
    final double orbitProgress = ((t - 0.20) / 0.55).clamp(0.0, 1.0);
    final double orbitAngleOffset = orbitProgress * math.pi * 1.4;

    // Phase 3: Disperse outwards & fade out (0.62 -> 0.82)
    final double disperseProgress = ((t - 0.62) / 0.20).clamp(0.0, 1.0);
    final double disperseCurved = Curves.easeInQuad.transform(disperseProgress);
    final double fadeOut = 1.0 - disperseProgress;

    final double coinOpacity = (fadeIn * fadeOut).clamp(0.0, 1.0);

    // If coins have fully faded out, don't build them
    if (coinOpacity <= 0.001) return const [];

    return _coins.map((coin) {
      // Calculate current orbital angle
      final double currentAngle = coin.orbitAngle + orbitAngleOffset;

      // Gentle radial breathing during orbit
      final double breathing = math.sin(t * 12 + coin.pitchPhase) * 4.0;
      final double currentRadius =
          (coin.orbitRadius + breathing) * (1.0 + disperseCurved * 1.8);

      // Target position in orbit
      final double targetX = math.cos(currentAngle) * currentRadius;
      final double targetY = math.sin(currentAngle) * currentRadius;

      // Interpolate from initial offscreen position to orbit position
      final double x =
          coin.initialOffset.dx * (1.0 - floatCurved) + targetX * floatCurved;
      final double y =
          coin.initialOffset.dy * (1.0 - floatCurved) + targetY * floatCurved;

      // 3D tumbling: continuous smooth yaw spin & pitch rock
      final double yaw = t * coin.yawSpeed * math.pi;
      final double pitch =
          math.sin(t * coin.pitchSpeed * math.pi + coin.pitchPhase) * 0.38;

      return Positioned(
        left: 0,
        right: 0,
        top: 0,
        bottom: 0,
        child: Center(
          child: Transform.translate(
            offset: Offset(x, y),
            child: Opacity(
              opacity: coinOpacity,
              child: Coin3D(size: coin.size, yaw: yaw, pitch: pitch),
            ),
          ),
        ),
      );
    }).toList();
  }

  /// Centered Finlot Logo reveal with scale bounce and fade
  Widget _buildCenterLogo(double t) {
    // Logo scales and fades in after coins start dispersing (0.62 -> 0.88)
    final double logoRevealProgress = ((t - 0.62) / 0.24).clamp(0.0, 1.0);

    // Fade in
    final double logoOpacity = Curves.easeIn.transform(logoRevealProgress);

    // Scale from 0.70 to 1.05 with smooth elastic back-settle to 1.0
    final double scaleCurve = Curves.easeOutBack.transform(logoRevealProgress);
    final double logoScale = 0.70 + scaleCurve * 0.30;

    if (logoOpacity <= 0.0) return const SizedBox.shrink();

    return Center(
      child: Opacity(
        opacity: logoOpacity.clamp(0.0, 1.0),
        child: Transform.scale(
          scale: logoScale.clamp(0.0, 1.15),
          child: const FinlotLogo(size: 54),
        ),
      ),
    );
  }
}
