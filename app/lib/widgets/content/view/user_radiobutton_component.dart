import 'package:flutter/material.dart';
import 'package:pipercrux/entities/user.dart';

class UserRadioButtonComponent extends StatelessWidget {
  const UserRadioButtonComponent(
      {Key key,
        @required this.animation,
        this.onTap,
        @required this.user,
        this.selected: false})
      : assert(animation != null),
        assert(selected != null),
        super(key: key);

  final Animation<double> animation;
  final VoidCallback onTap;
  final bool selected;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    const TextStyle loginStyle =
    TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
    const TextStyle fillerStyle = TextStyle(fontSize: 15, color: Colors.grey);

    return Row(
      children: [
        Radio(
          activeColor: Colors.teal[150],
          onChanged: (bool value){  },
        ),
        Container(
          height: 80,
          width: 250,
          padding: EdgeInsets.fromLTRB(0, 25, 40, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                user.login,
                style: loginStyle,
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Color(0xFF26A69A)),
                  ),
                ),
              ),
              Text(
                user.filler,
                style: fillerStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
