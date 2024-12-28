import 'package:equatable/equatable.dart';

class CheckParkModel extends Equatable {
  final String id;
  final DateTime checkIn;
  final DateTime checkOut;
  final String vehicle;

  const CheckParkModel({
    required this.id,
    required this.checkIn,
    required this.checkOut,
    required this.vehicle,
  });
  CheckParkModel copyWith({
    String? id,
    DateTime? checkIn,
    DateTime? checkOut,
    String? vehicle,
  }) {
    return CheckParkModel(
      id: id ?? this.id,
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
      vehicle: vehicle ?? this.vehicle,
    );
  }

  @override
  List<Object?> get props => [id, checkIn, checkOut, vehicle];
}
