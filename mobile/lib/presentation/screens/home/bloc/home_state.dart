import 'package:equatable/equatable.dart';
import 'package:mobile/data/models/user_model.dart';

enum HomeStatus {
  initial,
  processing,
  success,
  failure,
}

final class HomeState extends Equatable {
  final HomeStatus status;
  final UserModel? user;

  const HomeState({
    required this.status,
    this.user,
  });

  static HomeState initial() => const HomeState(
        status: HomeStatus.initial,
        user: null,
      );

  HomeState copyWith({
    HomeStatus? status,
    UserModel? user,
  }) {
    return HomeState(
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
