import 'package:pizza_on/app/core/app_theme.dart';
import 'package:pizza_on/app/shared/api.dart';
import 'package:provider/provider.dart';

import 'features/controllers/user/user_manager.dart';

final providers = [
  ChangeNotifierProvider<UserManager>(
    create: (context) => UserManager(
      api: Api(
        appServices: context.read<AppTheme>().services,
      ),
    ),
  ),
];
