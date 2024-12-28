import 'package:equatable/equatable.dart';

enum QrAction { checkIn, checkOut }

abstract class QrScanState extends Equatable {
  @override
  List<Object> get props => [];
}

class QrScanInitial extends QrScanState {}

class QrScanLoading extends QrScanState {}

class QrScanSuccess extends QrScanState {
  final String message;

  QrScanSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class QrScanFailure extends QrScanState {
  final String error;

  QrScanFailure(this.error);

  @override
  List<Object> get props => [error];
}

class QrCodeCaptured extends QrScanState {
  final String qrCode;
  final QrAction action;

  QrCodeCaptured(this.qrCode, this.action);

  @override
  List<Object> get props => [qrCode, action];
}
