import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:finlot/main.dart';
import 'package:finlot/screens/home_screen.dart';
import 'package:finlot/screens/onboarding_screen.dart';
import 'package:finlot/screens/splash_screen.dart';
import 'package:finlot/widgets/coin_3d.dart';

void main() {
  testWidgets('FinlotApp initial splash and onboarding smoke test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FinlotApp());

    // Initially displays the splash screen
    expect(find.byType(SplashScreen), findsOneWidget);

    // Advance time past the splash delay (2200ms)
    await tester.pump(const Duration(milliseconds: 2500));
    await tester.pumpAndSettle();

    // Verify transition to OnboardingScreen
    expect(find.byType(OnboardingScreen), findsOneWidget);
    expect(find.text('Create Your Pool'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
  });

  testWidgets('HomeScreen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const FinlotApp(home: HomeScreen()));

    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.text('Shibil'), findsOneWidget);
    expect(find.text('Manage Pool'), findsOneWidget);
    expect(find.text('Joined Pool'), findsOneWidget);
    expect(find.text('Bike Pool'), findsOneWidget);
  });
  testWidgets('Coin3D renders with 3D perspective transforms', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: Center(child: Coin3D(size: 50, yaw: 0.5, pitch: 0.2)),
      ),
    );

    expect(find.byType(Coin3D), findsOneWidget);
  });
}
