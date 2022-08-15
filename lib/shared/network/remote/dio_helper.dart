import 'package:dio/dio.dart';

import '../../constance/constant.dart';

class DioHelper {

  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://tre-sor.it/WS/',
        receiveDataWhenStatusError: true,

      ),
    );
  }
  static Future<Response> getData(

      {
        required String methodUrl,
        Map<String, dynamic> ? query,
      }) async {

    dio.options.headers = {
      //"Content-Type":"application/json",
      "Authorization": 'Bearer $sharedToken',
    };
    return await dio.get(methodUrl, queryParameters: query);
  }

  static Future<Response> postData(
      {
        required String methodUrl,
        required Map<String, dynamic>  data}) async {
    dio.options.headers = {
      //"Content-Type":"application/json",
      "Authorization": 'Bearer $sharedToken',
    };
    return await dio.post(
      methodUrl,
      data: data,
    );
  }
  static Future<Response> deleteData(

      {
        required String methodUrl,
        Map<String, dynamic> ? query,
      }) async {

    dio.options.headers = {
      "Authorization": 'Bearer $sharedToken',
    };
    return await dio.delete(methodUrl, queryParameters: query);
  }
}