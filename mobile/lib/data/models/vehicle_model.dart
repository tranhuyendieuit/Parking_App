class Vehicles {
  final String? vehicleId;
  final String? plateNumber;
  final String? vehicleBrand;
  final String? vehicleModel;
  final String? registerDate;

  Vehicles({
    this.vehicleId,
    this.plateNumber,
    this.vehicleBrand,
    this.vehicleModel,
    this.registerDate,
  });

  factory Vehicles.fromJson(Map<String, dynamic> json) {
    return Vehicles(
      vehicleId: json['vehicle_id'] as String?,
      plateNumber: json['plate_number'] as String?,
      vehicleBrand: json['vehicle_brand'] as String?,
      vehicleModel: json['vehicle_model'] as String?,
      registerDate: json['register_date'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vehicle_id': vehicleId,
      'plate_number': plateNumber,
      'vehicle_brand': vehicleBrand,
      'vehicle_model': vehicleModel,
      'register_date': registerDate,
    };
  }
}
