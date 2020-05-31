import 'package:flutter/material.dart';

class FileTileComponent extends StatelessWidget {
  FileTileComponent({Key key, this.name, this.date, this.isCruxed})
      : super(key: key);

  final String name;
  final String date;
  final bool isCruxed;

  @override
  Widget build(BuildContext context) {
    //final homeModel = Provider.of<ContentModel>(context);
    var status = isCruxed ? 'cruxed' : 'full';
    const TextStyle nameStyle = TextStyle(fontSize: 18);
    const TextStyle dateStyle = TextStyle(fontSize: 15, color: Colors.grey);
    const TextStyle statusStyle = TextStyle(fontSize: 10, color: Colors.grey);

    return InkWell(
      onTap: () {},
      child: Container(
        height: 90,
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Row(
          children: <Widget>[
            Container(
              height: 50,
              width: 300,
              padding: EdgeInsets.fromLTRB(25, 7, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: nameStyle,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Color(0xFF26A69A)),
                      ),
                    ),
                  ),
                  Text(
                    date,
                    style: dateStyle,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
              child: Column(
                children: <Widget>[
                  Icon(
                    isCruxed ? Icons.center_focus_weak : Icons.center_focus_strong,
                    color: Colors.teal[150],
                    size: 38.0,
                  ),
                  Text(status, style: statusStyle,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
