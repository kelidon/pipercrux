import 'package:flutter/material.dart';
import 'package:pipercrux/widgets/content/model/content_model.dart';
import 'package:pipercrux/widgets/content/model/files_list_model.dart';
import 'package:pipercrux/widgets/content/model/users_list_model.dart';
import 'package:pipercrux/widgets/content/view/users_list_view.dart';
import 'package:provider/provider.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import '../../../main.dart';
import 'files_list_view.dart';

class ContentView extends StatelessWidget {
  ContentView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final contentModel = Provider.of<ContentModel>(context);
    final authState = Provider.of<AuthStatusNotifier>(context);

    List<Widget> _widgetOptions = <Widget>[
      ChangeNotifierProvider<FilesListModel>(
        create: (_) => FilesListModel(),
        child: FilesListView(),
      ),
      ChangeNotifierProvider<UsersListModel>(
        create: (_) => UsersListModel(),
        child: UsersListView(),
      )
    ];

    void _onItemTapped(int index) {
      contentModel.changePage(index);
    }

    return Scaffold(
      appBar: AppBar(title: Text(title), actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.lock_outline,
            color: Color(0xFF26A69A),
          ),
          tooltip: 'Show Snackbar',
          onPressed: () {
            authState.user = null;
          },
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
