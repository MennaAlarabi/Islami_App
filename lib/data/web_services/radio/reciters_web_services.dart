import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:islami/constants/strings.dart';
import 'package:islami/networking/api_error_handler.dart';

class RecitersWebServices {
  late Dio dio;

  RecitersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: recitersBaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<Map<String, dynamic>> getRecitersAudios() async {
    try {
      Response response = await dio.get('reciters?language=en');
      return response.data;
    } on Exception catch (e) {
      log(ApiErrorHandler.handle(e));
      return {};
    }
  }
}
