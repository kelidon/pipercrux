import 'package:flutter/material.dart';
import 'package:pipercrux/widgets/views/sign-in.view.dart';
import 'package:pipercrux/widgets/views/sign-up.view.dart';
import 'package:provider/provider.dart';
import 'package:pipercrux/widgets/models/auth.model.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class AuthView extends StatelessWidget {
  AuthView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final homeModel = Provider.of<AuthModel>(context);

    const TextStyle optionStyle =
        TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    List<Widget> _widgetOptions = <Widget>[
      SignInView(),
      SignUpView(),
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
            icon: Icon(LineAwesomeIcons.user),
            title: Text("Sign in"),
          ),
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.user_secret),
            title: Text("Sign up"),
          ),
        ],
        currentIndex: homeModel.getIndex(),
        selectedItemColor: Colors.teal[150],
        onTap: _onItemTapped,
      ),
    );
  }
}
