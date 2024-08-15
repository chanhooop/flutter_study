// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_news_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeNewsListImpl _$$HomeNewsListImplFromJson(Map<String, dynamic> json) =>
    _$HomeNewsListImpl(
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => HomeNewsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HomeNewsListImplToJson(_$HomeNewsListImpl instance) =>
    <String, dynamic>{
      'list': instance.list,
    };

_$HomeNewsItemImpl _$$HomeNewsItemImplFromJson(Map<String, dynamic> json) =>
    _$HomeNewsItemImpl(
      seq: json['seq'] as String?,
      UserName: json['UserName'] as String?,
      Title: json['Title'] as String?,
      RegiDate: json['RegiDate'] as String?,
      RegiTime: json['RegiTime'] as String?,
      Hit: (json['Hit'] as num?)?.toInt(),
      Status: json['Status'] as String?,
      fix: json['fix'] as String?,
      TopImage: json['TopImage'] as String?,
      TopContent: json['TopContent'] as String?,
      AttachFileNM: json['AttachFileNM'] as String?,
      PhotoFileNM: json['PhotoFileNM'] as String?,
    );

Map<String, dynamic> _$$HomeNewsItemImplToJson(_$HomeNewsItemImpl instance) =>
    <String, dynamic>{
      'seq': instance.seq,
      'UserName': instance.UserName,
      'Title': instance.Title,
      'RegiDate': instance.RegiDate,
      'RegiTime': instance.RegiTime,
      'Hit': instance.Hit,
      'Status': instance.Status,
      'fix': instance.fix,
      'TopImage': instance.TopImage,
      'TopContent': instance.TopContent,
      'AttachFileNM': instance.AttachFileNM,
      'PhotoFileNM': instance.PhotoFileNM,
    };
