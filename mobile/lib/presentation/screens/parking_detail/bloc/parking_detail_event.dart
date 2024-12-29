import 'package:equatable/equatable.dart';
import 'package:mobile/data/models/parking_model.dart';

sealed class ParkingDetailEvent extends Equatable {
  const ParkingDetailEvent();
}

final class ParkingDetailInitialEvent extends ParkingDetailEvent {
  final ParkingModel? parkingDetail;

  const ParkingDetailInitialEvent({this.parkingDetail});

  @override
  List<Object?> get props => [];
}
