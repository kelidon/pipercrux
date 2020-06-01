import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pipercrux/entities/user.dart';
import 'package:pipercrux/widgets/content/model/users_list_model.dart';
import 'package:pipercrux/widgets/content/view/users_list_view.dart';
import 'package:provider/provider.dart';

class AddUserView extends StatelessWidget {
  AddUserView({Key key}) : super(key: key);
  final _usernameController = TextEditingController();
  String name;

  @override
  Widget build(BuildContext context) {
    final usersListModel = Provider.of<UsersListModel>(context);
    const TextStyle optionStyle = TextStyle(fontSize: 30);

    return Center(
      child: Container(
        width: 300,
        height: 300,
        child: Column(
          children: <Widget>[
            Text(
              'Input user id',
              style: optionStyle,
            ),
            Spacer(
              flex: 1,
            ),
            TextField(
              controller: _usernameController,
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
              onPressed: () {
                //todo user search logic
                name = _usernameController.text;
                usersListModel.changePage();
                },
              label: Text("add user"),
            )
          ],
        ),
      ),
    );
  }
}
