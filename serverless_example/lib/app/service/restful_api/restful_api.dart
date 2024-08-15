

import 'package:dio/dio.dart';

import '../middle_ware/dio_config.dart';

enum ApiMethod {
  Get,
  Post,
  Put,
  Delete,
}

RestfulApi(
  ApiMethod apiMethod,
  String path, {
  Object? data,
  Map<String, dynamic>? queryParameters,
  Options? options,
  CancelToken? cancelToken,
  ProgressCallback? onSendProgress,
  ProgressCallback? onReceiveProgress,
}) async {
  Dio dio = DioConfig().dio;
  late Response response;
  switch (apiMethod) {
    case ApiMethod.Get:
      return response = await dio.get(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
    case ApiMethod.Post:
      return response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    case ApiMethod.Put:
      return response = await dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    case ApiMethod.Delete:
      return response = await dio.delete(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
  }
}


