import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:greendo/features/auth/data/models/register_request_body.dart';
import 'package:greendo/features/auth/data/models/user_model.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/api_service.dart';

class AuthRepo {
  final IApiService _apiService;

  AuthRepo(this._apiService);

  Future<Either<Failure, UserModel>> register(RegisterRequestBody registerRequestBody) async {
    try {
      var response = await _apiService.post(
        endpoint: "user/register",
        body: {
          'email': registerRequestBody.email,
          'name': registerRequestBody.name,
          'password': registerRequestBody.password,
        },
      );
      final userData = UserModel.fromJson(response['user']);
      return right(userData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  Future<Either<Failure, String>> login(String email, String password) async {
    try {
      var response = await _apiService.post(
        endpoint: "user/login",
        body: {
          'email': email,
          'password': password,
        },
      );
      final token = response['token'];
      return right(token);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}