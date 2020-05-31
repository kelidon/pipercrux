import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pipercrux/data/data_service.dart';
import 'package:provider/provider.dart';

import 'models.dart';

class UsersController {
  static final _instance = UsersController();
  static UsersController get instance => _instance;

  DataService get service => DataService.instance;

  Stream<User> signIn(String username, String rawPassword) {
    return service
        .findOneByUsername(username)
        .where((user) => user.passwordHash == rawPassword); // todo: verify password
  }
}
