import 'package:equatable/equatable.dart';

sealed class ParkingListEvent extends Equatable {
  const ParkingListEvent();
}

final class ParkingListInitialEvent extends ParkingListEvent {
  const ParkingListInitialEvent();

  @override
  List<Object?> get props => [];
}
