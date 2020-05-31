import 'package:flutter/material.dart';
import 'package:pipercrux/widgets/app/model/app.model.dart';
import 'package:pipercrux/widgets/content/model/content.model.dart';
import 'package:pipercrux/widgets/content/view/users-list.view.dart';
import 'package:provider/provider.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import 'files-list.view.dart';

class ContentView extends StatelessWidget {
  ContentView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final contentModel = Provider.of<ContentModel>(context);
    final appModel = Provider.of<AppModel>(context);

    List<Widget> _widgetOptions = <Widget>[
      FilesListView(),
      UsersListView(),
    ];

    void _onItemTapped(int index) {
      contentModel.changePage(index);
    }

    void _onLock() {
      appModel.changePage();
    }

    return Scaffold(
      appBar: AppBar(title: Text(title), actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.lock_outline,
            color: Color(0xFF26A69A),
          ),
          tooltip: 'Show Snackbar',
          onPressed: _onLock,
        ),
      ]),
      body: Center(
        child: _widgetOptions.elementAt(contentModel.getIndex()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.folder_open),
            title: Text("Files"),
          ),
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.users),
            title: Text("Users"),
          ),
        ],
        currentIndex: contentModel.getIndex(),
        selectedItemColor: Colors.teal[150],
        onTap: _onItemTapped,
      ),
    );
  }
}
