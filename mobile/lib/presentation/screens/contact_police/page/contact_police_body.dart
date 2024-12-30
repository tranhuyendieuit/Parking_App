import 'package:flutter/material.dart';
import 'package:mobile/config/themes/app_colors.dart';
import 'package:mobile/config/themes/app_text_styles.dart';
import 'package:mobile/constants/constants.dart';
import 'package:mobile/data/dummy_data.dart';
import 'package:mobile/presentation/components/app_bar_widget.dart';

class ContactPoliceBody extends StatefulWidget {
  const ContactPoliceBody({super.key});

  @override
  State<ContactPoliceBody> createState() => _ContactPoliceBodyState();
}

class _ContactPoliceBodyState extends State<ContactPoliceBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget(
        title: Constants.contactPolice,
        backgroundColor: AppColors.mountainMeadow,
        iconColor: AppColors.white,
        titleStyle: AppTextStyles.montserratStyle.bold16White,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${Constants.name} ',
                          style: AppTextStyles.montserratStyle.bold12Black,
                        ),
                        TextSpan(
                          text: police.name,
                          style: AppTextStyles.montserratStyle.regular12Black,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${Constants.phone} ',
                          style: AppTextStyles.montserratStyle.bold12Black,
                        ),
                        TextSpan(
                          text: police.phone,
                          style: AppTextStyles.montserratStyle.regular12Black,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${Constants.agency} ',
                          style: AppTextStyles.montserratStyle.bold12Black,
                        ),
                        TextSpan(
                          text: police.agency,
                          style: AppTextStyles.montserratStyle.regular12Black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
