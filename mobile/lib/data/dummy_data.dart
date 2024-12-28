import 'package:mobile/data/models/check_park_model.dart';
import 'package:mobile/data/models/police.dart';
import 'package:mobile/data/models/user_model.dart';

// const User user = User(
//   id: '1',
//   name: 'John Doe',
//   email: 'hBcXg@example.com',
//   password: 'password',
//   vehicle: 'Car',
// );
const Police police = Police(
  id: '1',
  name: 'John Doe',
  phone: '1234567890',
  agency: 'Police',
);

final List<CheckParkModel> checkParks = [
  CheckParkModel(
    id: '1',
    checkIn: DateTime.now(),
    checkOut: DateTime.now(),
    vehicle: '123456',
  ),
  CheckParkModel(
    id: '2',
    checkIn: DateTime.now().subtract(const Duration(days: 2)),
    checkOut: DateTime.now().subtract(const Duration(days: 1)),
    vehicle: '2231414',
  ),
  CheckParkModel(
    id: '3',
    checkIn: DateTime.now(),
    checkOut: DateTime.now(),
    vehicle: '1214141',
  ),
  CheckParkModel(
    id: '4',
    checkIn: DateTime.now(),
    checkOut: DateTime.now(),
    vehicle: '14124124',
  ),
];
