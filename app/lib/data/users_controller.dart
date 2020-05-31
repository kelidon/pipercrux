import 'data_service.dart';

import '../main.dart';
import 'models.dart';

class UsersController {
  static final _instance = UsersController();
  static UsersController get instance => _instance;

  DataService get service => DataService.instance;

  /**
   * @return document id for users or [null] if failed
   */
  Future<User> attemtSignIn(String username, String rawPassword) {
    return service.findOne(username).catchError((err) {
      log.d('not found with $err');
      return User();
    }).timeout(Duration(seconds: 5), onTimeout: () {
      log.i('timeout');
      return User();
    });
  }
}
