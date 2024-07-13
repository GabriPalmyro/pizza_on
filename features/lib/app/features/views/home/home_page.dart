import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/app_images.dart';
import '../../../core/app_routes.dart';
import '../../../shared/button.dart';
import '../../controllers/user/user_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Consumer<UserManager>(
        builder: (_, value, __) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.logo,
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
