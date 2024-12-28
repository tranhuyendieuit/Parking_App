import 'package:mobile/data/models/vehicle_model.dart';

class RegisterModel {
  final String? userId;
  final String? username;
  final String? password;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? plateNumber;
  final String? vehicleBrand;
  final String? vehicleModel;
  final String? registerDate;

  RegisterModel({
    this.userId,
    this.username,
    this.password,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.plateNumber,
    this.vehicleBrand,
    this.vehicleModel,
    this.registerDate,
  });

  RegisterModel copyWith({
    String? userId,
    String? email,
    String? username,
    String? password,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? plateNumber,
    String? vehicleBrand,
    String? vehicleModel,
    String? registerDate,
  }) {
    return RegisterModel(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      plateNumber: plateNumber ?? this.plateNumber,
      vehicleBrand: vehicleBrand ?? this.vehicleBrand,
      vehicleModel: vehicleModel ?? this.vehicleModel,
      registerDate: registerDate ?? this.registerDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'user_name': username,
      'password': password,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'plate_number': plateNumber,
      'vehicle_brand': vehicleBrand,
      'vehicle_model': vehicleModel,
      'register_date': registerDate
    };
  }

}
