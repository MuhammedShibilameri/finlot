import 'package:flutter/material.dart';


/// 3D animated graphic calendar badge shown on pool cards.
/// Displays realistic 3D spiral binder rings + day/month for scheduled pools,
/// or a 3x3 dot grid for custom pools.
class DateBadge extends StatefulWidget {
  final String day;
  final String month;
  final bool isGrid;

  const DateBadge({
    super.key,
    required this.day,
    required this.month,
    this.isGrid = false,
  });

  @override
  State<DateBadge> createState() => _DateBadgeState();
}

class _DateBadgeState extends State<DateBadge> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    if (widget.isGrid) {
      return Container(
        width: 52,
        height: 54,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0E000000),
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: SizedBox(
            width: 26,
            height: 26,
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(9, (index) {
                final bool isDotted = index == 8;
                return Container(
                  decoration: BoxDecoration(
                    color: isDotted ? Colors.transparent : const Color(0xFFC7D3CD),
                    shape: BoxShape.circle,
                    border: isDotted
                        ? Border.all(
                            color: const Color(0xFFC7D3CD),
                            width: 1.2,
                          )
                        : null,
                  ),
                );
              }),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.94 : 1.0,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeInOut,
        child: SizedBox(
          width: 54,
          height: 58,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              // Main 3D calendar page body
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Color(0xFFFAFCF5),
                      Color(0xFFF1F5E8),
                    ],
                    stops: [0.0, 0.7, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: const Color(0x18000000),
                    width: 0.8,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x20000000),
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                    BoxShadow(
                      color: Color(0x0C000000),
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 6),
                    Text(
                      widget.day,
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF557700),
                        height: 1.0,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      widget.month.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFD63B09),
                        letterSpacing: 0.4,
                      ),
                    ),
                  ],
                ),
              ),

              // Left spiral binder hook
              const Positioned(
                top: 0,
                left: 11,
                child: _SpiralHook3D(),
              ),

              // Right spiral binder hook
              const Positioned(
                top: 0,
                right: 11,
                child: _SpiralHook3D(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SpiralHook3D extends StatelessWidget {
  const _SpiralHook3D();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Ring top loop
        Container(
          width: 7,
          height: 12,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF90B506),
                Color(0xFF4C6600),
                Color(0xFF2B3A00),
              ],
            ),
            borderRadius: BorderRadius.circular(3.5),
            boxShadow: const [
              BoxShadow(
                color: Color(0x33000000),
                blurRadius: 2,
                offset: Offset(0, 1.5),
              ),
            ],
          ),
        ),
        // Punch hole shadow
        Container(
          width: 5,
          height: 2.5,
          decoration: const BoxDecoration(
            color: Color(0x38000000),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}