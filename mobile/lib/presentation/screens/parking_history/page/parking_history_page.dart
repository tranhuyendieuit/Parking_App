import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/presentation/screens/parking_history/bloc/parking_history_bloc.dart';
import 'package:mobile/presentation/screens/parking_history/bloc/parking_history_event.dart';
import 'package:mobile/presentation/screens/parking_history/page/parking_history_body.dart';

class ParkingHistoryPage extends StatelessWidget {
  const ParkingHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vehiclePlateNumber = ModalRoute.of(context)?.settings.arguments as String?;

    return BlocProvider<ParkingHistoryBloc>(
      create: (_) => ParkingHistoryBloc()..add(const ParkingHistoryInitialEvent()),
      child: ParkingHistoryBody(vehiclePlateNumber: vehiclePlateNumber),
    );
  }
}
