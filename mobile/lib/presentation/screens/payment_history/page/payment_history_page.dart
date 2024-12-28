import 'package:flutter/material.dart';
import 'package:mobile/presentation/screens/payment_history/page/payment_history_body.dart';

class PaymentHistoryPage extends StatefulWidget {
  const PaymentHistoryPage({super.key});

  @override
  State<PaymentHistoryPage> createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends State<PaymentHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return const PaymentHistoryBody();
  }
}