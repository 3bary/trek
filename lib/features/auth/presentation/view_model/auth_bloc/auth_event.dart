part of 'auth_bloc.dart';


abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class RegisterEvent extends AuthEvent {
  final RegisterRequestBody registerRequestBody;

  const RegisterEvent(this.registerRequestBody);

  @override
  List<Object> get props => [registerRequestBody];
}

class LoginEvent extends AuthEvent {
  final LoginRequestBody loginRequestBody;
  const LoginEvent(this.loginRequestBody);

  @override
  List<Object> get props => [loginRequestBody];
}
