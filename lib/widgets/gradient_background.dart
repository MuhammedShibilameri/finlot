import 'package:flutter/material.dart';

import '../core/app_colors.dart';

/// Full-screen soft green-to-white gradient used behind every screen.
class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(gradient: AppColors.background),
      child: child,
    );
  }
}