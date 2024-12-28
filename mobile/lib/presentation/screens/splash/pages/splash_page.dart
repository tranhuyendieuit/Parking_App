import 'package:flutter/material.dart';
import 'package:mobile/presentation/screens/splash/pages/splash_body.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return const SplashBody();
  }
}