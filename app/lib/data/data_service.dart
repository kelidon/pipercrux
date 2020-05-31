import 'package:cloud_firestore/cloud_firestore.dart';

import 'models.dart';

class DataService {
  final db = Firestore.instance;

  static DataService _instance;
  static get instance {
    if (_instance == null) _instance = DataService();

    return _instance;
  }

  Future<User> createUser(User request) async {
    final nameUsed = await db
        .collection('users')
        .where('username', isEqualTo: request.username)
        .limit(1)
        .getDocuments()
        .asStream()
        .expand((qs) => qs.documents)
        .any((ds) => ds.exists)
        .timeout(Duration(seconds: 5), onTimeout: () => false)
        .catchError((err) => false);
    
    if (nameUsed) {
      return Future.value(User());
    }

    return db
        .collection('users')
        .add(request.toMap())
        .then((ref) => ref.get())
        .then((doc) => Future.value(_dataWithDocId(doc)))
        .then(User.fromMap);
  }

  Future<User> findOneByUsername(String username) {
    return db
        .collection('users')
        .where('username', isEqualTo: username)
        .limit(1)
        .getDocuments()
        .asStream()
        .expand((query) => query.documents)
        .where((doc) => doc.exists)
        .first
        .then((doc) => User.fromMap(_dataWithDocId(doc)));
  }

  Map<String, dynamic> _dataWithDocId(DocumentSnapshot doc) {
    return doc.data..putIfAbsent('uid', () => doc.documentID);
  }
}
