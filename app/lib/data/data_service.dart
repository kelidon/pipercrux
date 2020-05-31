import 'package:logger/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pipercrux/data/models.dart';
import 'package:pipercrux/main.dart';

class DataService {
  final db = Firestore.instance;

  static DataService _instance;
  static get instance {
    if (_instance == null) _instance = DataService();

    return _instance;
  }

  Stream<User> findOneByUsername(String username) {
    return db
        .collection('users')
        .where('username', isEqualTo: username)
        .snapshots()
        .expand((c) => c.documents)
        .map((d) {
          log.d(d.data);
          return d.data
          ..putIfAbsent('uid', () => d.documentID);
          })
        .map((map) => User.fromMap(map));
  }
}
