import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/data/models/parking_history_model.dart';
import '../../constants/api_url.dart';

import '../services/api_service.dart';

class ParkingHistoryRepository {
  final ApiService _apiService = ApiService();

  Future<Either<String, List<ParkingHistoryModel>>> getParkingHistory() async {
    try {
      final response = await _apiService.request(
        ApiUrls.trackingEndpoint,
        method: Method.post,
        data: {"keyword": "string", "page": 0, "page_size": 20, "type": 0},
      );
      if (response.data != null) {
        final parkingHistory = List<ParkingHistoryModel>.from(response
            .data['data']['data_list']
            .map((x) => ParkingHistoryModel.fromJson(x)));

        return Right(parkingHistory);
      } else {
        return const Left("Not found");
      }
    } catch (e) {
      if (kDebugMode) {
        print(" $e");
      }

      return Left(e.toString());
    }
  }
}
