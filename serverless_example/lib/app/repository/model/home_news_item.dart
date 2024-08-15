import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_news_item.freezed.dart';
part 'home_news_item.g.dart';

@freezed
class HomeNewsList with _$HomeNewsList{
  factory HomeNewsList({
    List<HomeNewsItem>? list
  }) = _HomeNewsList;

  factory HomeNewsList.fromJson(Map<String, dynamic> json) =>
      _$HomeNewsListFromJson(json);
}

@freezed
class HomeNewsItem with _$HomeNewsItem{
  factory HomeNewsItem({
    String? seq,
  String? UserName,
  String? Title,
  String? RegiDate,
  String? RegiTime,
  int? Hit,
  String? Status,
  String? fix,
  String? TopImage,
  String? TopContent,
  String? AttachFileNM,
  String? PhotoFileNM}) = _HomeNewsItem;

  factory HomeNewsItem.fromJson(Map<String, dynamic> json) =>
      _$HomeNewsItemFromJson(json);
}