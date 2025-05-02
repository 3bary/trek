
part of 'user_prefs_cubit.dart';

abstract class UserPrefsState extends Equatable {
  const UserPrefsState();

  @override
  List<Object?> get props => [];
}

class UserPrefsInitial extends UserPrefsState {}

class UserPrefsLoading extends UserPrefsState {}

class UserPrefsSuccess extends UserPrefsState {}

class UserPrefsFailure extends UserPrefsState {
  final String error;

  const UserPrefsFailure(this.error);

  @override
  List<Object?> get props => [error];
}
