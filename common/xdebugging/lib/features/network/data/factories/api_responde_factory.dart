

import '../../../../core/data/factory/debugging_model_factory.dart';
import '../../../../core/data/models/debugging_model.dart';
import '../models/api_response.dart';

class ApiResponseFactory implements DebuggingModelFactory {
  @override
  DebuggingModel createFromJson(Map<String, dynamic> json) {
    return ApiResponse.fromJson(json);
  }
  
}