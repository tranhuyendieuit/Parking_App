import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/presentation/screens/home/bloc/home_bloc.dart';
import 'package:mobile/presentation/screens/home/bloc/home_event.dart';
import 'package:mobile/presentation/screens/parking_history/bloc/parking_history_bloc.dart';
import 'package:mobile/presentation/screens/parking_history/bloc/parking_history_event.dart';
import 'package:mobile/presentation/screens/parking_history/page/parking_history_body.dart';

class ParkingHistoryPage extends StatelessWidget {
  const ParkingHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              ParkingHistoryBloc()..add(const ParkingHistoryInitialEvent()),
        ),
        BlocProvider(
          create: (_) => HomeBloc()..add(const HomeInitialEvent()),
        ),
      ],
      child: const ParkingHistoryBody(),
    );
  }
}
