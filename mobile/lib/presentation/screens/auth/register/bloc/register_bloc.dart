import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/data/models/register_model.dart';
import 'package:mobile/data/models/user_model.dart';
import 'package:mobile/data/repositories/auth_repository.dart';
import 'package:mobile/presentation/screens/auth/register/bloc/register_event.dart';
import 'package:mobile/presentation/screens/auth/register/bloc/register_state.dart';
import 'package:mobile/utils/format_time.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState.initial()) {
    on<RegisterWithUsernameEvent>(_onRegisterWithUsernameEvent);
    on<RegisterChangeEmailPasswordEvent>(_onRegisterChangeEmailPasswordEvent);
  }

  void _onRegisterWithUsernameEvent(
      RegisterWithUsernameEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(status: RegisterStatus.processing));
    final registerModel = RegisterModel(
      password: state.password,
      username: state.username,
      firstName: state.firstName,
      lastName: state.lastName,
      phoneNumber: state.phoneNumber,
      vehicleBrand: state.vehicleBrand,
      vehicleModel: state.vehicleModel,
      plateNumber: state.vehiclePlate,
      registerDate: DateTime.now().formatDate(),
    );
    final result = await AuthRepository().register(registerModel);

    result.fold(
      (error) {
        emit(state.copyWith(
          status: RegisterStatus.failure,
          errormessage: error,
        ));
      },
      (response) {
        emit(state.copyWith(status: RegisterStatus.success));
      },
    );
  }

  void _onRegisterChangeEmailPasswordEvent(
      RegisterChangeEmailPasswordEvent event, Emitter<RegisterState> emit) {
    emit(
      state.copyWith(
        email: event.username,
        password: event.password,
        username: event.username,
        confirmPassword: event.password,
        firstName: event.firstName,
        lastName: event.lastName,
        phoneNumber: event.phoneNumber,
        vehicleBrand: event.vehicleBrand,
        vehicleModel: event.vehicleModel,
        vehiclePlate: event.vehiclePlate,
      ),
    );
    if (state.email.isNotEmpty &&
        state.password.isNotEmpty &&
        state.username.isNotEmpty &&
        state.firstName.isNotEmpty &&
        state.lastName.isNotEmpty &&
        state.phoneNumber.isNotEmpty &&
        state.vehicleBrand.isNotEmpty &&
        state.vehicleModel.isNotEmpty &&
        state.vehiclePlate.isNotEmpty) {
      emit(state.copyWith(isEnabled: true));
    }
  }
}
