import 'package:dio/dio.dart';
import 'package:serverless_example/utils/extension/extensions.dart';

class CustomInterceptor extends Interceptor{
  var dio = Dio();

  // 1) 요청 보낼때
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    /// 엑세스 토큰 실어서 보내기
    logger.d('[REQ] [${options.method}] : ${options.uri}');
    return super.onRequest(options, handler);
  }

  // 2) 응답을 받을때
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d('[RES] [${response.statusCode}] : ${response.data}');
    return super.onResponse(response, handler);
  }

  // 3) 에러가 났을때
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async{
    ///
    logger.e('[onError] [${err.response?.statusCode}] : ${err.error}');
    return super.onError(err, handler);
  }
}