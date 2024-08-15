import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverless_example/app/repository/model/home_news_item.dart';
import 'package:serverless_example/app/service/restful_api/restful_api.dart';
import 'package:serverless_example/utils/extension/extensions.dart';

part 'home_news.g.dart';

@riverpod
Future<HomeNewsList?> homeNews(HomeNewsRef ref) async {
  try{
    Response response = await RestfulApi(ApiMethod.Get, '/media/list/news/link?limit=4');
    logger.d('homeNews response : $response');
    return HomeNewsList.fromJson(response.data);
  }catch(e){
    logger.e('homeNewsProvider Error : $e');
  }
}