import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:islami/constants/strings.dart';
import 'package:islami/networking/api_error_handler.dart';

class PrayWebServices {
  late Dio dio;

  PrayWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: prayTimeBaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<Map<String, dynamic>> getPrayTime() async {
    try {
      Response response = await dio.get('city=cairo&country=egypt');
      return response.data;
    } catch (e) {
      log(ApiErrorHandler.handle(e));
      return {};
    }
  }
}
