import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../core/app_colors.dart';

enum StatType { drawsWon, amount, lotAmount, poolType, members, slotCount }

/// Rich graphical StatItem matching the reference graphics and typography.
class StatItem extends StatelessWidget {
  final StatType? type;
  final IconData? icon;
  final Color? iconColor;
  final String label;
  final String value;

  const StatItem({
    super.key,
    this.type,
    this.icon,
    this.iconColor,
    required this.label,
    required this.value,
  });

  Widget _buildGraphicIcon() {
    StatType? resolvedType = type;
    if (resolvedType == null) {
      final l = label.toLowerCase();
      if (l.contains('draws')) {
        resolvedType = StatType.drawsWon;
      } else if (l.contains('lot')) {
        resolvedType = StatType.lotAmount;
      } else if (l.contains('amount')) {
        resolvedType = StatType.amount;
      } else if (l.contains('pool')) {
        resolvedType = StatType.poolType;
      } else if (l.contains('member')) {
        resolvedType = StatType.members;
      } else if (l.contains('slot')) {
        resolvedType = StatType.slotCount;
      }
    }

    if (resolvedType != null) {
      switch (resolvedType) {
        case StatType.drawsWon:
          return Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              color: const Color(0xFFFFE8EE),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFFFB5C8), width: 1),
            ),
            child: CustomPaint(painter: _DrawsWonGraphicPainter()),
          );
        case StatType.amount:
          return Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              color: const Color(0xFFE2F7E7),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFA5E6B4), width: 1),
            ),
            child: CustomPaint(painter: _TwoCoinsGraphicPainter()),
          );
        case StatType.lotAmount:
          return Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              color: const Color(0xFFFFF6D8),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFFFDF7D), width: 1),
            ),
            child: CustomPaint(painter: _MoneyPouchGraphicPainter()),
          );
        case StatType.poolType:
          return Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              color: const Color(0xFFE7F8D8),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFBBE59B), width: 1),
            ),
            child: CustomPaint(painter: _CycleLoopGraphicPainter()),
          );
        case StatType.members:
          return Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              color: const Color(0xFFE3F3FC),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFAED8F5), width: 1),
            ),
            child: CustomPaint(painter: _MembersClusterGraphicPainter()),
          );
        case StatType.slotCount:
          return Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              color: const Color(0xFFFFECEE),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFFFBCC3), width: 1),
            ),
            child: CustomPaint(painter: _SlotStackGraphicPainter()),
          );
      }
    }

    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        color: (iconColor ?? AppColors.lime).withValues(alpha: 0.15),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          icon ?? Icons.circle,
          size: 14,
          color: iconColor ?? AppColors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildGraphicIcon(),
        const SizedBox(width: 7),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 10,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 1),
              Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: AppColors.black,
                  letterSpacing: -0.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// 1. Draws Won: Curved circular arrow with dollar inside
