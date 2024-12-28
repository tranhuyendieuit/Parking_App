import 'package:equatable/equatable.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();
}

final class RegisterInitialEvent extends RegisterEvent {
  @override
  List<Object?> get props => [];
}

final class RegisterChangeEmailPasswordEvent extends RegisterEvent {
  final String? username;
  final String? password;
  final String? confirmPassword;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? vehicleBrand;
  final String? vehicleModel;
  final String? vehiclePlate;

  const RegisterChangeEmailPasswordEvent(
      {this.username,
      this.password,
      this.confirmPassword,
      this.email,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.vehicleBrand,
      this.vehicleModel,
      this.vehiclePlate});
  @override
  List<Object?> get props => [username, password];
}

final class RegisterWithUsernameEvent extends RegisterEvent {
  @override
  List<Object?> get props => [];
}
