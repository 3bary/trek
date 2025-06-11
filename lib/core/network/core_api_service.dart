import 'package:dio/dio.dart';
import 'package:greendo/core/network/api_service.dart';

class CoreApiService implements IApiService {
  final _baseUrl = 'https://project-00z-production.up.railway.app/';
  final Dio _dio;

  CoreApiService(this._dio);

  @override
  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get('$_baseUrl$endpoint');
    print('✅ Response Data (): ${response.data}');
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> post({
    required String endpoint,
    required Map<String, dynamic> body,
  }) async {
    var response = await _dio.post('$_baseUrl$endpoint', data: body);
    print('✅ Response Data (auth): ${response.data}');
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> put({required String endpoint, required Map<String, dynamic> body}) async {
    var response = await _dio.put('$_baseUrl$endpoint', data: body);
    print('✅ Response Data (Review): ${response.data}');
    return response.data;
  }

}
