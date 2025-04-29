import 'package:dio/dio.dart';
import 'package:greendo/core/network/api_service.dart';

class RecommendationApiService implements IApiService{
  final _baseUrl = 'https://travel-recommendation-api-production.up.railway.app/';
  final Dio _dio;

  RecommendationApiService(this._dio);

  @override
  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get('$_baseUrl$endpoint');
    print('✅ Response Data: ${response.data}');
    return response.data;
  }

}