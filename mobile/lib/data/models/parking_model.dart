import 'package:equatable/equatable.dart';

class ParkingModel extends Equatable {
  final String id;
  final String? address;
  final String? province;
  final String? district;
  final String? commune;
  final int? capacity;
  final int? occupation;

  const ParkingModel({
    required this.id,
    this.address,
    this.province,
    this.district,
    this.commune,
    this.capacity,
    this.occupation,
  });
  ParkingModel copyWith({
    String? id,
    String? address,
    String? province,
    String? district,
    String? commune,
    int? capacity,
    int? occupation,
  }) {
    return ParkingModel(
      id: id ?? this.id,
      address: address ?? this.address,
      province: province ?? this.province,
      district: district ?? this.district,
      commune: commune ?? this.commune,
      capacity: capacity ?? this.capacity,
      occupation: occupation ?? this.occupation,
    );
  }

  factory ParkingModel.fromJson(Map<String, dynamic> json) {
    return ParkingModel(
      id: json['parking_id'] ?? '',
      address: json['address'] ?? '',
      province: json['province'] ?? '',
      district: json['district'] ?? '',
      commune: json['commune'] ?? '',
      capacity: json['capacity'] ?? 0,
      occupation: json['occupation'] ?? 0,
    );
  }

  @override
  List<Object?> get props => [id, address, province, district, commune, capacity, occupation];
}
