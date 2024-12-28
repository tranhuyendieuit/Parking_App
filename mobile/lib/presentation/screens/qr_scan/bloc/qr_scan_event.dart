import 'package:equatable/equatable.dart';

abstract class QrScanEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class QrCodeScanned extends QrScanEvent {
  final String qrCode;

  QrCodeScanned(this.qrCode);

  @override
  List<Object> get props => [qrCode];
}

class ValidateQrCodeEvent extends QrScanEvent {}
