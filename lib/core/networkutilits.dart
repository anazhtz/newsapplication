import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class NetworkUtils {
  static final Dio _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
  ));

  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;
  String _countryCode = 'nz'; 

  NetworkUtils() {
    setupRemoteConfig();
  }

  Future<String> setupRemoteConfig() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(seconds: 3),
    ));
    
    await _remoteConfig.fetchAndActivate();
    _countryCode = _remoteConfig.getString('country_code');
    return _countryCode;
  }

  Future<Response> getRequest() async {
    try {
      String countrysCode = await setupRemoteConfig();
      log(countrysCode);
      final String baseUrl = 'https://newsapi.org/v2/top-headlines?country=$countrysCode&apiKey=a3b73062336a4084953c7fcb0d02fcb3';
      final response = await _dio.get(baseUrl);
      return response;
    } catch (e) {
      print('Error getting data: $e');
      return Future.error('Error getting data: $e');
    }
  }
}
