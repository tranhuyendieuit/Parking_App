import 'package:flutter/material.dart';
import 'package:mobile/config/themes/app_images.dart';
import 'package:mobile/presentation/screens/welcome/page/welcome_page.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomePage()),
      );
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              AppImages.logo.webpAssetPath,
              height: 100,
              width: 250,
            ),
            const Spacer(),
            Image.asset(
              AppImages.backgroundSplash.webpAssetPath,
              height: 150,
              width: 300,
            ),
          ],
        ),
      ),
    );
  }
}
