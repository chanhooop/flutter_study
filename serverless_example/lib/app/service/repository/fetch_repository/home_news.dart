import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverless_example/app/service/repository/model/home_news_item.dart';
import 'package:serverless_example/app/service/restful_api/restful_api.dart';
import 'package:serverless_example/utils/extension/extensions.dart';

part 'home_news.g.dart';

@riverpod
Future<HomeNewsList?> homeNews(HomeNewsRef ref) async {

  ref.onResume(() => print('homeNews onResume'));
  ref.onCancel(() => print('homeNews onCancel'));
  ref.onDispose(() => print('homeNews onDispose'));
  ref.onAddListener(() => print('homeNews onAddListener'));
  ref.onRemoveListener(() => print('homeNews onRemoveListener'));

  try{
    await Future.delayed(Duration(milliseconds: 1000));
    Response response = await RestfulApi(ApiMethod.Get, '/media/list/news/link?limit=4');
    logger.d('homeNews response : $response');
    return HomeNewsList.fromJson(response.data['body']);
  }catch(e){
    logger.e('homeNewsProvider Error : $e');
  }
}