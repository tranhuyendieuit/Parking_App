import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/constants/api_url.dart';
import 'package:mobile/data/services/api_service.dart';

class QrScanRepository {
  final ApiService _apiService = ApiService();

  Future<Either<String, Map<String, String>>> checkIn(
      String parkingAreaId) async {
    final params = {
      'authenticated': '',
      'authorities[0].authority': '',
      'credentials': '{}',
      'details': '{}',
      'principal': '{}',
    };
    try {
      final response = await _apiService.request(
        '${ApiUrls.baseUrl}checking/$parkingAreaId',
        method: Method.get,
        params: params,
      );

      final checkType = response.data['check_type'] ?? 'UNKNOWN';
      final message = response.data['message'] ?? 'Action successful!';

      return Right({'check_type': checkType, 'message': message});
    } catch (e) {
      if (kDebugMode) {
        print("Check-in error: $e");
      }
      return Left(e.toString());
    }
  }
}
