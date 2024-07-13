import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../core/app_services.dart';
import '../features/models/user/user_model.dart';

class Api {
  Api._();

  final client = http.Client();

  static final Api instance = Api._();

  Future<User> login(String account, String password) async {
    log('LOGIN GET ${AppServices.baseUrl}/login - $account $password', name: 'API');
    try {
      final Uri url = Uri.parse('${AppServices.baseUrl}/login');
      final request = await client.post(
        url,
        body: {
          'account': account,
          'password': password,
        },
      );
      
      if (request.statusCode == HttpStatus.ok) {
        return User.fromJson(request.body);
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      rethrow;
    }
  }
}
