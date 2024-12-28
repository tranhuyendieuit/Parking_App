import 'package:flutter/material.dart';
import 'package:mobile/config/themes/app_colors.dart';
import 'package:mobile/config/themes/app_text_styles.dart';
import 'package:mobile/presentation/components/app_bar_widget.dart';
import 'package:mobile/presentation/screens/payment_history/widget/payment_card.dart';

class PaymentHistoryBody extends StatefulWidget {
  const PaymentHistoryBody({super.key});

  @override
  State<PaymentHistoryBody> createState() => _PaymentHistoryBodyState();
}

class _PaymentHistoryBodyState extends State<PaymentHistoryBody> {
  final List<Map<String, dynamic>> bills = [
    {
      'company': 'KenGen Power',
      'id': '846594',
      'autoPayDate': '24th May 18',
      "parking_area_address":
          "Khu Đô thị Đại học Đà Nẵng, Phường Hòa Quý, Quận Ngũ Hành Sơn, thành phố Đà Nẵng",
      "start_date": "16/12/2024 00:00:00",
      "end_date": "16/01/2025 23:59:59",
      'amount': 1248.00,
      'dueDays': 3,
      'logoUrl': 'https://via.placeholder.com/50', // URL của logo
    },
    {
      'company': 'Water Company',
      'id': '789456',
      'autoPayDate': '25th May 18',
      "parking_area_address":
          "Khu Đô thị Đại học Đà Nẵng, Phường Hòa Quý, Quận Ngũ Hành Sơn, thành phố Đà Nẵng",
      "start_date": "16/12/2024 00:00:00",
      "end_date": "16/01/2025 23:59:59",
      'amount': 300.50,
      'dueDays': 5,
      'logoUrl': 'https://via.placeholder.com/50', // URL của logo
    },
    {
      'company': 'Internet Provider',
      'id': '123456',
      'autoPayDate': '26th May 18',
      "parking_area_address":
          "Khu Đô thị Đại học Đà Nẵng, Phường Hòa Quý, Quận Ngũ Hành Sơn, thành phố Đà Nẵng",
      "start_date": "16/12/2024 00:00:00",
      "end_date": "16/01/2025 23:59:59",
      'amount': 600.00,
      'dueDays': 7,
      'logoUrl': 'https://via.placeholder.com/50', // URL của logo
    },
  ];

  @override
  Widget build(BuildContext context) {
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
            height: 100,
            decoration: const BoxDecoration(
              color: AppColors.mountainMeadow,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Total Balance: \$1234.56',
                    style: AppTextStyles.montserratStyle.bold14White)
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: bills.length, // Số lượng hóa đơn từ danh sách
              itemBuilder: (context, index) {
                return PaymentCard(
                  bill: bills[index], // Truyền từng hóa đơn vào PaymentCard
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
