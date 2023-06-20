import 'package:flutter/material.dart';
import 'package:flutter_animations_masterclass/screens/apple_watch_screen.dart';
import 'package:flutter_animations_masterclass/screens/explicit_animations_screen.dart';
import 'package:flutter_animations_masterclass/screens/implicit_animations_screen.dart';
import 'package:flutter_animations_masterclass/screens/sqlite_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  void _gotoPage(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter animations'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  _gotoPage(context, ImplicitAnimationsScreen());
                },
                child: Text('Implicit Animations')),
            ElevatedButton(
                onPressed: () {
                  _gotoPage(context, ExplicitAnimationsScreen());
                },
                child: Text('Explicit Animations')),
            ElevatedButton(
                onPressed: () {
                  _gotoPage(context, AppleWatchScreen());
                },
                child: Text('Apple Watch')),
            ElevatedButton(
                onPressed: () {
                  _gotoPage(context, SqliteScreen());
                },
                child: Text('Sqlite Screen')),
          ],
        ),
      ),
    );
  }
}
