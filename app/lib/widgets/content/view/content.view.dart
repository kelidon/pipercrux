import 'package:flutter/material.dart';
import 'package:pipercrux/widgets/content/model/content.model.dart';
import 'package:pipercrux/widgets/content/view/file-tile.component.dart';
import 'package:pipercrux/widgets/content/view/users-list.view.dart';
import 'package:provider/provider.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import 'files-list.view.dart';

class ContentView extends StatelessWidget {
  ContentView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final homeModel = Provider.of<ContentModel>(context);

    List<Widget> _widgetOptions = <Widget>[
      FilesListView(),
      //TestList(),
      UsersListView(),
//      ChangeNotifierProvider<PageModel>(
//        builder: (_) => PageModel(),
//        child: Page(),
//      ),
    ];

    void _onItemTapped(int index) {
      homeModel.changePage(index);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: _widgetOptions.elementAt(homeModel.getIndex()),
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
        currentIndex: homeModel.getIndex(),
        selectedItemColor: Colors.teal[150],
        onTap: _onItemTapped,
      ),
    );
  }
}