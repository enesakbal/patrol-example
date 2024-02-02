import 'dart:math';

import 'package:flutter/material.dart';

class UserService extends ChangeNotifier {
  final List<User> _users = [];
  late User _currentUser;

  List<User> get users => _users;

  User get currentUser => _currentUser;

  void login({
    required String email,
    required String password,
  }) {
    final user = _users.firstWhere(
      (u) => u.email == email && u.password == password,
      orElse: () => throw Exception('User not found'),
    );

    _currentUser = user;
    notifyListeners();
  }

  void register({
    required String name,
    required String email,
    required String password,
  }) {
    final user = User(
      id: Random.secure().nextInt(40).toString(),
      name: name,
      email: email,
      password: password,
      lastLogin: DateTime.now(),
    );

    _users.add(user);
    notifyListeners();
  }

  void logout(User user) {
    _users.remove(user);
    notifyListeners();
  }

  void updateLastLogin(User user) {
    final index = _users.indexWhere((u) => u.id == user.id);
    _users[index] = user;
    notifyListeners();
  }

  void delete(User user) {
    _users.remove(user);
    notifyListeners();
  }

  void clear() {
    _users.clear();
    notifyListeners();
  }
}

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final DateTime lastLogin;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.lastLogin,
  });
}
