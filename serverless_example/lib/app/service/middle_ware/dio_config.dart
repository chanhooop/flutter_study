

import 'package:dio/dio.dart';

import 'custom_interceptor.dart';

class DioConfig {
  /// 일반 http
  Dio dio = Dio(BaseOptions(
    baseUrl: 'https://api-jbhd.thesports.io', // 개발서버
    // headers: {
    //   'user-Agent': '${USER_AGENT} gmembers(${PACKAGE_INFO.version}(${PACKAGE_INFO.buildNumber}) / ${OS})'
    // },
  ))..interceptors.add(CustomInterceptor());
}