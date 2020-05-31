import 'package:flutter/material.dart';
import 'package:pipercrux/entities/file.dart';
import 'package:provider/provider.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class FileTileComponent extends StatelessWidget {
  const FileTileComponent(
      {Key key,
      @required this.animation,
      this.onTap,
      @required this.file,
      this.selected: false})
      : assert(animation != null),
        assert(selected != null),
        super(key: key);

  final Animation<double> animation;
  final VoidCallback onTap;
  final bool selected;
  final FileModel file;

  @override
  Widget build(BuildContext context) {
    var status = file.isCruxed ? 'cruxed' : 'full';
    const TextStyle nameStyle = TextStyle(fontSize: 18);
    const TextStyle dateStyle = TextStyle(fontSize: 15, color: Colors.grey);
    const TextStyle statusStyle = TextStyle(fontSize: 10, color: Colors.grey);

    return InkWell(
      onTap: onTap,
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
                    file.name,
                    style: nameStyle,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 1.0, color: Color(0xFF26A69A)),
                      ),
                    ),
                  ),
                  Text(
                    file.date,
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
                    file.isCruxed
                        ? Icons.center_focus_weak
                        : Icons.center_focus_strong,
                    color: Colors.teal[150],
                    size: 38.0,
                  ),
                  Text(
                    status,
                    style: statusStyle,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
