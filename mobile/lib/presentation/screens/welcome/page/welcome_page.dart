import 'package:flutter/material.dart';
import 'package:mobile/presentation/screens/welcome/page/welcome_body.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return const WelcomeBody();
  }
}