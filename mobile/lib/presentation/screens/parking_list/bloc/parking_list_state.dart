import 'package:equatable/equatable.dart';
import 'package:mobile/data/models/parking_model.dart';

enum ParkingListStatus { initial, processing, success, failure }

final class ParkingListState extends Equatable {
  final ParkingListStatus status;
  final List<ParkingModel> parkingList;

  const ParkingListState({
    required this.status,
    required this.parkingList,
  });

  factory ParkingListState.initial() => const ParkingListState(
        status: ParkingListStatus.initial,
        parkingList: [],
      );

  ParkingListState copyWith({
    ParkingListStatus? status,
    List<ParkingModel>? parkingList,
  }) {
    return ParkingListState(
      status: status ?? this.status,
      parkingList: parkingList ?? this.parkingList,
    );
  }

  @override
  List<Object?> get props => [
        status,
        parkingList,
      ];
}
