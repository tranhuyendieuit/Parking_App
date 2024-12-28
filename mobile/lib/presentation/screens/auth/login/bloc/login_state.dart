import 'package:equatable/equatable.dart';

enum LoginStatus { initial, processing, success, failure }

final class LoginState extends Equatable {
  final LoginStatus status;
  final String errormessage;
  final bool isVisable;
  final bool isEnabled;
  final String username;
  final String password;
  final String googleAccount;
  final String messageInputEmail;
  final String messageInputPassword;
  final bool isShowEmailMessage;
  final bool isShowPasswordMessage;

  const LoginState(
      {required this.status,
      this.errormessage = '',
      this.isVisable = false,
      this.isEnabled = false,
      this.username = '',
      this.password = '',
      this.googleAccount = '',
      this.messageInputEmail = '',
      this.messageInputPassword = '',
      this.isShowEmailMessage = false,
      this.isShowPasswordMessage = false});

  static LoginState initial() => const LoginState(
        status: LoginStatus.initial,
        isVisable: false,
        isEnabled: false,
        username: '',
        password: '',
        googleAccount: '',
        messageInputEmail: '',
        messageInputPassword: '',
        isShowEmailMessage: false,
        isShowPasswordMessage: false,
      );
  LoginState copyWith({
    LoginStatus? status,
    String? errormessage,
    bool? isVisable,
    bool? isEnabled,
    String? email,
    String? password,
    String? googleAccount,
    String? messageInputEmail,
    String? messageInputPassword,
    bool? isShowEmailMessage,
    bool? isShowPasswordMessage,
  }) {
    return LoginState(
        status: status ?? this.status,
        errormessage: errormessage ?? this.errormessage,
        isVisable: isVisable ?? this.isVisable,
        isEnabled: isEnabled ?? this.isEnabled,
        username: email ?? this.username,
        password: password ?? this.password,
        googleAccount: googleAccount ?? this.googleAccount,
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
        googleAccount,
        messageInputEmail,
        messageInputPassword,
        isShowEmailMessage,
        isShowPasswordMessage
      ];
}
