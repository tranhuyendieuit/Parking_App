import 'package:bloc/bloc.dart';
import 'package:mobile/data/repositories/user_repository.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<HomeInitialEvent>(_onHomeInitialEvent);
  }

  final UserRepository userRepository = UserRepository();

  void _onHomeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    // Nếu đã có dữ liệu, không cần gọi API
    if (state.user != null) {
      emit(state.copyWith(status: HomeStatus.success));
      return;
    }

    emit(state.copyWith(status: HomeStatus.processing));
    final result = await userRepository.getUserProfile();

    result.fold(
      (error) {
        emit(state.copyWith(status: HomeStatus.failure));
        print("Error fetching user info: $error");
      },
      (user) {
        emit(state.copyWith(
          status: HomeStatus.success,
          user: user,
        ));
        print("User information: ${user.toJson()}");
      },
    );
  }
}
