import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:islami/constants/strings.dart';
//* to recieve the data -> we used web services that deal with api

class RadioWebServices {
  late Dio dio; //* object of Dio

  RadioWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: radioBaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<Map<String, dynamic>> getRadioAudios() async { //! return api data (radio audios)
    try {
      Response response = await dio.get('radios?language=en'); //* recieve api data using dio.get
      return response.data;
    } on Exception catch (e) {
      log(e.toString());
      return {};
    }
  }
}
