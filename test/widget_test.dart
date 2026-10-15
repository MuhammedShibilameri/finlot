import 'package:flutter_test/flutter_test.dart';

import 'package:urban_project/main.dart';
import 'package:urban_project/screens/home_screen.dart';
import 'package:urban_project/screens/onboarding_screen.dart';
import 'package:urban_project/screens/splash_screen.dart';

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
    await tester.pumpWidget(
      const FinlotApp(home: HomeScreen()),
    );

    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.text('Vidhun'), findsOneWidget);
    expect(find.text('Manage Pool'), findsOneWidget);
    expect(find.text('Joined Pool'), findsOneWidget);
    expect(find.text('Bike Pool'), findsOneWidget);
  });
}
