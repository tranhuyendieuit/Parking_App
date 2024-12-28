import 'package:bloc/bloc.dart';
import 'package:mobile/data/repositories/user_repository.dart';
import 'package:mobile/presentation/screens/profile/bloc/profile_event.dart';
import 'package:mobile/presentation/screens/profile/bloc/profile_state.dart';

class HomeBloc extends Bloc<ProfileEvent, ProfileState> {
  HomeBloc() : super(ProfileState.initial()) {
    on<ProfileInitialEvent>(_onProfileInitialEvent);
  }

  final UserRepository userRepository = UserRepository();

  void _onProfileInitialEvent(
      ProfileInitialEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(status: ProfileStatus.processing));
    final result = await userRepository.getUserProfile();

    result.fold(
      (error) {
        emit(state.copyWith(status: ProfileStatus.failure));
        print("Error fetching user info: $error");
      },
      (user) {
        emit(state.copyWith(
          status: ProfileStatus.success,
          user: user,
        ));
        print("User information: ${user.toJson()}");
      },
    );
  }
}
