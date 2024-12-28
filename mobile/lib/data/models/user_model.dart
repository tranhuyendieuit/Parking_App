import 'package:mobile/data/models/vehicle_model.dart';

class UserModel {
  final String? userId;
  final String? username;
  final String? password;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final List<Vehicles>? vehicles; 

  UserModel({
    this.userId,
    this.username,
    this.password,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.vehicles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'] is String ? json['user_id'] : '',
      email: json['email'] is String ? json['email'] : '',
      username: json['user_name'] is String ? json['user_name'] : '',
      password: json['password'] is String ? json['password'] : '',
      firstName: json['first_name'] is String ? json['first_name'] : '',
      lastName: json['last_name'] is String ? json['last_name'] : '',
      phoneNumber: json['phone_number'] is String ? json['phone_number'] : '',
      vehicles: json['vehicles'] != null
          ? (json['vehicles'] as List)
              .map((vehicle) => Vehicles.fromJson(vehicle))
              .toList()
          : [],
    );
  }

  UserModel copyWith({
    String? userId,
    String? email,
    String? username,
    String? password,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    List<Vehicles>? vehicles,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      vehicles: vehicles ?? this.vehicles,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'user_name': username,
      'password': password,
      'vehicles': vehicles?.map((v) => v.toJson()).toList(),
    };
  }

  Map<String, dynamic> editUserToJson() {
    return {
      'user_id': userId,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'vehicles': vehicles?.map((v) => v.toJson()).toList(),
    };
  }
}
