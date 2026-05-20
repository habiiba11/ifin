import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'core/locale_provider.dart';
import 'screens/register_screen.dart';
import 'screens/register/home/home_screen.dart';
import 'screens/register/home/calculator_screen.dart';
import 'screens/register/home/setting_screen.dart';
import 'screens/auth/screens/phone_verification_screen.dart';
import 'screens/profile/screens/basic_info_screen.dart';
import 'screens/finances/screens/finances_screen.dart';
import 'screens/notifications/screens/notifications_screen.dart';
import 'screens/notifications/screens/notifications_1_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LocaleProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: localeProvider.locale,
      supportedLocales: const [Locale('ar'), Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: '/register',
      routes: {
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/phone-verification': (context) => const PhoneVerificationScreen(),
        '/basic-info': (context) => const BasicInfoScreen(),
        '/finances': (context) => const FinancesScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/privacy-security': (context) => const PrivacySecurityScreen(),
        '/calculator': (context) => const CalculatorScreen(),
        '/settings': (context) => const ProfileScreen(),
      },
    );
  }
}
