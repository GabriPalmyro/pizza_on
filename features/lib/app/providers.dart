import 'package:provider/provider.dart';

import 'features/controllers/user/user_manager.dart';

final providers = [
  ChangeNotifierProvider(create: (_) => UserManager()),
];
