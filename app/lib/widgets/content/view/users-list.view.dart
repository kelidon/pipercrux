import 'package:flutter/material.dart';
import 'package:pipercrux/widgets/content/view/user-tile.component.dart';

import 'file-tile.component.dart';

class UsersListView extends StatelessWidget {
  UsersListView({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //final homeModel = Provider.of<ContentModel>(context);

    return ListView(
      children: <Widget>[
        UserTileComponent(login: 'kelidon', filler: '47.211.157.3',),
        UserTileComponent(login: 'captain', filler: '37.205.131.6',),
      ],
    );
  }
}
