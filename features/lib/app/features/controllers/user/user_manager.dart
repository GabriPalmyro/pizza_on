import 'package:flutter/material.dart';

import '../../../shared/api.dart';
import '../../../shared/state_enum.dart';
import '../../models/user/user_model.dart';

class UserManager extends ChangeNotifier {

  UserManager({required this.api});

  User? user;
  StateEnum state = StateEnum.idle;

  final Api api;

  void setUser(User user) {
    this.user = user;
    notifyListeners();
  }

  void setState(StateEnum state) {
    this.state = state;
    notifyListeners();
  }

  void clearUser() {
    user = null;
    notifyListeners();
  }

  void clearState() {
    state = StateEnum.idle;
    notifyListeners();
  }

  void clearAll() {
    clearUser();
    clearState();
  }

  Future<void> login(
    String account,
    String password, {
    VoidCallback? onSuccess,
    VoidCallback? onError,
  }) async {
    try {
      setState(StateEnum.loading);
      final response = await api.login(account, password);
      setUser(response);
      setState(StateEnum.success);
      onSuccess?.call();
    } catch (e) {
      onError?.call();
      setState(StateEnum.error);
    }
  }

  Future<void> logout(VoidCallback? onLogout) async {
    clearAll();
    onLogout?.call();
  }
}
