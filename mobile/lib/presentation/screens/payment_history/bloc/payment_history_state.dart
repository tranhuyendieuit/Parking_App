import 'package:equatable/equatable.dart';
import 'package:mobile/data/models/payment_model.dart';

enum PaymentHistoryStatus {
  initial,
  processing,
  success,
  failure,
}

final class PaymentHistoryState extends Equatable {
  final PaymentHistoryStatus status;
  final List<PaymentModel> payments;

  const PaymentHistoryState({
    required this.status,
    required this.payments,
  });

  factory PaymentHistoryState.initial() => const PaymentHistoryState(
        status: PaymentHistoryStatus.initial,
        payments: [],
      );

  PaymentHistoryState copyWith({
    PaymentHistoryStatus? status,
    List<PaymentModel>? payments,
  }) {
    return PaymentHistoryState(
      status: status ?? this.status,
      payments: payments ?? this.payments,
    );
  }

  @override
  List<Object?> get props => [
        status,
        payments,
      ];

  double get totalBalance {
    return payments.isEmpty ? 0 : payments.map((e) => e.prices).reduce((value, element) => value + element);
  }
}
