import 'dart:async';

import 'package:dio/dio.dart';
import 'package:newsapplication/core/baseurl.dart';

class NetworkUtils {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: AppUrls.baseUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
  ));

  static Future<Response> getRequest(String endpoint,
      {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: params);
      return response;
    } catch (e) {
      print('Error getting data: $e');
      return Future.error('Error getting data: $e');
    }
  }
}
