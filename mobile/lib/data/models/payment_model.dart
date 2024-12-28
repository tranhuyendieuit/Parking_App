import 'package:equatable/equatable.dart';

class PaymentModel extends Equatable {
  final String id;
  final double fare;
  final int type;
  final String name;
  final bool isActive;
  final String startDate;
  final String endDate;
  final double prices;
  final String vehicleUser;
  final String plateNumber;
  final String parkingAreaUser;
  final String parkingAreaAddress;

  const PaymentModel({
    required this.id,
    required this.fare,
    required this.type,
    required this.name,
    required this.isActive,
    required this.startDate,
    required this.endDate,
    required this.prices,
    required this.vehicleUser,
    required this.plateNumber,
    required this.parkingAreaUser,
    required this.parkingAreaAddress,
  });
  PaymentModel copyWith({
    String? id,
    double? fare,
    int? type,
    String? name,
    bool? isActive,
    String? startDate,
    String? endDate,
    double? prices,
    String? vehicleUser,
    String? plateNumber,
    String? parkingAreaUser,
    String? parkingAreaAddress,
  }) {
    return PaymentModel(
      id: id ?? this.id,
      fare: fare ?? this.fare,
      type: type ?? this.type,
      name: name ?? this.name,
      isActive: isActive ?? this.isActive,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      prices: prices ?? this.prices,
      vehicleUser: vehicleUser ?? this.vehicleUser,
      plateNumber: plateNumber ?? this.plateNumber,
      parkingAreaUser: parkingAreaUser ?? this.parkingAreaUser,
      parkingAreaAddress: parkingAreaAddress ?? this.parkingAreaAddress,
    );
  }

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id'],
      fare: json['fare'],
      type: json['type'],
      name: json['name'],
      isActive: json['is_active'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      prices: json['prices'],
      vehicleUser: json['vehicle_user'],
      plateNumber: json['plate_number'],
      parkingAreaUser: json['parking_area_user'],
      parkingAreaAddress: json['parking_area_address'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        vehicleUser,
        plateNumber,
        parkingAreaUser,
        parkingAreaAddress,
        fare,
        type,
        name,
        isActive,
        startDate,
        endDate,
        prices
      ];
}
