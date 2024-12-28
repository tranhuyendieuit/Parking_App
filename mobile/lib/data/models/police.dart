import 'package:equatable/equatable.dart';

class Police extends Equatable {
  final String id;
  final String name;
  final String phone;
  final String agency;

  const Police(
      {required this.id,
      required this.name,
      required this.phone,
      required this.agency});
  Police copyWith({
    String? id,
    String? name,
    String? phone,
    String? agency,
  }) {
    return Police(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      agency: this.agency,
    );
  }

  factory Police.fromJson(Map<String, dynamic> json) {
    return Police(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        agency: json['agency']);
  }

  @override
  List<Object?> get props => [id, name, phone, agency];
}
