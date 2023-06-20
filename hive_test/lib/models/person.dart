import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Person {
  @HiveField(0, defaultValue: '없음')
  String? name;

  @HiveField(1, defaultValue: 0)
  int? age;

  @HiveField(2, defaultValue: [])
  List<Friends>? friends;

  Person(this.name, this.age, this.friends);

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}


@JsonSerializable()
// @HiveType(typeId: 1)
class Friends {
  // @HiveField(0, defaultValue: '친구')
  String? name;
  // @HiveField(1, defaultValue: false)
  bool? love;

  Friends(this.name, this.love);

  factory Friends.fromJson(Map<String, dynamic> json) => _$FriendsFromJson(json);

  Map<String, dynamic> toJson() => _$FriendsToJson(this);
}
