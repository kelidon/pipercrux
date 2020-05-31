import 'package:flutter/material.dart';
import 'package:pipercrux/data/users_controller.dart';
import 'package:pipercrux/main.dart';
import 'package:provider/provider.dart';

class SignInView extends StatefulWidget {
  SignInView({Key key}) : super(key: key);

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final controller = UsersController.instance;

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<AuthStatusNotifier>(context);
    const TextStyle optionStyle = TextStyle(fontSize: 30);

    return Container(
      width: 300,
      height: 500,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Spacer(
            flex: 3,
          ),
          Text(
            'Sign in',
            style: optionStyle,
          ),
          Spacer(
            flex: 2,
          ),
          TextField(
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
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: const EdgeInsets.all(20.0),
              hintText: 'Password',
            ),
          ),
          Spacer(
            flex: 2,
          ),
          RaisedButton(
            onPressed: () async {
              final username = _usernameController.text;
              final rawPassword = _passwordController.text;
              log.d('submitting $username:$rawPassword');

              final user = await controller.attemtSignIn(username, rawPassword);

              // todo: notify of bad credentials
              authState.user = user;
            },
            padding: const EdgeInsets.all(15.0),
            color: Color(0xFF26A69A),
            child: Text('Proceed', style: TextStyle(fontSize: 20)),
          ),
          Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
