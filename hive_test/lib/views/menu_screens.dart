import 'package:flutter/material.dart';
import 'package:hive_test/views/test_hive.dart';

class MenuScreens extends StatelessWidget {
  const MenuScreens({Key? key}) : super(key: key);

  void _gotoPage(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive_Test'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  _gotoPage(context, TestHive());
                },
                child: Text('Implicit Animations')),
          ],
        ),
      ),
    );
  }
}
