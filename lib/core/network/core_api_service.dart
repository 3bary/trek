import 'package:dio/dio.dart';
import 'package:greendo/core/network/api_service.dart';

class CoreApiService implements IApiService {
  final _baseUrl = 'https://final-project-production-5d66.up.railway.app/';
  final Dio _dio;

  CoreApiService(this._dio);

  @override
  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get('$_baseUrl$endpoint');
    print('✅ Response Data (Review): ${response.data}');
    return response.data;
  }
}
