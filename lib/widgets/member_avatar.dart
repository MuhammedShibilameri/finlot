import 'package:flutter/material.dart';

import '../core/app_colors.dart';

/// Member avatar using the original reference avatars for the pool members.
class MemberAvatar extends StatelessWidget {
  final String name;
  final double radius;

  const MemberAvatar({
    super.key,
    required this.name,
    this.radius = 20,
  });

  String? _getAssetForName(String n) {
    final lower = n.toLowerCase().trim();
    if (lower.contains('vidhun')) return 'assets/images/avatar_vidhun.png';
    if (lower.contains('nouman') || lower.contains('nauman')) {
      return 'assets/images/avatar_nouman.png';
    }
    if (lower.contains('zuha')) return 'assets/images/avatar_zuha.png';
    if (lower.contains('nihala')) return 'assets/images/avatar_nihala.png';
    if (lower.contains('rijas')) return 'assets/images/avatar_rijas.png';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final asset = _getAssetForName(name);

    if (asset != null) {
      return ClipOval(
        child: Image.asset(
          asset,
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => _buildFallback(),
        ),
      );
    }

    return _buildFallback();
  }

  Widget _buildFallback() {
    final String initial = name.isEmpty ? '?' : name[0].toUpperCase();
    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.lime,
      child: Text(
        initial,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: radius * 0.85,
        ),
      ),
    );
  }
}