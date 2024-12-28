import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/config/themes/app_colors.dart';
import 'package:mobile/config/themes/app_text_styles.dart';
import 'package:mobile/constants/constants.dart';
import 'package:mobile/presentation/components/custom_button.dart';
import 'package:mobile/presentation/screens/qr_scan/bloc/qr_scan_bloc.dart';
import 'package:mobile/presentation/screens/qr_scan/bloc/qr_scan_event.dart';
import 'package:mobile/presentation/screens/qr_scan/bloc/qr_scan_state.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanBody extends StatefulWidget {
  const QrScanBody({super.key});

  @override
  State<QrScanBody> createState() => _QrScanBodyState();
}

class _QrScanBodyState extends State<QrScanBody> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      BlocProvider.of<QrScanBloc>(context).add(QrCodeScanned(scanData.code!));
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          Constants.scanQrCode,
          style: AppTextStyles.montserratStyle.bold16Black,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: AppColors.mountainMeadow,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: SizedBox(
                width: 250,
                height: 50,
                child: BlocConsumer<QrScanBloc, QrScanState>(
                  listener: (context, state) {
                    if (state is QrScanSuccess) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              Constants.success,
                              style: AppTextStyles.montserratStyle.bold12Black,
                            ),
                          ),
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              constraints: const BoxConstraints(
                                maxHeight: 100,
                              ),
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, bottom: 8.0),
                                  child: Text(
                                    state.message,
                                    style: AppTextStyles
                                        .montserratStyle.regular12Black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          contentPadding: EdgeInsets.zero,
                          actionsPadding: const EdgeInsets.only(bottom: 8.0),
                          actions: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  Constants.ok,
                                  style: AppTextStyles
                                      .montserratStyle.bold12MountainMeadow,
                                ),
                              ),
                            ),
                          ],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: Colors
                              .white, 
                        ),
                      );
                    } else if (state is QrScanFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.error)),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is QrScanLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return CustomButton(
                      onTap: () {
                        BlocProvider.of<QrScanBloc>(context)
                            .add(ValidateQrCodeEvent());
                      },
                      text: Constants.validate,
                      textStyle: AppTextStyles.montserratStyle.bold12White,
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
