import 'package:flutter/material.dart';
import 'package:mobile/config/themes/app_colors.dart';
import 'package:mobile/config/themes/app_text_styles.dart';

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onTap;

  const ProfileOption(
      {super.key,
      required this.icon,
      required this.text,
      this.textStyle,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: AppColors.dimGray,
          size: 23,
        ),
        title: Text(
          text,
          style: AppTextStyles.montserratStyle.medium12Black,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.dimGray,
          size: 23,
        ),
        onTap: onTap,
        tileColor: AppColors.aliceBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
