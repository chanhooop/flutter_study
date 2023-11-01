import 'package:api_example/common/const/data.dart';
import 'package:api_example/common/secure_storage/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final dioProvider = Provider<Dio>((ref){
  final dio = Dio();

  final storage = ref.watch(secureStorageProvider);

  dio.interceptors.add(
    CustomInterceptor(storage:storage)
  );

  return dio;
});

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  CustomInterceptor({required this.storage});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // 1. 요청 보내기

    //엑세스 토큰이 true인 경우
    if (options.headers['accessToken'] == 'true') {
      options.headers.remove('accessToken');

      final token = await storage.read(key: ACCESS_TOKEN_KEY);

      options.headers.addAll({'authorization': 'Bearer $token}'});
    }

    //리프레쉬 토큰이 true인 경우
    if (options.headers['refreshToken'] == 'true') {
      options.headers.remove('refreshToken');

      final token = await storage.read(key: REFRESH_TOKEN_KEY);

      options.headers.addAll({'authorization': 'Bearer $token}'});
    }

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 2. 응답 받기
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    // 3. 에러 처리
    //401 에러 -> 토큰 재발급 시도 -> 재발급 되면 다시 새로운 토큰으로 요청
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);

    if (refreshToken == null) {
      //에러 던지기
      handler.reject(err);
    }

    final isStatus401 = err.response?.statusCode == 401;
    final isPathRefresh = err.requestOptions.path == '/auth/token';

    //401에러이지만 토큰 refresh 시도를 하지 않은 경우
    if (isStatus401 && !isPathRefresh) {
      final dio = Dio();

      try{
        final resp = await dio.post(
          'http://$ip/auth/token',
          options: Options(
            headers: {'authorization': 'Bearer $refreshToken'},
          ),
        );

        final accessToken = resp.data['accessToken'];

        final options = err.requestOptions;

        //토큰 변경 후 변경된 토큰 값 다시 저장하기
        options.headers.addAll({
          'authorization': 'Bearer $accessToken'
        });

        await storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);

        // 옵션 값에서 토큰만 바꾸고 기존 요청 다시 보내기
        final response = await dio.fetch(options);

        return handler.resolve(response);

      } on DioError catch(e){
        //어떤 경우에도 토큰을 재발급받을 수 없음
        return handler.reject(e);
      }
    }

    return handler.reject(err);
  }
}
