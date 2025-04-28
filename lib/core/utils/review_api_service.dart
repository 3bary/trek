import 'package:dio/dio.dart';

class ReviewApiService {
  final _baseUrl = 'https://final-project-production-5d66.up.railway.app/';
  final Dio _dio;

  ReviewApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get('$_baseUrl$endpoint');
    print('✅ Response Data (Review): ${response.data}');
    return response.data;
  }
}
