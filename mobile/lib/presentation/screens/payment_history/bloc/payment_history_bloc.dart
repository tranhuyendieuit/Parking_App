import 'package:bloc/bloc.dart';
import 'package:mobile/data/repositories/payment_repository.dart';
import 'package:mobile/presentation/screens/payment_history/bloc/payment_history_event.dart';
import 'package:mobile/presentation/screens/payment_history/bloc/payment_history_state.dart';

class PaymentHistoryBloc extends Bloc<PaymentHistoryEvent, PaymentHistoryState> {
  PaymentHistoryBloc() : super(PaymentHistoryState.initial()) {
    on<PaymentHistoryInitialEvent>(_onPaymentHistoryInitialEvent);
  }

  final PaymentRepository paymentRepository = PaymentRepository();

  void _onPaymentHistoryInitialEvent(PaymentHistoryInitialEvent event, Emitter<PaymentHistoryState> emit) async {
    emit(state.copyWith(status: PaymentHistoryStatus.processing));
    final result = await paymentRepository.getPayments();

    result.fold(
      (error) {
        emit(state.copyWith(status: PaymentHistoryStatus.failure));
      },
      (payments) {
        emit(state.copyWith(
          status: PaymentHistoryStatus.success,
          payments: payments,
        ));
      },
    );
  }
}
