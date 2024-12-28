import 'package:equatable/equatable.dart';

enum RegisterStatus { initial, processing, success, failure }

final class RegisterState extends Equatable {
  final RegisterStatus status;
  final String errormessage;
  final bool isVisable;
  final bool isEnabled;
  final String username;
  final String password;
  final String confirmPassword;
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String vehicleBrand;
  final String vehicleModel;
  final String vehiclePlate;
  final String messageInputEmail;
  final String messageInputPassword;
  final bool isShowEmailMessage;
  final bool isShowPasswordMessage;

  const RegisterState(
      {required this.status,
      this.errormessage = '',
      this.isVisable = false,
      this.isEnabled = false,
      this.username = '',
      this.password = '',
      this.confirmPassword = '',
      this.email = '',
      this.firstName = '',
      this.lastName = '',
      this.phoneNumber = '',
      this.vehicleBrand = '',
      this.vehicleModel = '',
      this.vehiclePlate = '',
      this.messageInputEmail = '',
      this.messageInputPassword = '',
      this.isShowEmailMessage = false,
      this.isShowPasswordMessage = false});

  static RegisterState initial() => const RegisterState(
        status: RegisterStatus.initial,
        isVisable: false,
        isEnabled: false,
        username: '',
        password: '',
        confirmPassword: '',
        email: '',
        firstName: '',
        lastName: '',
        phoneNumber: '',
        vehicleBrand: '',
        vehicleModel: '',
        vehiclePlate: '',
        messageInputEmail: '',
        messageInputPassword: '',
        isShowEmailMessage: false,
        isShowPasswordMessage: false,
      );
  RegisterState copyWith({
    RegisterStatus? status,
    String? errormessage,
    bool? isVisable,
    bool? isEnabled,
    String? username,
    String? email,
    String? password,
    String? confirmPassword,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? vehicleBrand,
    String? vehicleModel,
    String? vehiclePlate,
    String? googleAccount,
    String? messageInputEmail,
    String? messageInputPassword,
    bool? isShowEmailMessage,
    bool? isShowPasswordMessage,
  }) {
    return RegisterState(
        status: status ?? this.status,
        errormessage: errormessage ?? this.errormessage,
        isVisable: isVisable ?? this.isVisable,
        isEnabled: isEnabled ?? this.isEnabled,
        username: username ?? this.username,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        vehicleBrand: vehicleBrand ?? this.vehicleBrand,
        vehicleModel: vehicleModel ?? this.vehicleModel,
        vehiclePlate: vehiclePlate ?? this.vehiclePlate,
        messageInputEmail: messageInputEmail ?? this.messageInputEmail,
        messageInputPassword: messageInputPassword ?? this.messageInputPassword,
        isShowEmailMessage: isShowEmailMessage ?? this.isShowEmailMessage,
        isShowPasswordMessage:
            isShowPasswordMessage ?? this.isShowPasswordMessage);
  }

  @override
  List<Object?> get props => [
        status,
        errormessage,
        isEnabled,
        isVisable,
        username,
        password,
        confirmPassword,
        email,
        firstName,
        lastName,
        phoneNumber,
        vehicleBrand,
        vehicleModel,
        vehiclePlate,
        messageInputEmail,
        messageInputPassword,
        isShowEmailMessage,
        isShowPasswordMessage
      ];
}
