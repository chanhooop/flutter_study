import 'package:flutter/material.dart';
import 'package:flutter_animations_masterclass/controllers/sqlite_controller.dart';
import 'package:flutter_animations_masterclass/models/sqlite_test_model.dart';
import 'package:intl/intl.dart';

class SqliteScreen extends StatefulWidget {
  const SqliteScreen({Key? key}) : super(key: key);

  @override
  State<SqliteScreen> createState() => _SqliteScreenState();
}

class _SqliteScreenState extends State<SqliteScreen> {
  TextEditingController noController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  SqliteController sqliteController = SqliteController();
  String _result = '결과창';

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
                decoration: InputDecoration(labelText: 'No'),
                controller: noController,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(labelText: 'Id'),
                controller: idController,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(labelText: 'Content'),
                controller: contentController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    print('insert 버튼 클릭');
                    String userID = idController.text;
                    String content = contentController.text;
                    String recordDate =
                        DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());
                    await sqliteController.testInsert(SqliteTestModel(
                      UserID: userID,
                      Content: content,
                      RecordDate: recordDate,
                    ));
                  },
                  child: Text('insert'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    var list = await sqliteController.testSelect();

                    setState(() {
                      for (var item in list) {
                        _result +=
                            '${item.No} - ${item.UserID} / ${item.Content} / ${item.RecordDate}\n';
                      }
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
