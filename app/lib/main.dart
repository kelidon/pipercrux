import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pipercrux/widgets/app/model/app.model.dart';
import 'package:pipercrux/widgets/app/view/app.view.dart';
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
    final isAuthenticated = Provider.of<AuthStatusNotifier>(context).authenticated;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pipercrux',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: ChangeNotifierProvider<AppModel>(
        create: (_) => AppModel(),
        child: AppView(),
      ),
    );
  }
}
