import 'package:flutter/material.dart';
import 'package:xdebugging/presentation/pages/xdebugging_page.dart';

import '../core/app_routes.dart';
import '../features/views/home/home_page.dart';
import '../features/views/login/login_page.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.debugging:
        return MaterialPageRoute(builder: (_) => const DebuggingPage());
      default:
        return null;
    }
  }
}
