import 'package:dio/dio.dart';
import 'package:greendo/core/network/api_service.dart';

class RecommendationApiService implements IApiService {
  final _baseUrl =
      'https://travel-recommendation-api-production-8363.up.railway.app/';
  final Dio _dio;

  RecommendationApiService(this._dio);

  @override
  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get('$_baseUrl$endpoint');
    print('✅ Response Data: ${response.data}');
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> post({
    required String endpoint,
    required Map<String, dynamic> body,
  }) async {
    var response = await _dio.post('$_baseUrl$endpoint', data: body);
    print('✅ Response Data: ${response.data}');
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> put({
    required String endpoint,
    required Map<String, dynamic> body,
  }) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
