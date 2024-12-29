import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import 'parking_list_body.dart';

class ParkingListPage extends StatelessWidget {
  const ParkingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ParkingListBloc>(
      create: (_) => ParkingListBloc()..add(const ParkingListInitialEvent()),
      child: const ParkingListBody(),
    );
  }
}
