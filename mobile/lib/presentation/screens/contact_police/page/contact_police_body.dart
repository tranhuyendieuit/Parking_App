import 'package:flutter/material.dart';
import 'package:mobile/config/themes/app_colors.dart';
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
      appBar: const AppBarWidget(
        title: Constants.contactPolice,
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
                  Text(
                    '${Constants.name} ${police.name}',
                  ),
                  Text(
                    '${Constants.phone} ${police.phone}',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '${Constants.agency} ${police.agency}',
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
