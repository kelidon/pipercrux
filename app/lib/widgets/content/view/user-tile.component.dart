import 'package:flutter/material.dart';

class UserTileComponent extends StatelessWidget {
  UserTileComponent({Key key, this.login, this.filler}) : super(key: key);

  final String login;
  final String filler;

  @override
  Widget build(BuildContext context) {
    //final homeModel = Provider.of<ContentModel>(context);
    const TextStyle loginStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
    const TextStyle fillerStyle = TextStyle(fontSize: 15, color: Colors.grey);

    return InkWell(
      onTap: () {},
      child: Container(
        height: 80,
        padding: EdgeInsets.fromLTRB(25, 25, 40, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              login,
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
              filler,
              style: fillerStyle,
            ),
          ],
        ),
      ),
    );
  }
}
