import 'package:flutter/material.dart';

import '../core/app_colors.dart';

/// Finlot brand logo using the original logo asset.
class FinlotLogo extends StatelessWidget {
  final double size;
  final Color? color;

  const FinlotLogo({
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/finlot_logo.png',
      height: size,
      fit: BoxFit.contain,
      errorBuilder: (_, _, _) => Text(
        'finlot',
        style: TextStyle(
          color: color ?? AppColors.lime,
          fontSize: size * 0.9,
          fontWeight: FontWeight.w900,
          letterSpacing: -0.6,
        ),
      ),
    );
  }
}