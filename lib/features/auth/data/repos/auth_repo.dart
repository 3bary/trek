import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:greendo/features/auth/data/models/register_request_body.dart';
import 'package:greendo/features/auth/data/models/user_model.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/cash_helper.dart';
import '../../../../core/network/api_service.dart';
import '../models/login_request_body.dart';

class AuthRepo {
  final IApiService _apiService;

  AuthRepo(this._apiService);

  Future<Either<Failure, void>> register(RegisterRequestBody registerRequestBody) async {
    try {
      var response = await _apiService.post(
        endpoint: "user/register",
        body: registerRequestBody.toJson(),
      );
      final userData = UserModel.fromJson(response['user']);
      await CashHelper.cacheUser(userData);
      print('Cached User: ${CashHelper.getCachedUser()!.name}');
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  Future<Either<Failure, void>> login(LoginRequestBody loginRequestBody) async {
    try {
      var response = await _apiService.post(
        endpoint: "user/login",
        body: loginRequestBody.toJson(),
      );
      final userData = UserModel.fromJson(response['data']);
      await CashHelper.cacheUser(userData);
      print('Cached User: ${CashHelper.getCachedUser()!.name}');
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}