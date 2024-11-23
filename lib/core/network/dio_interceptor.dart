import 'package:flutter_course/core/network/endpoints.dart';
import 'package:flutter_course/core/shared_preferences/my_shared.dart';
import 'package:flutter_course/core/utils/safe_print.dart';
import 'package:dio/dio.dart';


class DioInterceptor extends Interceptor {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  String? token;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      "lang": MyShared.getCurrentLanguage(),
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    });
    options.headers.addAll({
      "Authorization": "Bearer $token",
    });
        return super.onRequest(options, handler);
  }


  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Log the error details
    if (err.response != null) {
      safePrint("ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path} => MESSAGE: ${err.response?.data}");
    } else {
      safePrint("ERROR => PATH: ${err.requestOptions.path} => MESSAGE: ${err.message}");
    }
    // Error handling logic
    String errorMessage;
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        errorMessage = "Connection timed out. Please try again later.";
        break;
      case DioExceptionType.badResponse:
        errorMessage = err.response?.data['message'] ?? "Received an invalid response.";
        break;
      case DioExceptionType.cancel:
        errorMessage = "Request was cancelled.";
        break;
      case DioExceptionType.connectionError:
        errorMessage = "No Internet Connection.";
        break;
      default:
        errorMessage = err.message ?? "Unknown error occurred.";
        break;
    }

    handler.resolve(Response(
      requestOptions: err.requestOptions,
      data: {"message": errorMessage}, // Return a Flutter widget as an error message.
      statusCode: err.response?.statusCode,
    ));
}
  }