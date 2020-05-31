import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:pipercrux/entities/file.dart';
import 'package:pipercrux/widgets/content/model/animated-list.model.dart';
import 'package:pipercrux/widgets/content/view/content.view.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import 'file-tile.component.dart';

class FilesListView extends StatefulWidget {

  @override
  _FilesListViewState createState() => _FilesListViewState();
}

class _FilesListViewState extends State<FilesListView> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  ListModel<FileModel> _list;
  FileModel _selectedItem;

  @override
  void initState() {
    super.initState();
    _list = ListModel<FileModel>(
      listKey: _listKey,
      initialItems: <FileModel>[
        FileModel('TomRiddle.txt', '02.05.1998',  true,),
        FileModel('souls.txt', '01.05.2020', false,)
      ],
      removedItemBuilder: _buildRemovedItem,
    );
  }

  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return FileTileComponent(
      animation: animation,
      file: _list[index],
      selected: _selectedItem == _list[index],
      onTap: () {
        setState(() {
          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
        });
      },
    );
  }

  Widget _buildRemovedItem(
      FileModel file, BuildContext context, Animation<double> animation) {
    return FileTileComponent(
      animation: animation,
      file: file,
      selected: false,
    );
  }

  void _insert() {
    final int index =
    _selectedItem == null ? _list.length : _list.indexOf(_selectedItem);
    _list.insert(index,FileModel('it goes brrrrr.txt', 'today',  false,));
  }

  void _remove() {
    if (_selectedItem != null) {
      _list.removeAt(_list.indexOf(_selectedItem));
      setState(() {
        _selectedItem = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: AnimatedList(
          key: _listKey,
          initialItemCount: _list.length,
          itemBuilder: _buildItem,
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: _insert,
        child: Icon(LineAwesomeIcons.plus),
      ),
    );
  }
}
