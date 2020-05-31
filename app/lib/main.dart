import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pipercrux/widgets/authentication/model/auth_model.dart';
import 'package:pipercrux/widgets/authentication/view/auth_view.dart';
import 'package:pipercrux/widgets/content/model/content_model.dart';
import 'package:pipercrux/widgets/content/view/content_view.dart';
import 'package:provider/provider.dart';
import 'data/models.dart';

Logger log = new Logger();

void main() {
  log.i('START ');
  runApp(ChangeNotifierProvider(
    create: (_) => AuthStatusNotifier(),
    child: Application(),
  ));
}

class AuthStatusNotifier with ChangeNotifier {
  User _user;

  set user(User user) {
    _user = user;
    notifyListeners();
  }

  get authenticated => _user?.id != null;

  get username => _user?.username;

  get userId => _user?.id;
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isAuthenticated =
        Provider.of<AuthStatusNotifier>(context).authenticated;

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
