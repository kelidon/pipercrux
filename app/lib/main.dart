import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pipercrux/widgets/app/model/app.model.dart';
import 'package:pipercrux/widgets/app/view/app.view.dart';
import 'package:pipercrux/widgets/authentication/model/auth.model.dart';
import 'package:pipercrux/widgets/authentication/view/auth.view.dart';
import 'package:pipercrux/widgets/content/model/content.model.dart';
import 'package:pipercrux/widgets/content/view/content.view.dart';
import 'package:provider/provider.dart';

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
      home: ChangeNotifierProvider<AppModel>(
        create: (_) => AppModel(),
        child: AppView(),
      ),
    );
  }
}
