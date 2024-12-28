import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/data/repositories/checking_repository.dart';
import 'package:mobile/presentation/screens/qr_scan/bloc/qr_scan_event.dart';
import 'package:mobile/presentation/screens/qr_scan/bloc/qr_scan_state.dart';

class QrScanBloc extends Bloc<QrScanEvent, QrScanState> {
  final QrScanRepository repository;
  String? lastQrCode;
  QrAction currentAction = QrAction.checkIn;

  QrScanBloc(this.repository) : super(QrScanInitial()) {
    on<QrCodeScanned>(_onQrCodeScanned);
    on<ValidateQrCodeEvent>(_onValidateQrCode);
  }

  Future<void> _onQrCodeScanned(
      QrCodeScanned event, Emitter<QrScanState> emit) async {
    lastQrCode = event.qrCode;
    emit(QrCodeCaptured(event.qrCode, currentAction));
  }

  Future<void> _onValidateQrCode(
      ValidateQrCodeEvent event, Emitter<QrScanState> emit) async {
    if (lastQrCode == null) {
      emit(QrScanFailure("No QR code scanned yet!"));
      return;
    }
    emit(QrScanLoading());
    try {
      final result = await repository.checkIn(lastQrCode!);
      result.fold(
        (failure) {
          emit(QrScanFailure(failure));
        },
        (data) {
          final checkType = data['check_type'];

          emit(QrScanSuccess(
            message: checkType == 'CHECK_IN'
                ? 'Check in successful.'
                : 'Check out successful.',
          ));
          currentAction =
              checkType == 'CHECK_IN' ? QrAction.checkOut : QrAction.checkIn;
        },
      );
    } catch (e) {
      emit(QrScanFailure(e.toString()));
    }
  }
}
