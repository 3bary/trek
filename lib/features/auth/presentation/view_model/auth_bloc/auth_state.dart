
part of 'auth_bloc.dart';





abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class RegisterSuccess extends AuthState {
  final UserModel user;

  const RegisterSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class LoginSuccess extends AuthState {
  final String token;

  const LoginSuccess(this.token);

  @override
  List<Object> get props => [token];
}

class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(this.message);

  @override
  List<Object> get props => [message];
}
