import 'data_service.dart';

import '../main.dart';
import 'models.dart';

class UsersController {
  static final _instance = UsersController();
  static UsersController get instance => _instance;

  DataService get service => DataService.instance;

  Future<User> signUp(String username, String rawPassword, String key) {
    final request = User(
      username: username,
      passwordHash: rawPassword,
      cypherKey: key,
    );

    return service.createUser(request);
  }

  /**
   * @return [user.id] is [null] (or other default val) if user not found
   */
  Future<User> attemtSignIn(String username, String rawPassword) {
    return service.findOneByUsername(username).catchError((err) {
      log.d('not found with $err');
      return User();
    }).timeout(Duration(seconds: 5), onTimeout: () {
      log.i('timeout');
      return User();
    });
  }
}
