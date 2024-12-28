import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/data/models/payment_model.dart';
import '../../constants/api_url.dart';

import '../services/api_service.dart';

class PaymentRepository {
  final ApiService _apiService = ApiService();

  Future<Either<String, List<PaymentModel>>> getPayments() async {
    try {
      final response = await _apiService.request(
        ApiUrls.paymentHistoryEndpoint,
        method: Method.post,
        data: {"keyword": "", "page": 0, "page_size": 1000, "type": 0},
      );
      if (response.data != null) {
        final payments =
            (response.data['data']['data_list'] as List? ?? []).map((e) => PaymentModel.fromJson(e)).toList();

        return Right(payments);
      } else {
        return const Left("Not found");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching payment: $e");
      }

      return Left(e.toString());
    }
  }
}
