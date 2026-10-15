import 'package:flutter/material.dart';

import '../core/app_colors.dart';

/// Text logo. Replace with Image.asset(...) if the real logo file is provided.
class FinlotLogo extends StatelessWidget {
  final double size;

  const FinlotLogo({super.key, this.size = 22});

  @override
  Widget build(BuildContext context) {
    return Text(
      'finlot',
      style: TextStyle(
        color: AppColors.lime,
        fontSize: size,
        fontWeight: FontWeight.w900,
        letterSpacing: -0.5,
      ),
    );
  }
}