import 'package:flutter/material.dart';

/// Round avatar showing the first letter of the name on a colour picked from
/// the name. Swap for NetworkImage / AssetImage when real photos exist.
class MemberAvatar extends StatelessWidget {
  final String name;
  final double radius;

  const MemberAvatar({super.key, required this.name, this.radius = 18});

  static const List<Color> _palette = [
    Color(0xFFE5484D),
    Color(0xFF5B5BD6),
    Color(0xFFF59E0B),
    Color(0xFF0EA5A5),
    Color(0xFFD946A8),
  ];

  @override
  Widget build(BuildContext context) {
    final String initial = name.isEmpty ? '?' : name[0].toUpperCase();
    final Color color = _palette[name.codeUnitAt(0) % _palette.length];

    return CircleAvatar(
      radius: radius,
      backgroundColor: color,
      child: Text(
        initial,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: radius * 0.8,
        ),
      ),
    );
  }
}