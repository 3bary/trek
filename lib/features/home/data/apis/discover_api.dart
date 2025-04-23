import 'package:dio/dio.dart';


import '../../../../core/utils/constants.dart';

class DiscoverApi {
  late Dio dio;

  DiscoverApi() {
    BaseOptions options = BaseOptions(
      baseUrl: apiLink,
      receiveDataWhenStatusError: true,
      receiveTimeout: Duration(seconds: 20),
      connectTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllPlaces() async {
    try {
      Response response = await dio.get('places');
      return response.data;
    } catch (e) {
      print('❌ Error fetching places: $e');
      return [];
    }
  }
}
