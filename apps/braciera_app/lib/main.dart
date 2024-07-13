import 'package:braciera_app/core/base_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pizza_on/app/core/app_routes.dart';
import 'package:pizza_on/app/core/app_theme.dart';
import 'package:pizza_on/app/providers.dart';
import 'package:pizza_on/app/routes/routes.dart';
import 'package:provider/src/provider.dart';


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

  final theme = AppBracieraTheme();

  runApp(
    AppWidget(theme: theme),
  );
}

class AppWidget extends StatefulWidget {
  const AppWidget({required this.theme, super.key});

  final AppTheme theme;

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppTheme>.value(value: widget.theme),
        ...providers,
      ],
      child: MaterialApp(
        title: widget.theme.texts.appTitle,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.login,
        onGenerateRoute: AppRouter().generateRoute,
      ),
    );
  }
}
