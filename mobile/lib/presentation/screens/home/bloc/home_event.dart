import 'package:equatable/equatable.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

final class HomeInitialEvent extends HomeEvent {

  const HomeInitialEvent();

  @override
  List<Object?> get props => [];
}

