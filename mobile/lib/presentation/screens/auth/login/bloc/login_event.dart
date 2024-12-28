import 'package:equatable/equatable.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

final class LoginInitialEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

final class LoginWithEmailVisibleEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

final class LoginChangeEmailPasswordEvent extends LoginEvent {
  final String username;
  final String password;

  const LoginChangeEmailPasswordEvent(
      {required this.username, required this.password});
  @override
  List<Object?> get props => [username, password];
}

final class LoginWithGoogleEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

final class LoginWithUsernamePasswordEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}
