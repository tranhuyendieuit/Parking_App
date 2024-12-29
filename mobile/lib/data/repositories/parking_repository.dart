import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/data/models/parking_history_model.dart';
import 'package:mobile/data/models/parking_model.dart';
import '../../constants/api_url.dart';

import '../services/api_service.dart';

class ParkingRepository {
  final ApiService _apiService = ApiService();

  Future<Either<String, List<ParkingHistoryModel>>> getParkingHistory() async {
    try {
      final response = await _apiService.request(
        ApiUrls.trackingEndpoint,
        method: Method.post,
        data: {"keyword": "string", "page": 0, "page_size": 100, "type": 0},
      );
      if (response.data != null) {
        final parkingHistory =
            (response.data['data']['data_list'] as List? ?? []).map((e) => ParkingHistoryModel.fromJson(e)).toList();

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

  Future<Either<String, List<ParkingModel>>> getParkingList() async {
    try {
      final response = await _apiService.request(
        ApiUrls.parkingListEndpoint,
        method: Method.get,
      );
      if (response.data != null) {
        final parkingList =
            (response.data['data']['data_list'] as List? ?? []).map((e) => ParkingModel.fromJson(e)).toList();

        return Right(parkingList);
      }
      return const Left("Not found");
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, ParkingModel>> getParkingDetail(String id) async {
    try {
      final response = await _apiService.request(
        ApiUrls.parkingDetailEndpoint.replaceAll("{}", id),
        method: Method.get,
      );
      if (response.data != null) {
        final parkingDetail = ParkingModel.fromJson(response.data['data']);
        return Right(parkingDetail);
      }
      return const Left("Not found");
    } catch (e) {
      return Left(e.toString());
    }
  }
}
