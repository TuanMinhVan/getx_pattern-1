import 'dart:async';

import 'package:dio/dio.dart';
import 'package:training/app/utils/logger.dart';

import '../../configs/application.dart';

enum ApiMethod { GET, POST, PUT, DELETE, PATH }

final List<String> rejectCode = <String>['jwt expired', 'un_authorized', 'invalid-token'];

Map<String, dynamic> errorHandle({DioError? error, bool base = false}) {
  var message = 'unknown_error';

  Map<String, dynamic>? data;

  switch (error?.type) {
    case DioErrorType.sendTimeout:
    case DioErrorType.receiveTimeout:
      message = 'request_time_out';
      break;
    case DioErrorType.response:
      if (error?.response?.data is Map<String, dynamic>) {
        data = error?.response?.data as Map<String, dynamic>;
        message = data['message'] as String;
      }
      break;
    default:
      message = 'Server đang bảo trì vui lòng thử lại sau';
      break;
  }

  ///Logout
  if (rejectCode.contains(message)) {
    Application.preferences.clear();
    // getx.Get.offAndToNamed(Routes.LOGIN);
  }

  return <String, dynamic>{
    'success': false,
    'message': message,
    'data': data,
  };
}

class ApiClient {
  late Dio dio;

  factory ApiClient() {
    return _instance;
  }

  ApiClient._internal();
  static final ApiClient _instance = ApiClient._internal();
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: Application.domain,
    connectTimeout: 10000,
    receiveTimeout: 10000,
    responseType: ResponseType.json,
  );
  
  static BaseOptions exportOption() {
    baseOptions.headers['content-type'] = 'application/json';
    baseOptions.headers['Authorization'] = 'token';
    return baseOptions;
  }

  static Future<Response> connect(
    ApiMethod method,
    String url, {
    Map<String, String>? headers,
    Map<String, String>? query,
    Map<String, dynamic>? body,
    FormData? data,
  }) async {
    try {
      final dio = Dio(exportOption());
      Response response;
      UtilLogger.log('url $url, query $query method $method');
      switch (method) {
        case ApiMethod.GET:
          response = await dio.get(url, queryParameters: query);
          break;
        case ApiMethod.POST:
          response = await dio.post(url, queryParameters: query, data: data ?? body);
          break;
        case ApiMethod.DELETE:
          response = await dio.delete(url, queryParameters: query);
          break;
        default:
          response = await dio.get(url, queryParameters: query);
          break;
      }
      return response;
    } on DioError catch (error) {
      UtilLogger.log(error);
      throw errorHandle(error: error);
    }
  }
}
