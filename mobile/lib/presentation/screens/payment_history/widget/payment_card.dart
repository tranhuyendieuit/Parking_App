import 'package:flutter/material.dart';
import 'package:mobile/config/themes/app_text_styles.dart';

class PaymentCard extends StatelessWidget {
  final Map<String, dynamic> bill;

  const PaymentCard({required this.bill, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange[100],
                      ),
                      child: Image.network(
                        bill['logoUrl'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bill['company'],
                          style: AppTextStyles.montserratStyle.bold14Black,
                        ),
                        Text(
                          'Plate number: ${bill['id']}',
                          style: AppTextStyles.montserratStyle.medium12Gray,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '\$${bill['amount'].toStringAsFixed(2)}',
                  style: AppTextStyles.montserratStyle.bold12Black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
