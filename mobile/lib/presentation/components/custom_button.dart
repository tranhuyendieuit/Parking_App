import 'package:flutter/material.dart';
import 'package:mobile/config/themes/app_colors.dart';
import 'package:mobile/config/themes/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final double? width;
  final double? height;
  final TextAlign? textAlign;
  final Color? backgroundColor;
  final Color? borderColor;

  const CustomButton(
      {super.key,
      this.text,
      this.onTap,
      this.textStyle,
      this.padding = const EdgeInsets.all(14.35),
      this.borderRadius = 30.0,
      this.width,
      this.height,
      this.textAlign,
      this.backgroundColor,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: backgroundColor ?? AppColors.mountainMeadow,
            border: Border.all(
              color: borderColor ?? AppColors.mountainMeadow,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.4),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ]),
        child: Text(
          text ?? '',
          style: textStyle ?? AppTextStyles.montserratStyle.bold12White,
          textAlign: textAlign ?? TextAlign.center,
        ),
      ),
    );
  }
}
