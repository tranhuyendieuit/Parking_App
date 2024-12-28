import 'package:mobile/data/models/user_model.dart';

class QrCodeModel {
  final UserModel? userModel;
  final String? qrCode;

  QrCodeModel({
    this.userModel,
    this.qrCode,
  });

  factory QrCodeModel.fromJson(Map<String, dynamic> json) {
    return QrCodeModel(
      userModel: UserModel.fromJson(json['user']),
      qrCode: json['qr_code'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': userModel?.toJson(),
      'qr_code': qrCode,
    };
  }
}
