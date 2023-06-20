import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Person {
  @HiveField(0, defaultValue: '홍길동')
  String? name;

  @HiveField(1, defaultValue: 1)
  int? age;

  @HiveField(2, defaultValue: ['정길동', '황길동'])
  List<String>? friends;

  Person(this.name, this.age, this.friends);

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
