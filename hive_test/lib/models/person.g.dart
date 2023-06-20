// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonAdapter extends TypeAdapter<Person> {
  @override
  final int typeId = 0;

  @override
  Person read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Person(
      fields[0] == null ? '없음' : fields[0] as String?,
      fields[1] == null ? 0 : fields[1] as int?,
      fields[2] == null ? [] : (fields[2] as List?)?.cast<Friends>(),
    );
  }

  @override
  void write(BinaryWriter writer, Person obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.friends);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      json['name'] as String?,
      json['age'] as int?,
      (json['friends'] as List<dynamic>?)
          ?.map((e) => Friends.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'friends': instance.friends,
    };

Friends _$FriendsFromJson(Map<String, dynamic> json) => Friends(
      json['name'] as String?,
      json['love'] as bool?,
    );

Map<String, dynamic> _$FriendsToJson(Friends instance) => <String, dynamic>{
      'name': instance.name,
      'love': instance.love,
    };
