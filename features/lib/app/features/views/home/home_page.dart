import 'package:flutter/material.dart';
import 'package:pizza_on/app/core/app_theme.dart';
import 'package:provider/provider.dart';

import '../../../core/app_routes.dart';
import '../../../shared/button.dart';
import '../../controllers/user/user_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<AppTheme>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      backgroundColor: theme.colors.backgroundColor,
      body: Consumer<UserManager>(
        builder: (_, value, __) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  theme.images.logo,
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 48),
                Text('Welcome ${value.user?.name}'),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ButtonWidget(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.menu);
                    },
                    label: 'Abrir Menu',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ButtonWidget(
                    onPressed: () {
                      context.read<UserManager>().logout(() {
                        Navigator.pushReplacementNamed(context, AppRoutes.login);
                      });
                    },
                    label: 'Logout',
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
