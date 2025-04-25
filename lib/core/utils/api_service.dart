import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://travel-recommendation-api-production.up.railway.app/';
  final Dio _dio;

  ApiService(this._dio);

  Future<List<dynamic>> get({required String endpoint})async{
    var response = await _dio.get('$_baseUrl$endpoint');
    print('✅ Response Data: ${response.data}');
    return response.data;
  }
}