import 'package:steel_crypt/steel_crypt.dart';

import 'data_service.dart';

import '../main.dart';
import 'models.dart';

class UsersController {
  static final _instance = UsersController();

  static UsersController get instance => _instance;

  DataService get service => DataService.instance;

  Future<User> signUp(String username, String rawPassword, String key) {
    final salt = CryptKey().genDart(length: 16);
    final passHash = PassCrypt.scrypt(cpu: 512).hashPass(salt, rawPassword);

    log.d('salt: $salt passwd: $passHash');

    final request = User(
      username: username,
      passwordHash: passHash,
      passwordSalt: salt,
      cypherKey: key,
    );

    return service.createUser(request);
  }

  /**
   * @return [user.id] is [null] (or other default val) if user not found
   */
  Future<User> attemtSignIn(String username, String rawPassword) {
    return service
        .findOneByUsername(username)
        .asStream()
        .where((User u) => PassCrypt.scrypt(cpu: 512)
            .checkPassKey(u.passwordSalt, rawPassword, u.passwordHash))
        .first
        .catchError((err) {
      log.d('not found with $err');
      return User();
    }).timeout(Duration(seconds: 5), onTimeout: () {
      log.i('timeout');
      return User();
    });
  }
}
