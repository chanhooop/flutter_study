import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/models/person.dart';

class HiveController {
  Box<Person>? personBox;

  openHive() async {
    print('하이브 이닛 실행');
    await Hive.initFlutter(); // 플러터에서 하이브 이닛
    Hive.registerAdapter(PersonAdapter()); // 하이브 어뎁터 등록
    personBox = await Hive.openBox<Person>('person'); // 하이브 박스 모델 등록
    print('하이브 이닛 완료');
  }

  insertHive(String key, Person item) async {
    personBox!.put(key, item);
  }

  readHive(String key) async {
    Person? item = personBox!.get(key, defaultValue: Person('null', 0, []));
    return item;
  }
}