class _DrawsWonGraphicPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.32;

    final paint = Paint()
      ..color = const Color(0xFFFF487C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(rect, -math.pi * 0.8, math.pi * 1.5, false, paint);

    // Arrow tip pointing up-right
    final arrowAngle = -math.pi * 0.8 + math.pi * 1.5;
    final arrowX = center.dx + radius * math.cos(arrowAngle);
    final arrowY = center.dy + radius * math.sin(arrowAngle);

    final path = Path();
    path.moveTo(arrowX - 2.5, arrowY + 3.5);
    path.lineTo(arrowX + 2, arrowY - 0.5);
    path.lineTo(arrowX - 2.5, arrowY - 3.5);
    final fillPaint = Paint()
      ..color = const Color(0xFFFF487C)
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, fillPaint);

    // Center currency glyph / dollar
    final textPainter = TextPainter(
      text: const TextSpan(
        text: '\$',
        style: TextStyle(
          color: Color(0xFFFF487C),
          fontSize: 9.5,
          fontWeight: FontWeight.w900,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    textPainter.paint(
      canvas,
      center - Offset(textPainter.width / 2, textPainter.height / 2 + 0.5),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// 2. Amount: Two overlapping 3D coins with dollar sign
class _TwoCoinsGraphicPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Back coin
    final backCenter = Offset(size.width * 0.38, size.height * 0.42);
    final backRadius = size.width * 0.24;

    final backFill = Paint()..color = const Color(0xFFC7F0D0);
    final backStroke = Paint()
      ..color = const Color(0xFF239A4D)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    canvas.drawCircle(backCenter, backRadius, backFill);
    canvas.drawCircle(backCenter, backRadius, backStroke);

    // Front coin
    final frontCenter = Offset(size.width * 0.60, size.height * 0.60);
    final frontRadius = size.width * 0.28;

    final frontFill = Paint()..color = const Color(0xFFEBFCEE);
    final frontStroke = Paint()
      ..color = const Color(0xFF239A4D)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4;
    canvas.drawCircle(frontCenter, frontRadius, frontFill);
    canvas.drawCircle(frontCenter, frontRadius, frontStroke);

    // Dollar on front coin
    final textPainter = TextPainter(
      text: const TextSpan(
        text: '\$',
        style: TextStyle(
          color: Color(0xFF1B803E),
          fontSize: 9,
          fontWeight: FontWeight.w900,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    textPainter.paint(
      canvas,
      frontCenter - Offset(textPainter.width / 2, textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// 3. Lot Amount: Drawstring 3D Money Bag / Pouch with dollar
class _MoneyPouchGraphicPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height * 0.52;

    // Sack body
    final bagPath = Path();
    bagPath.moveTo(cx - 3, cy - 5);
    // Neck flare top
    bagPath.lineTo(cx - 5.5, cy - 8.5);
    bagPath.quadraticBezierTo(cx, cy - 9.5, cx + 5.5, cy - 8.5);
    bagPath.lineTo(cx + 3, cy - 5);
    // Right bulge
    bagPath.cubicTo(cx + 9, cy - 2, cx + 9, cy + 8, cx, cy + 8);
    // Left bulge
    bagPath.cubicTo(cx - 9, cy + 8, cx - 9, cy - 2, cx - 3, cy - 5);
    bagPath.close();

    final bagFill = Paint()..color = const Color(0xFFFFE082);
    final bagStroke = Paint()
      ..color = const Color(0xFFD49A00)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.3
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(bagPath, bagFill);
    canvas.drawPath(bagPath, bagStroke);

    // Tied drawstring ribbon line
    final tiePaint = Paint()
      ..color = const Color(0xFFB07F00)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    canvas.drawLine(
      Offset(cx - 3.5, cy - 5),
      Offset(cx + 3.5, cy - 5),
      tiePaint,
    );

    // Dollar text on pouch
    final textPainter = TextPainter(
      text: const TextSpan(
        text: '\$',
        style: TextStyle(
          color: Color(0xFF946A00),
          fontSize: 8.5,
          fontWeight: FontWeight.w900,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    textPainter.paint(
      canvas,
      Offset(cx - textPainter.width / 2, cy + 0.5 - textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// 4. Pool Type: Dual cycle loop arrows
class _CycleLoopGraphicPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.width * 0.28;

    final paint = Paint()
      ..color = const Color(0xFF4C9817)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    final fillPaint = Paint()
      ..color = const Color(0xFF4C9817)
      ..style = PaintingStyle.fill;

    // Top arc
    final rect = Rect.fromCircle(center: Offset(cx, cy), radius: r);
    canvas.drawArc(rect, -math.pi * 0.85, math.pi * 0.7, false, paint);

    // Top arrow tip
    final topTipAngle = -math.pi * 0.85 + math.pi * 0.7;
    final topX = cx + r * math.cos(topTipAngle);
    final topY = cy + r * math.sin(topTipAngle);
    final p1 = Path();
    p1.moveTo(topX - 1.5, topY - 3);
    p1.lineTo(topX + 2.5, topY);
    p1.lineTo(topX - 1.5, topY + 3);
    canvas.drawPath(p1, fillPaint);

    // Bottom arc
    canvas.drawArc(rect, math.pi * 0.15, math.pi * 0.7, false, paint);

    // Bottom arrow tip
    final btmTipAngle = math.pi * 0.15 + math.pi * 0.7;
    final btmX = cx + r * math.cos(btmTipAngle);
    final btmY = cy + r * math.sin(btmTipAngle);
    final p2 = Path();
    p2.moveTo(btmX + 1.5, btmY - 3);
    p2.lineTo(btmX - 2.5, btmY);
    p2.lineTo(btmX + 1.5, btmY + 3);
    canvas.drawPath(p2, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// 5. Members: 3-Person silhouette cluster
class _MembersClusterGraphicPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;

    final fill = Paint()
      ..color = const Color(0xFF2885C7)
      ..style = PaintingStyle.fill;

    // Center person (larger, slightly higher)
    canvas.drawCircle(Offset(cx, cy - 3.2), 2.8, fill);
    canvas.drawArc(
      Rect.fromCenter(center: Offset(cx, cy + 4.5), width: 9.5, height: 7),
      -math.pi,
      math.pi,
      true,
      fill,
    );

    // Left person
    canvas.drawCircle(Offset(cx - 5.5, cy - 1.5), 2.2, fill);
    canvas.drawArc(
      Rect.fromCenter(center: Offset(cx - 5.5, cy + 5), width: 7, height: 5.5),
      -math.pi,
      math.pi,
      true,
      fill,
    );

    // Right person
    canvas.drawCircle(Offset(cx + 5.5, cy - 1.5), 2.2, fill);
    canvas.drawArc(
      Rect.fromCenter(center: Offset(cx + 5.5, cy + 5), width: 7, height: 5.5),
      -math.pi,
      math.pi,
      true,
      fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// 6. Slot Count: Stacked horizontal capsule tickets
class _SlotStackGraphicPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;

    final stroke = Paint()
      ..color = const Color(0xFFE04A5F)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.3;

    final fill = Paint()
      ..color = const Color(0xFFFFDCE2)
      ..style = PaintingStyle.fill;

    // Top ticket
    final r1 = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(cx, cy - 3.2), width: 13, height: 5.5),
      const Radius.circular(2.5),
    );
    canvas.drawRRect(r1, fill);
    canvas.drawRRect(r1, stroke);

    // Bottom ticket
    final r2 = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(cx, cy + 3.5), width: 13, height: 5.5),
      const Radius.circular(2.5),
    );
    canvas.drawRRect(r2, fill);
    canvas.drawRRect(r2, stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
