import 'package:flutter/material.dart';
import 'package:hive_test/controllers/hive_controller.dart';
import 'package:hive_test/models/person.dart';

class TestHive extends StatefulWidget {
  const TestHive({Key? key}) : super(key: key);

  @override
  State<TestHive> createState() => _TestHiveState();
}

class _TestHiveState extends State<TestHive> {
  HiveController hiveController = HiveController();
  TextEditingController nameTxtCtr = TextEditingController();
  TextEditingController ageTxtCtr = TextEditingController();
  TextEditingController friendsTxtCtr = TextEditingController();
  String _result = '결과창';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hiveController.openHive();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    hiveController.closeHive();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sqlite Screen'),
      ),
      body: Container(
        child: Center(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(labelText: '이름'),
                controller: nameTxtCtr,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(labelText: '나이'),
                controller: ageTxtCtr,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(labelText: '친구들'),
                controller: friendsTxtCtr,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    hiveController.putHive(
                        '1', Person('이찬호', 18, ['aaa', 'bbbb']));
                  },
                  child: Text('insert'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Person item = await hiveController.readHive('1');
                    setState(() {
                      _result = item.name!;
                    });
                  },
                  child: Text('select'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('update'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('delete'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Divider(
                thickness: 10,
              ),
            ),
            Center(
              child: Text(_result),
            )
          ]),
        ),
      ),
    );
  }
}
