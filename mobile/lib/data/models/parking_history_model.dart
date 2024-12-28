import 'package:equatable/equatable.dart';

class ParkingHistoryModel extends Equatable {
  final String? id;
  final String? checkIn;
  final String? checkOut;

  const ParkingHistoryModel({
     this.id,
     this.checkIn,
     this.checkOut,
  });
  ParkingHistoryModel copyWith({
    String? id,
    String? checkIn,
    String? checkOut,
  }) {
    return ParkingHistoryModel(
      id: id ?? this.id,
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
    );
  }

  factory ParkingHistoryModel.fromJson(Map<String, dynamic> json) {
    return ParkingHistoryModel(
      id: json['parking_id'],
      checkIn:json['check_in_date'],
      checkOut:json['check_out_date'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        checkIn,
        checkOut,
      ];
}
