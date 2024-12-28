import 'package:equatable/equatable.dart';
import 'package:mobile/data/models/user_model.dart';

enum ProfileStatus {
  initial,
  processing,
  success,
  failure,
}

final class ProfileState extends Equatable {
  final ProfileStatus status;
  final UserModel? user;

  const ProfileState({
    required this.status,
    this.user,
  });

  static ProfileState initial() => const ProfileState(
        status: ProfileStatus.initial,
        user: null,
      );

  ProfileState copyWith({
    ProfileStatus? status,
    UserModel? user,
  }) {
    return ProfileState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
        status,
        user,
      ];
}
