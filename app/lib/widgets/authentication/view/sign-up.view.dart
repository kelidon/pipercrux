import 'package:flutter/material.dart';
import 'package:pipercrux/data/users_controller.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';

class SignUpView extends StatefulWidget {
  SignUpView({Key key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final controller = UsersController.instance;

  final _usernameText = TextEditingController();
  final _passwordText = TextEditingController();
  final _keyText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final signUpModel = Provider.of<SignUpModel>(context);
    final authState = Provider.of<AuthStatusNotifier>(context);

    const TextStyle optionStyle = TextStyle(fontSize: 30);

    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Spacer(
          flex: 3,
        ),
        Text(
          'Sign up',
          style: optionStyle,
        ),
        Spacer(
          flex: 2,
        ),
        TextField(
          controller: _usernameText,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: const EdgeInsets.all(20.0),
            hintText: 'Login',
          ),
        ),
        Spacer(
          flex: 1,
        ),
        TextField(
          controller: _passwordText,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: const EdgeInsets.all(20.0),
            hintText: 'Password',
          ),
        ),
        Spacer(
          flex: 1,
        ),
        TextField(
          controller: _keyText,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: const EdgeInsets.all(20.0),
            hintText: 'Key',
          ),
        ),
        Spacer(
          flex: 2,
        ),
        RaisedButton(
          onPressed: () async {
            final username = _usernameText.text;
            final rawPassword = _passwordText.text;
            final rawKey = _keyText.text;

            if (!_allHaveLength([username, rawPassword, rawKey], minInclusive: 3)) {
              // todo: notify user
              log.i('bad input ${[username, rawPassword, rawKey]}');
              return;
            }

            log.i('want to create $username $rawPassword $rawKey');
            final created = await controller.signUp(username, rawPassword, rawKey);

            log.i('created $created');
            authState.user = created;
          },
          padding: const EdgeInsets.all(15.0),
          color: Color(0xFF26A69A),
          child: Text('Proceed', style: TextStyle(fontSize: 20)),
        ),
        Spacer(
          flex: 5,
        ),
      ],
    ));
  }

  bool _hasLength(String str, {int len = 0}) => (str?.length ?? 0) >= len;
  bool _allHaveLength(List<String> strs, {int minInclusive = 0}) => strs
      .map((s) => _hasLength(s, len: minInclusive))
      .fold(true, (previousValue, element) => previousValue && element);
}
