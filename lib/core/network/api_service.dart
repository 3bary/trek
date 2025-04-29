
abstract class IApiService {
  Future<Map<String, dynamic>> get({required String endpoint});
}