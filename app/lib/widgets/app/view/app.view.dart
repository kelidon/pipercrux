import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pipercrux/widgets/app/model/app.model.dart';
import 'package:pipercrux/widgets/authentication/model/auth.model.dart';
import 'package:pipercrux/widgets/authentication/view/auth.view.dart';
import 'package:pipercrux/widgets/content/model/content.model.dart';
import 'package:pipercrux/widgets/content/view/content.view.dart';
import 'package:provider/provider.dart';


class AppView extends StatelessWidget {
  AppView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context);

    List<Widget> _widgetOptions = <Widget>[
      ChangeNotifierProvider<ContentModel>(
        create: (_) => ContentModel(),
        child: ContentView(title: 'Pipercrux',),
      ),
      ChangeNotifierProvider<AuthModel>(
        create: (_) => AuthModel(),
        child: AuthView(title: 'Pipercrux',),
      ),
    ];

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(appModel.getCurrentState() ? 0 : 1),
      ),
    );
  }
}

