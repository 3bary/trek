import 'package:dio/dio.dart';
import '../../../../core/utils/constants.dart';

class DiscoverApi {
  late Dio dio;

  DiscoverApi() {
    BaseOptions options = BaseOptions(
      baseUrl: kBaseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 30),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllPlaces() async {
    try {
      final response = await dio.get('/recommendations/$kUserId');
      return response.data;
    } catch (e) {
      print('❌ Error fetching all places: $e');
      return [];
    }
  }

  Future<List<dynamic>> searchPlacesByCategory(String category) async {
    try {
      final response = await dio.get(
        '/search/$kUserId',
        queryParameters: {'query': category},
      );
      return response.data;
    } catch (e) {
      print('❌ Error searching places by category: $e');
      return [];
    }
  }
}
