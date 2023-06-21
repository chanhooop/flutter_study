import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hive Screen'),
        ),
        body: Column(children: [
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
              decoration: InputDecoration(labelText: '친구이름'),
              controller: friendsTxtCtr,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () async {
                  hiveController.insertHive(nameTxtCtr.text,
                      Person(nameTxtCtr.text, int.parse(ageTxtCtr.text), []));
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
                onPressed: () {
                  hiveController.deleteHive(nameTxtCtr.text);
                },
                child: Text('delete'),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Divider(
              thickness: 10,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: ValueListenableBuilder(
                valueListenable: Hive.box<Person>('person').listenable(),
                builder: (BuildContext context, box, Widget? child) {
                  if (box.length == 0) return Text('데이터가 없습니다');

                  return ListView.separated(
                      itemBuilder: (_, index) {
                        final item = box.getAt(index);

                        return Row(
                          children: [
                            Text('${item?.name} / '),
                            Text('${item?.age} / '),
                          ],
                        );
                      },
                      separatorBuilder: (_, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Divider(),
                        );
                      },
                      itemCount: box.length);
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
