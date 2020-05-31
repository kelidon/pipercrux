import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pipercrux/data/models.dart';
import 'package:pipercrux/data/users_controller.dart';
import 'package:provider/provider.dart';

class CurrentUserDemo extends StatefulWidget {
  @override
  _CurrentUserDemoState createState() => _CurrentUserDemoState();
}

class _CurrentUserDemoState extends State<CurrentUserDemo> {
  final usersController = UsersController.instance;
  String username;
  String rawPassword;

  @override
  void initState() {
    username = 'alibaba';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: usersController.attemtSignIn(username, rawPassword),
      child: Column(
        children: <Widget>[
          AmaTextWidget(),
          // FIXME: this doesn't help
          FlatButton(
            child: Text('alibaba'),
            onPressed: () => setState(() => username = 'alibaba'),
          ),
          FlatButton(
            child: Text('artsiom'),
            onPressed: () => setState(() => username = 'artsiom'),
          ),
        ],
      ),
    );
  }
}

class AmaTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<User>(context);
    return Container(
      child: Text('$data'),
    );
  }
}
