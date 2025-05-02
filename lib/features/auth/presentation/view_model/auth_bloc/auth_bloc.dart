import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/login_request_body.dart';
import '../../../data/models/register_request_body.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repos/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;

  AuthBloc(this.authRepo) : super(AuthInitial()) {
    // Handle Register Event
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await authRepo.register(event.registerRequestBody);

      result.fold(
            (failure) => emit(AuthFailure(failure.errorMessage)),
            (user) => emit(RegisterSuccess()),
      );
    });

    // Handle Login Event
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await authRepo.login(event.loginRequestBody);

      result.fold(
            (failure) => emit(AuthFailure(failure.errorMessage)),
            (token) => emit(LoginSuccess(token)),
      );
    });
  }
}
