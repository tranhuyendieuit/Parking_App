import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mobile/config/themes/app_colors.dart';
import 'package:mobile/config/themes/app_text_styles.dart';
import 'package:mobile/presentation/components/app_bar_widget.dart';
import 'package:mobile/presentation/screens/payment_history/widget/payment_card.dart';

import '../bloc/bloc.dart';

class PaymentHistoryBody extends StatefulWidget {
  const PaymentHistoryBody({super.key});

  @override
  State<PaymentHistoryBody> createState() => _PaymentHistoryBodyState();
}

class _PaymentHistoryBodyState extends State<PaymentHistoryBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentHistoryBloc, PaymentHistoryState>(
      listener: (context, state) {
        state.status == PaymentHistoryStatus.processing ? EasyLoading.show() : EasyLoading.dismiss();
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBarWidget(
            title: 'Payment History',
            backgroundColor: AppColors.mountainMeadow,
            iconColor: AppColors.white,
            titleStyle: AppTextStyles.montserratStyle.bold16White,
          ),
          body: Column(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.mountainMeadow,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                ),
                child: Center(
                  child: Text(
                    'Total Balance: \$${state.totalBalance}',
                    style: AppTextStyles.montserratStyle.bold14White,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: state.payments.length,
                  itemBuilder: (context, index) {
                    return PaymentCard(
                      payment: state.payments[index],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
