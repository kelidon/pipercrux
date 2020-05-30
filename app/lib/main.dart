import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'widgets/views/auth.view.dart';
import 'package:provider/provider.dart';
import 'package:pipercrux/widgets/models/auth.model.dart';

Logger log = new Logger();
void main() {
  log.i('START ');
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pipercrux',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: ChangeNotifierProvider<AuthModel>(
        builder: (_) => AuthModel(),
        child: AuthView(title: 'Pipercrux',),
      ),
    );
    // );
  }
}

