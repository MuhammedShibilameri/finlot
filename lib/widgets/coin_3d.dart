import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../core/app_colors.dart';

/// A realistic, high-fidelity 3D metallic Finlot coin with lighting,
/// bevel, embossed currency emblem, and perspective transformation.
class Coin3D extends StatelessWidget {
  final double size;
  final double yaw;
  final double pitch;
  final double roll;

  const Coin3D({
    super.key,
    required this.size,
    this.yaw = 0.0,
    this.pitch = 0.0,
    this.roll = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    // 3D perspective matrix
    final Matrix4 transform = Matrix4.identity()
      ..setEntry(3, 2, 0.002) // subtle perspective depth
      ..rotateX(pitch)
      ..rotateY(yaw)
      ..rotateZ(roll);

    return SizedBox(
      width: size * 1.5,
      height: size * 1.5,
      child: Center(
        child: Transform(
          alignment: Alignment.center,
          transform: transform,
          child: CustomPaint(
            size: Size(size, size),
            painter: _Coin3DPainter(yaw: yaw, pitch: pitch),
          ),
        ),
      ),
    );
  }
}

class _Coin3DPainter extends CustomPainter {
  final double yaw;
  final double pitch;

  _Coin3DPainter({required this.yaw, required this.pitch});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // 1. Soft realistic drop shadow underneath the coin
    final shadowOffset = Offset(math.sin(yaw) * 6, 8 + math.cos(pitch) * 4);
    final shadowPaint = Paint()
      ..color = const Color(0x26000000)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
    canvas.drawOval(
      Rect.fromCenter(
        center: center + shadowOffset,
        width: size.width * 0.9,
        height: size.height * 0.45,
      ),
      shadowPaint,
    );

    // 2. Extrusion / 3D rim thickness when tilted
    final thickness = 3.5;
    final rimSteps = 4;
    final edgeDirectionX = -math.sin(yaw);
    final edgeDirectionY = math.sin(pitch);

    final edgePaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF869E00), Color(0xFF556500), Color(0xFF374200)],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    for (int i = rimSteps; i >= 1; i--) {
      final stepOffset = Offset(
        edgeDirectionX * (thickness * i / rimSteps),
        edgeDirectionY * (thickness * i / rimSteps),
      );
      canvas.drawCircle(center + stepOffset, radius, edgePaint);
    }

    // 3. Outer metallic rim bevel
    final rimShader = const SweepGradient(
      colors: [
        Color(0xFFFFF8BD),
        Color(0xFFD5ED35),
        Color(0xFF8FA900),
        Color(0xFFFFF8BD),
        Color(0xFF9FB900),
        Color(0xFFD5ED35),
        Color(0xFFFFF8BD),
      ],
      stops: [0.0, 0.2, 0.4, 0.55, 0.75, 0.9, 1.0],
    ).createShader(Rect.fromCircle(center: center, radius: radius));

    final rimPaint = Paint()
      ..shader = rimShader
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, rimPaint);

    // 4. Outer rim groove / inner shadow
    final groovePaint = Paint()
      ..color = const Color(0x33000000)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    canvas.drawCircle(center, radius - 2.0, groovePaint);

    // 5. Coin face (inner recessed surface)
    final faceRadius = radius - 3.5;
    final faceShader = RadialGradient(
      center: const Alignment(-0.25, -0.3),
      radius: 0.9,
      colors: const [
        Color(0xFFF7FFD6),
        Color(0xFFD5ED35),
        AppColors.lime,
        Color(0xFF8AA300),
      ],
      stops: const [0.0, 0.35, 0.75, 1.0],
    ).createShader(Rect.fromCircle(center: center, radius: faceRadius));

    final facePaint = Paint()
      ..shader = faceShader
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, faceRadius, facePaint);

    // 6. Subtle concentric decorative ring on coin face
    final ringPaint = Paint()
      ..color = const Color(0x2BFFFFFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;
    canvas.drawCircle(center, faceRadius * 0.72, ringPaint);

    // 7. Embossed Currency Symbol (₹ / Finlot currency mark)
    _drawEmbossedSymbol(canvas, center, faceRadius * 0.48);

    // 8. Dynamic specular light sweep across coin face
    final sheenPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment(-1.0 + math.cos(yaw) * 0.5, -1.0),
        end: Alignment(1.0 + math.cos(yaw) * 0.5, 1.0),
        colors: const [
          Colors.transparent,
          Color(0x38FFFFFF),
          Color(0x66FFFFFF),
          Colors.transparent,
        ],
        stops: const [0.35, 0.48, 0.55, 0.7],
      ).createShader(Rect.fromCircle(center: center, radius: faceRadius))
      ..style = PaintingStyle.fill;

    canvas.save();
    canvas.clipPath(
      Path()..addOval(Rect.fromCircle(center: center, radius: faceRadius)),
    );
    canvas.drawCircle(center, faceRadius, sheenPaint);
    canvas.restore();
  }

  void _drawEmbossedSymbol(Canvas canvas, Offset center, double size) {
    // Stylized embossed Rupee / currency mark
    final half = size / 2;

    // Shadow path (emboss depth)
    final shadowOffset = const Offset(0.8, 1.0);
    final darkEmbossPaint = Paint()
      ..color = const Color(0xFF485600)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = size * 0.16;

    final lightEmbossPaint = Paint()
      ..color = const Color(0x99FFFFFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = size * 0.16;

    final frontPaint = Paint()
      ..color = const Color(0xFF263000)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = size * 0.14;

    Path createSymbolPath(Offset origin) {
      final p = Path();
      // Top bar
      p.moveTo(origin.dx - half * 0.75, origin.dy - half * 0.85);
      p.lineTo(origin.dx + half * 0.75, origin.dy - half * 0.85);

      // Second bar
      p.moveTo(origin.dx - half * 0.75, origin.dy - half * 0.35);
      p.lineTo(origin.dx + half * 0.55, origin.dy - half * 0.35);

      // Upper curve
      p.moveTo(origin.dx - half * 0.25, origin.dy - half * 0.85);
      p.lineTo(origin.dx - half * 0.25, origin.dy - half * 0.35);
      p.arcTo(
        Rect.fromCenter(
          center: Offset(origin.dx - half * 0.25, origin.dy),
          width: half * 1.05,
          height: half * 0.75,
        ),
        -math.pi / 2,
        math.pi,
        false,
      );

      // Diagonal leg
      p.lineTo(origin.dx + half * 0.65, origin.dy + half * 0.9);
      return p;
    }

    // Light highlight shifted up-left
    canvas.drawPath(
      createSymbolPath(center - const Offset(0.6, 0.6)),
      lightEmbossPaint,
    );
    // Dark shadow shifted down-right
    canvas.drawPath(createSymbolPath(center + shadowOffset), darkEmbossPaint);
    // Main foreground symbol stroke
    canvas.drawPath(createSymbolPath(center), frontPaint);
  }

  @override
  bool shouldRepaint(covariant _Coin3DPainter oldDelegate) {
    return oldDelegate.yaw != yaw || oldDelegate.pitch != pitch;
  }
}
