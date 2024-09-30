import 'package:flutter/material.dart';
import 'package:weather_app/view/onboarding_screen.dart';
import 'package:weather_app/view/hoom_screen.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
        HoomScreen.routeName:(context) => HoomScreen(),
      },
      initialRoute: OnboardingScreen.routeName,
    );
  }
}
