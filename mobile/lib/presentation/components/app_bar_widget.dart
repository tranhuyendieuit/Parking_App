import 'package:flutter/material.dart';
import 'package:mobile/config/themes/app_colors.dart';
import 'package:mobile/config/themes/app_text_styles.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final IconData? icon;
  final VoidCallback? onPressLeftButton;
  final String? title;
  final Color? backgroundColor;
  final Color? iconColor;
  final TextStyle? titleStyle;
  const AppBarWidget(
      {super.key,
      this.icon,
      this.onPressLeftButton,
      this.title,
      this.backgroundColor,
      this.iconColor,
      this.titleStyle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: AppBar(
        backgroundColor: backgroundColor ?? AppColors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            icon ?? Icons.arrow_back_ios,
            color: iconColor ?? AppColors.black,
          ),
          onPressed: () {
            onPressLeftButton?.call();
            if (onPressLeftButton == null) {
              Navigator.pop(context);
            }
          },
        ),
        title: Text(title ?? '',
            textAlign: TextAlign.center,
            style: titleStyle ?? AppTextStyles.montserratStyle.bold16Black),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
