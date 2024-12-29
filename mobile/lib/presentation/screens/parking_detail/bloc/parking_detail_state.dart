import 'package:equatable/equatable.dart';
import 'package:mobile/data/models/parking_model.dart';

enum ParkingDetailStatus { initial, processing, success, failure }

final class ParkingDetailState extends Equatable {
  final ParkingDetailStatus status;
  final ParkingModel? parkingDetail;

  const ParkingDetailState({
    required this.status,
    this.parkingDetail,
  });

  factory ParkingDetailState.initial() => const ParkingDetailState(
        status: ParkingDetailStatus.initial,
      );

  ParkingDetailState copyWith({
    ParkingDetailStatus? status,
    ParkingModel? parkingDetail,
  }) {
    return ParkingDetailState(
      status: status ?? this.status,
      parkingDetail: parkingDetail ?? this.parkingDetail,
    );
  }

  @override
  List<Object?> get props => [
        status,
        parkingDetail,
      ];
}
