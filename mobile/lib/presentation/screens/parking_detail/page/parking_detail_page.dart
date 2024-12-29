import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/data/models/parking_model.dart';

import '../bloc/bloc.dart';
import 'parking_detail_body.dart';

class ParkingDetailPage extends StatelessWidget {
  const ParkingDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final parkingDetail = ModalRoute.of(context)?.settings.arguments as ParkingModel?;

    return BlocProvider<ParkingDetailBloc>(
      create: (_) => ParkingDetailBloc()..add(ParkingDetailInitialEvent(parkingDetail: parkingDetail)),
      child: const ParkingDetailBody(),
    );
  }
}
