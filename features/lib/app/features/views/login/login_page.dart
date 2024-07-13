import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/app_images.dart';
import '../../../core/app_routes.dart';
import '../../../shared/button.dart';
import '../../../shared/state_enum.dart';
import '../../controllers/user/user_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final accountController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    accountController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 48),
              Image.asset(
                AppImages.logo,
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 48),
              const Text('Login'),
              const SizedBox(height: 24),
              TextField(
                controller: accountController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Conta',
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                ),
              ),
              const SizedBox(height: 16),
              ButtonWidget(
                label: 'Login',
                onPressed: () {
                  context.read<UserManager>().login(
                    accountController.text,
                    passwordController.text,
                    onSuccess: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                    },
                    onError: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Erro ao fazer login'),
                        ),
                      );
                    },
                  );
                },
                loading: context.watch<UserManager>().state == StateEnum.loading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
