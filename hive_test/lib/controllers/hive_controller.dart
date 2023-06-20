import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/models/person.dart';

class HiveController {
  Box<Person>? personBox;

  openHive() async {
    personBox = await Hive.openBox<Person>('person');
  }

  closeHive() async {
    personBox!.close();
  }

  putHive(String key, Person item) async {
    personBox!.put(key, item);
  }

  readHive(String key) async {
    Person? item = personBox!.get(key, defaultValue: Person('null', 0, []));
    return item;
  }
}
