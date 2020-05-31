import 'package:flutter/material.dart';

import 'file-tile.component.dart';

class FilesListView extends StatelessWidget {
  FilesListView({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //final homeModel = Provider.of<ContentModel>(context);

    return ListView(
      children: <Widget>[
        FileTileComponent(name: 'TomRiddle.txt', date: '02.05.1998', isCruxed: true,),
        FileTileComponent(name: 'souls.txt', date: '01.05.2020', isCruxed: false,),
      ],
    );
  }
}
