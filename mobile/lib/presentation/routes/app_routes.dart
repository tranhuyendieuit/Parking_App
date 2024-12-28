import 'package:flutter/material.dart';
import 'package:mobile/presentation/screens/auth/login/page/login_page.dart';
import 'package:mobile/presentation/screens/auth/register/pages/register_page.dart';
import 'package:mobile/presentation/screens/contact_police/page/contact_police_page.dart';
import 'package:mobile/presentation/screens/home/page/home_page.dart';
import 'package:mobile/presentation/screens/home/page/main_screen.dart';
import 'package:mobile/presentation/screens/parking_history/page/parking_history_page.dart';
import 'package:mobile/presentation/screens/payment_history/page/payment_history_page.dart';
import 'package:mobile/presentation/screens/profile/bloc/presentation/privacy_policy/page/privacy_policy_page.dart';
import 'package:mobile/presentation/screens/profile/page/profile_page.dart';
import 'package:mobile/presentation/screens/qr_scan/page/qr_scan_page.dart';
import 'package:mobile/presentation/screens/splash/pages/splash_page.dart';
import 'package:mobile/presentation/screens/welcome/page/welcome_page.dart';

class AppRoutes {
  static const String parkingHistory = '/parkingHistory';
  static const String contactPolice = '/contactPolice';
  static const String home = '/home';
  static const String welcome = '/welcome';
  static const String register = '/register';
  static const String login = '/login';
  static const String privacyPolicy = '/privacy-policy';
  static const String profile = '/profile';
  static const String qrCode = '/qr-code';
  static const String mainScreen = '/main-screen';
  static const String paymentHistory = '/payment-history';

  static getInitialRoute() {
    return '/';
  }

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (BuildContext context) => const SplashPage(),
      welcome: (BuildContext context) => const WelcomePage(),
      register: (BuildContext context) => const RegisterPage(),
      mainScreen: (BuildContext context) => const MainScreen(),
      login: (BuildContext context) => const LoginPage(),
      profile: (BuildContext context) => const ProfilePage(),
      privacyPolicy: (BuildContext context) => const PrivacyPolicyPage(),
      home: (BuildContext context) => const HomePage(),
      parkingHistory: (BuildContext context) => const ParkingHistoryPage(),
      contactPolice: (BuildContext context) => const ContactPolicePage(),
      qrCode: (BuildContext context) => const QrScanPage(),
      paymentHistory: (BuildContext context) => const PaymentHistoryPage(),
    };
  }
}
