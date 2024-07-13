import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../core/app_services.dart';
import '../features/models/user/user_model.dart';

class Api {
  Api({required this.appServices});

  final AppServices appServices;

  final client = http.Client();

  Future<User> login(String account, String password) async {
    log('LOGIN GET ${appServices.endpoint}/login - $account $password', name: 'API');
    try {
      final Uri url = Uri.parse('${appServices.endpoint}/login');
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
