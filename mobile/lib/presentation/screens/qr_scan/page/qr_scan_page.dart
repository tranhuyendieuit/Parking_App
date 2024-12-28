import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/data/repositories/checking_repository.dart';
import 'package:mobile/presentation/screens/qr_scan/bloc/qr_scan_bloc.dart';
import 'package:mobile/presentation/screens/qr_scan/page/qr_scan_body.dart';

class QrScanPage extends StatelessWidget {
  const QrScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QrScanBloc(QrScanRepository()),
      child: const QrScanBody(),
    );
  }
}
