import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:pipercrux/entities/file.dart';
import 'package:pipercrux/entities/user.dart';
import 'package:pipercrux/widgets/content/model/animated_list_model.dart';
import 'package:pipercrux/widgets/content/model/users_list_model.dart';
import 'package:pipercrux/widgets/content/view/add_user_view.dart';
import 'package:pipercrux/widgets/content/view/content_view.dart';
import 'package:pipercrux/widgets/content/view/user_radiobutton_component.dart';
import 'package:pipercrux/widgets/content/view/user_tile_component.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import 'file_tile_component.dart';

class UsersListView extends StatefulWidget {
  @override
  _UsersListViewState createState() => _UsersListViewState();
}

class _UsersListViewState extends State<UsersListView> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  ListModel<UserModel> _list;
  UserModel _selectedItem;

  @override
  void initState() {
    super.initState();
    _list = ListModel<UserModel>(
      listKey: _listKey,
      initialItems: <UserModel>[
        UserModel(
          'kelidon',
          '47.211.157.3',
        ),
        UserModel(
          'captain',
          '37.205.131.6',
        )
      ],
      removedItemBuilder: _buildRemovedItem,
    );
  }

  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return UserTileComponent(
      animation: animation,
      user: _list[index],
      selected: _selectedItem == _list[index],
      onTap: () {
        setState(() {
          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
        });
      },
    );
  }

  Widget _buildRemovedItem(
      UserModel user, BuildContext context, Animation<double> animation) {
    return UserTileComponent(
      animation: animation,
      user: user,
      selected: false,
    );
  }

  void _insert(UserModel user) {
    final int index =
        _selectedItem == null ? _list.length : _list.indexOf(_selectedItem);
    _list.insert(index, user);
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
    final usersListModel = Provider.of<UsersListModel>(context);

    return Scaffold(
      body: usersListModel.isAdd
          ? AddUserView()
          : AnimatedList(
              key: _listKey,
              initialItemCount: _list.length,
              itemBuilder: _buildItem,
            ),
      floatingActionButton: usersListModel.isAdd
          ? null
          : FloatingActionButton(
              onPressed: () {
                usersListModel.changePage();
              },
              child: Icon(LineAwesomeIcons.plus),
            ),
    );
  }
}
