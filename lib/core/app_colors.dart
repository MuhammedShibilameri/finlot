import 'package:flutter/material.dart';

/// All colours used in the app live here so the design is easy to tweak.
class AppColors {
  AppColors._();

  static const Color lime = Color(0xFFB5D000); // brand green (logo, accents)
  static const Color limeCard = Color(0xFFDDEB6B); // pool card / header card
  static const Color limeSoft = Color(0xFFEFF5C8); // soft chips
  static const Color pink = Color(0xFFFF6FA5); // selected tab
  static const Color pinkSoft = Color(0xFFFFE3EC); // tags
  static const Color black = Color(0xFF111111);
  static const Color grey = Color(0xFF7A7A7A);
  static const Color green = Color(0xFF2E9B4F);
  static const Color greenSoft = Color(0xFFE2F4E7);
  static const Color white70 = Color(0xB3FFFFFF); // white at ~70% opacity
  static const Color shadow = Color(0x1A000000);
  static const Color black20 = Color(0x33000000);

  static const LinearGradient background = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFD7EBB4), Color(0xFFF6F9E6), Colors.white],
  );
}