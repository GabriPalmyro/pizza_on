

import '../../../features/network/domain/repository/local_repository.dart';
import '../data_source/shared_preferences_data_source.dart';
import '../models/debugging_model.dart';

class SharedPreferencesRepository implements LocalRepository {
  SharedPreferencesRepository({
    required this.dataSource,
  });

  final SharedPreferencesDataSource dataSource;

  @override
  Future<void> save(DebuggingModel model) async {
    await dataSource.saveData(model);
  }

  @override
  Future<List<DebuggingModel>> findAll() async => dataSource.findAll();

  @override
  Future<void> deleteAll() async {
    return;
  }
}
