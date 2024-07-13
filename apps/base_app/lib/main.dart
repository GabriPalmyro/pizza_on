import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pizza_on/app/core/app_colors.dart';
import 'package:pizza_on/app/core/app_routes.dart';
import 'package:pizza_on/app/providers.dart';
import 'package:pizza_on/app/routes/routes.dart';
import 'package:provider/src/provider.dart';

import 'base_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ),
  );

  final colors = AppColorBraciera();

  runApp(
    AppWidget(colors: colors),
  );
}

class AppWidget extends StatefulWidget {
  const AppWidget({required this.colors, super.key});

  final AppColors colors;

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...providers,
        Provider<AppColors>.value(value: widget.colors),
      ],
      child: MaterialApp(
        title: 'Pizza On',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.login,
        onGenerateRoute: AppRouter().generateRoute,
      ),
    );
  }
}
