import 'package:flutter/material.dart';
import 'package:mobile/config/themes/app_colors.dart';
import 'package:mobile/config/themes/app_text_styles.dart';
import 'package:mobile/constants/constants.dart';
import 'package:mobile/presentation/components/app_bar_widget.dart';

class PrivacyPolicyBody extends StatelessWidget {
  const PrivacyPolicyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarWidget(
        title: Constants.privacy,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                Constants.example1,
                style: AppTextStyles.montserratStyle.regular12Black,
                textAlign: TextAlign.justify,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Text(
                      Constants.example2,
                      style: AppTextStyles.montserratStyle.regular12Black,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      Constants.example3,
                      style: AppTextStyles.montserratStyle.regular12Black,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      Constants.example4,
                      style: AppTextStyles.montserratStyle.regular12Black,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      Constants.example5,
                      style: AppTextStyles.montserratStyle.regular12Black,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      Constants.example6,
                      style: AppTextStyles.montserratStyle.regular12Black,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: Constants.example7,
                      style: AppTextStyles.montserratStyle.regular12Black.copyWith(fontSize: 15),
                    ),
                    TextSpan(
                      text: Constants.emailDieu,
                      style: AppTextStyles.montserratStyle.bold12Black.copyWith(fontSize: 15),
                    ),
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
