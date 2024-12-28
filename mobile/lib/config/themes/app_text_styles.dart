import 'package:flutter/material.dart';
import 'package:mobile/config/themes/app_colors.dart';

enum AppFontFamily { montserrat }

enum AppFontWeight { regular, medium, semiBold, bold }

extension AppFontFamilyDefault on AppFontFamily {
  String get name {
    switch (this) {
      case AppFontFamily.montserrat:
        return 'Montserrat';
    }
  }
}

extension MontserratFontWeight on AppFontWeight {
  FontWeight get weight {
    switch (this) {
      case AppFontWeight.regular:
        return FontWeight.w400;
      case AppFontWeight.medium:
        return FontWeight.w500;
      case AppFontWeight.semiBold:
        return FontWeight.w600;
      case AppFontWeight.bold:
        return FontWeight.w700;
    }
  }
}

class AppTextStyles {
  const AppTextStyles._();

  static MontserratStyles montserratStyle = MontserratStyles();
}

class MontserratStyles {
  static TextStyle customMontserratStyle(
    double size,
    Color color,
    FontWeight fontWeight,
  ) {
    return TextStyle(
      fontFamily: AppFontFamily.montserrat.name,
      color: color,
      fontWeight: fontWeight,
      fontSize: size,
    );
  }

  final regular8Manatee =
      customMontserratStyle(8, AppColors.manatee, AppFontWeight.regular.weight);
  final medium10DimGray =
      customMontserratStyle(10, AppColors.dimGray, AppFontWeight.medium.weight);
  final bold10White =
      customMontserratStyle(10, AppColors.white, AppFontWeight.bold.weight);
  final regular10MountainMeadow = customMontserratStyle(
      10, AppColors.mountainMeadow, AppFontWeight.regular.weight);
  final medium10Black =
      customMontserratStyle(10, AppColors.black, AppFontWeight.medium.weight);
  final medium12Black =
      customMontserratStyle(12, AppColors.black, AppFontWeight.medium.weight);
      final medium12Gray =
      customMontserratStyle(12, AppColors.gray, AppFontWeight.medium.weight);
  final regular10Black =
      customMontserratStyle(10, AppColors.black, AppFontWeight.regular.weight);
  final regular12Black =
      customMontserratStyle(12, AppColors.black, AppFontWeight.regular.weight);
  final regular12DimGray = customMontserratStyle(
      12, AppColors.dimGray, AppFontWeight.regular.weight);
  final bold12Black =
      customMontserratStyle(12, AppColors.black, AppFontWeight.bold.weight);
  final regular10DimGray = customMontserratStyle(
      10, AppColors.dimGray, AppFontWeight.regular.weight);
  final bold12White =
      customMontserratStyle(12, AppColors.white, AppFontWeight.bold.weight);
  final bold12MountainMeadow = customMontserratStyle(
      12, AppColors.mountainMeadow, AppFontWeight.bold.weight);
  final semiBold12MountainMeadow = customMontserratStyle(
      12, AppColors.mountainMeadow, AppFontWeight.semiBold.weight);
  final bold13Black =
      customMontserratStyle(13, AppColors.black, AppFontWeight.bold.weight);
  final regular13DimGray = customMontserratStyle(
      13, AppColors.dimGray, AppFontWeight.regular.weight);
  final bold14White =
      customMontserratStyle(14, AppColors.white, AppFontWeight.bold.weight);
  final bold16Black =
      customMontserratStyle(16, AppColors.black, AppFontWeight.bold.weight);
  final bold14Gray =
      customMontserratStyle(14, AppColors.gray, AppFontWeight.bold.weight);
  final bold16White =
      customMontserratStyle(16, AppColors.white, AppFontWeight.bold.weight);
  final bold14Black =
      customMontserratStyle(14, AppColors.black, AppFontWeight.bold.weight);
  final bold16MountainMeadow = customMontserratStyle(
      16, AppColors.mountainMeadow, AppFontWeight.bold.weight);
  final bold16Gray =
      customMontserratStyle(16, AppColors.gray, AppFontWeight.bold.weight);
  final regular12White =
      customMontserratStyle(12, AppColors.white, AppFontWeight.regular.weight);
  final regular16Black =
      customMontserratStyle(16, AppColors.black, AppFontWeight.bold.weight);
  final regular14Black =
      customMontserratStyle(14, AppColors.black, AppFontWeight.regular.weight);
  final regular16WildBlueYonder = customMontserratStyle(
      16, AppColors.wildBlueYonder, AppFontWeight.medium.weight);
  final regular14RadicalRed = customMontserratStyle(
      14, AppColors.radicalRed, AppFontWeight.bold.weight);
  final bold18Black =
      customMontserratStyle(18, AppColors.black, AppFontWeight.bold.weight);
  final black22Bold =
      customMontserratStyle(22, AppColors.black, AppFontWeight.bold.weight);
  final black20Bold =
      customMontserratStyle(20, AppColors.black, AppFontWeight.semiBold.weight);
  final black12Medium =
      customMontserratStyle(12, AppColors.black, AppFontWeight.medium.weight);
  final black14Bold =
      customMontserratStyle(14, AppColors.black, AppFontWeight.medium.weight);
}
