import 'package:flutter/material.dart';

import 'core/app_colors.dart';
import 'screens/splash_screen.dart';

void main() => runApp(const FinlotApp());

class FinlotApp extends StatelessWidget {
  const FinlotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finlot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.lime),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashScreen(),
    );
  }
}