import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pipercrux/widgets/authentication/model/auth.model.dart';
import 'package:pipercrux/widgets/authentication/view/auth.view.dart';
import 'package:pipercrux/widgets/content/model/content.model.dart';
import 'package:pipercrux/widgets/content/view/content.view.dart';
import 'package:provider/provider.dart';

Logger log = new Logger();

void main() {
  log.i('START ');
  runApp(ChangeNotifierProvider(
    create: (_) => AuthStatusNotifier(),
    child: Application(),
  ));
}

class AuthStatusNotifier with ChangeNotifier {
  bool _authenticated = false;
  set authenticated(bool a) {
    _authenticated = a;
    notifyListeners();
  }

  get authenticated => _authenticated;

  String _username;
  set username(String username) {
    _username = username;
    notifyListeners();
  }
  get username => _username;

  String _userId;
  set userId(String id) {
    _userId = id;
    _authenticated = id != null;
    notifyListeners();
  }
  get userId => _userId;
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isAuthenticated = Provider.of<AuthStatusNotifier>(context).authenticated;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pipercrux',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: isAuthenticated
          ? ChangeNotifierProvider<ContentModel>(
              create: (_) => ContentModel(),
              child: ContentView(title: 'Pipercrux'),
            )
          : ChangeNotifierProvider<AuthModel>(
              create: (_) => AuthModel(),
              child: AuthView(title: 'Pipercrux'),
            ),
    );
  }
}
