import 'package:equatable/equatable.dart';

sealed class ParkingHistoryEvent extends Equatable {
  const ParkingHistoryEvent();
}

final class ParkingHistoryInitialEvent extends ParkingHistoryEvent {
  const ParkingHistoryInitialEvent();

  @override
  List<Object?> get props => [];
}
