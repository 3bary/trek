import 'package:dio/dio.dart';

class DioClient {
  static BaseOptions baseOptions = BaseOptions(
    receiveDataWhenStatusError: true,
    receiveTimeout: const Duration(seconds: 60),
    connectTimeout: const Duration(seconds: 30),
    responseType: ResponseType.json,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );
  static Dio get instance => Dio(baseOptions);
}