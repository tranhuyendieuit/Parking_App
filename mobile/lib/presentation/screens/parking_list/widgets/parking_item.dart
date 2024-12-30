import 'package:flutter/material.dart';
import 'package:mobile/config/themes/app_text_styles.dart';
import 'package:mobile/data/models/parking_model.dart';

class ParkingItem extends StatelessWidget {
  final ParkingModel item;
  final VoidCallback? onTap;

  const ParkingItem({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 8,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.address ?? '',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.montserratStyle.bold12Black,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Capacity: ${item.capacity ?? 0}',
                      style: AppTextStyles.montserratStyle.regular12Black,
                    )
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
