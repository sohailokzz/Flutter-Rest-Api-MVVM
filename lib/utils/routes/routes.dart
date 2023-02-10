import 'package:flutter/material.dart';
import 'package:rest_api_mvvp/view/home_screen.dart';
import 'package:rest_api_mvvp/view/login_screen.dart';
import 'package:rest_api_mvvp/view/sign_up_view.dart';
import 'route_names.dart';

class Routes {
  static MaterialPageRoute generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        );

      case RoutesName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        );
      case RoutesName.signup:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SignUpView(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text('No Route Define'),
              ),
            );
          },
        );
    }
  }
}
