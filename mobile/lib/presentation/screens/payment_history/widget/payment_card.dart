import 'package:flutter/material.dart';
import 'package:mobile/config/themes/app_text_styles.dart';
import 'package:mobile/data/models/payment_model.dart';
import 'package:mobile/utils/format_time.dart';

class PaymentCard extends StatelessWidget {
  final PaymentModel payment;

  const PaymentCard({required this.payment, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        payment.vehicleUser,
                        style: AppTextStyles.montserratStyle.bold14Black,
                      ),
                      Text(
                        'Plate number: ${payment.plateNumber}',
                        style: AppTextStyles.montserratStyle.medium12Gray,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            RichText(
              text: TextSpan(
                text: 'Type: ',
                style: AppTextStyles.montserratStyle.bold12Black,
                children: [TextSpan(text: payment.name, style: AppTextStyles.montserratStyle.regular12Black)],
              ),
            ),
            const SizedBox(height: 4),
            RichText(
              text: TextSpan(
                text: 'Date: ',
                style: AppTextStyles.montserratStyle.bold12Black,
                children: [
                  TextSpan(
                    text: '${payment.startDate.toFormattedDateTime()} - ${payment.endDate.toFormattedDateTime()}',
                    style: AppTextStyles.montserratStyle.regular12Black,
                  )
                ],
              ),
            ),
            const SizedBox(height: 4),
            RichText(
              text: TextSpan(
                text: 'Parking Area: ',
                style: AppTextStyles.montserratStyle.bold12Black,
                children: [
                  TextSpan(
                    text: payment.parkingAreaUser,
                    style: AppTextStyles.montserratStyle.regular12Black,
                  )
                ],
              ),
            ),
            const SizedBox(height: 4),
            RichText(
              text: TextSpan(
                text: 'Address: ',
                style: AppTextStyles.montserratStyle.bold12Black,
                children: [
                  TextSpan(
                    text: payment.parkingAreaAddress,
                    style: AppTextStyles.montserratStyle.regular12Black,
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: Text(
                '\$${payment.prices}',
                textAlign: TextAlign.right,
                style: AppTextStyles.montserratStyle.bold14Black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
