import 'package:flutter/material.dart';
import 'package:pipercrux/widgets/app/model/app.model.dart';
import 'package:provider/provider.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class SignUpView extends StatelessWidget {
  SignUpView({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context);

    const TextStyle optionStyle =
    TextStyle(fontSize: 30);

    void _onProceed() {
      appModel.changePage();
    }

    return Container(
        width: 300,
        height: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Spacer(flex: 3,),
            Text('Sign up', style: optionStyle,),
            Spacer(flex: 2,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.all(20.0),
                hintText: 'Login',
              ),
            ),
            Spacer(flex: 1,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.all(20.0),
                hintText: 'Password',
              ),
            ),
            Spacer(flex: 1,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.all(20.0),
                hintText: 'Key',
              ),
            ),
            Spacer(flex: 2,),
            RaisedButton(
              onPressed: _onProceed,
              padding: const EdgeInsets.all(15.0),
              color:  Color(0xFF26A69A),
              child: Text('Proceed', style: TextStyle(fontSize: 20)),
            ),
            Spacer(flex: 5,),
          ],
        )
    );
  }
}
