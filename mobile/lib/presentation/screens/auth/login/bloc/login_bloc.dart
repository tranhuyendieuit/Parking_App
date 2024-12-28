import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/data/models/user_model.dart';
import 'package:mobile/data/repositories/auth_repository.dart';
import 'package:mobile/presentation/screens/auth/login/bloc/login_event.dart';
import 'package:mobile/presentation/screens/auth/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<LoginWithUsernamePasswordEvent>(_onLoginWithUsernamePasswordEvent);
    on<LoginChangeEmailPasswordEvent>(_onLoginChangeUsernamePasswordEvent);
  }

  void _onLoginWithUsernamePasswordEvent(
      LoginWithUsernamePasswordEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStatus.processing));
    final userModel = UserModel(
      password: state.password,
      username: state.username,
    );
    print("User send: ${state.username}| pass send: ${state.password}");

    final result = await AuthRepository().login(userModel);

    result.fold(
      (error) {
        emit(state.copyWith(
          status: LoginStatus.failure,
          errormessage: error,
        ));
        print('Login Error: ${error}');
      },
      (response) {
        emit(state.copyWith(status: LoginStatus.success));
      },
    );
  }

  void _onLoginChangeUsernamePasswordEvent(
      LoginChangeEmailPasswordEvent event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        email: event.username,
        password: event.password,
        isEnabled: event.username.isNotEmpty && event.password.isNotEmpty,
      ),
    );
  }
}
