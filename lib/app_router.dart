import 'package:flutter/material.dart';
import 'package:islami/constants/strings.dart';
import 'package:islami/presentation/nav_bar.dart';
import 'package:islami/presentation/onBoarding/onboarding_page.dart';

class AppRouter {
  final bool onboardingComplete;

  AppRouter({required this.onboardingComplete});

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoardingPage());
      case navBar:
        return MaterialPageRoute(builder: (_) => NavBar());
      default:
        return null;
    }
  }
}