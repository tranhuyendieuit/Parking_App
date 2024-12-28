import 'package:equatable/equatable.dart';
import 'package:mobile/data/models/parking_history_model.dart';

enum ParkingHistoryStatus {
  initial,
  processing,
  success,
  failure,
}

final class ParkingHistoryState extends Equatable {
  final ParkingHistoryStatus status;
  final List<ParkingHistoryModel>? parkingHistory;

  const ParkingHistoryState({
    required this.status,
    this.parkingHistory,
  });

  factory ParkingHistoryState.initial() => const ParkingHistoryState(
        status: ParkingHistoryStatus.initial,
      );

  ParkingHistoryState copyWith({
    ParkingHistoryStatus? status,
    List<ParkingHistoryModel>? parkingHistory,
  }) {
    return ParkingHistoryState(
      status: status ?? this.status,
      parkingHistory: parkingHistory ?? this.parkingHistory,
    );
  }

  @override
  List<Object?> get props => [
        status,
        parkingHistory,
      ];
}
