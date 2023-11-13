import 'package:flutter/material.dart';
import 'package:groceryapp/view/home/home_screen.dart';
import 'package:groceryapp/view/onboarding/onboarding_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) =>  const OnboardingScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) =>  HomePage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: const Text('Error Route')),
              body: const Center(child: Text('Sorry, No route found!')),
            ));
  }
}
