import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddUserView extends StatelessWidget {
  AddUserView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle optionStyle = TextStyle(fontSize: 30);

    return Scaffold(
      body: Container(
        width: 300,
        height: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Input user id',
              style: optionStyle,
            ),
            Spacer(
              flex: 2,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.all(20.0),
                hintText: 'User id',
              ),
            ),
            Spacer(
              flex: 1,
            ),
            FloatingActionButton.extended(
              onPressed: () {},
              label: Text("add user"),
            )
          ],
        ),
      ),
    );
  }
}
