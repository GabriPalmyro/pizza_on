
import '../../../core/data/data_source/shared_preferences_data_source.dart';
import '../../../core/data/repository/shared_preferences_repository.dart';
import '../data/factories/api_responde_factory.dart';

class NetworkModule {
  final String _kApiKey = 'xDebuggingNetwork';

  SharedPreferencesDataSource get dataSource => SharedPreferencesDataSource(
        factory: ApiResponseFactory(),
        preferenceKey: _kApiKey,
      );

  SharedPreferencesRepository get repository => SharedPreferencesRepository(
        dataSource: dataSource,
      );
}
