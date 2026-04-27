import 'package:dio/dio.dart';

class ApiErrorHandler {
  static String handle(dynamic e) {
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.connectionError:
          return "No internet connection. Please check your Wi-Fi or mobile data.";

        case DioExceptionType.connectionTimeout:
          return "The connection took too long. Try checking your internet or try again later.";

        case DioExceptionType.sendTimeout:
          return "Request timed out while sending data. Please try again.";

        case DioExceptionType.receiveTimeout:
          return "Server took too long to respond. Please try again later.";

        case DioExceptionType.badCertificate:
          return "Security issue detected with the server. Connection not secure.";

        case DioExceptionType.badResponse:
          return "Server returned an unexpected error.";

        case DioExceptionType.cancel:
          return "The request was cancelled. Please try again.";

        case DioExceptionType.unknown:
          return "Something went wrong. Please check your connection and try again.";
      }
    }

    return "Unexpected error occurred. Please try again later.";
  }
}
