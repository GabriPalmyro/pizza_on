

import '../models/debugging_model.dart';

abstract class DebuggingModelFactory {
  DebuggingModel createFromJson(Map<String, dynamic> json);
}