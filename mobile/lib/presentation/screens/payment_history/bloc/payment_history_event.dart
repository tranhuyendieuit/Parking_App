import 'package:equatable/equatable.dart';

sealed class PaymentHistoryEvent extends Equatable {
  const PaymentHistoryEvent();
}

final class PaymentHistoryInitialEvent extends PaymentHistoryEvent {
  const PaymentHistoryInitialEvent();
  @override
  List<Object?> get props => [];
}
