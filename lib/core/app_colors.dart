import 'package:flutter/material.dart';

/// App color palette matching the Finlot reference design.
class AppColors {
  AppColors._();

  static const Color lime = Color(0xFFB5D300); // Brand lime green
  static const Color limeCard = Color(0xFFE2F163); // Pool card / banner lime
  static const Color limeLight = Color(0xFFEFF6BA); // Softer lime tint
  static const Color limeSoft = Color(0xFFF3F8D3); // Chip backgrounds
  static const Color pink = Color(0xFFFF5C8E); // Selected pill tab & badges
  static const Color pinkSoft = Color(0xFFFFEDF3); // Pink badge background
  static const Color black = Color(0xFF141414);
  static const Color darkGrey = Color(0xFF2C2D2E); // Inactive progress bar / icons
  static const Color grey = Color(0xFF7C7C7C);
  static const Color lightGrey = Color(0xFF9E9E9E);
  static const Color green = Color(0xFF1C9E48);
  static const Color greenSoft = Color(0xFFE5F7EB);
  static const Color cardBg = Color(0xFFF9F9F9);
  static const Color white70 = Color(0xB8FFFFFF);
  static const Color shadow = Color(0x14000000);
  static const Color black20 = Color(0x33000000);

  static const LinearGradient background = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFE1F1C2),
      Color(0xFFF6FBEB),
      Colors.white,
    ],
    stops: [0.0, 0.45, 1.0],
  );
}