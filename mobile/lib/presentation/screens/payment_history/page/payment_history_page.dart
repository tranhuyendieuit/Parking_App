import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import 'payment_history_body.dart';

class PaymentHistoryPage extends StatefulWidget {
  const PaymentHistoryPage({super.key});

  @override
  State<PaymentHistoryPage> createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends State<PaymentHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentHistoryBloc>(
      create: (context) => PaymentHistoryBloc()..add(const PaymentHistoryInitialEvent()),
      child: const PaymentHistoryBody(),
    );
  }
}
