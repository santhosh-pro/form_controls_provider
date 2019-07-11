import 'package:flutter/material.dart';
import 'package:form_controls_provider/challenging_controls_page.dart';
import 'package:form_controls_provider/home_page.dart';
import 'package:form_controls_provider/simple_controls_page.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RoutePaths.Simple:
        return MaterialPageRoute(builder: (_) => SimpleControlsPage());
      case RoutePaths.Challenging:
        return MaterialPageRoute(builder: (_) => ChallengingControlsPage());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}

class RoutePaths {
  static const String Home = '/';
  static const String Simple = 'login';
  static const String Challenging = 'second';
}