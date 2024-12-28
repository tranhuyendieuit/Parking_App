import 'package:flutter/material.dart';
import 'package:mobile/config/themes/app_images.dart';

class CustomLogo extends StatelessWidget {
  final BoxDecoration? decoration;

  const CustomLogo({super.key, this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: Image.asset(
        AppImages.logo.webpAssetPath,
        height: 100,
        width: 240,
        alignment: Alignment.center,
        fit: BoxFit.contain,
      ),
    );
  }
}
