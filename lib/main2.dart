import 'package:flutter/material.dart';
import 'screens/new_home_screen.dart';
import 'screens/notifications_v2_screen.dart';
import 'screens/cart_details_screen.dart';
import 'screens/down_payment_screen.dart';
import 'screens/phone_verification_screen.dart';
import 'screens/employment_details_screen.dart';
import 'screens/additional_personal_details_screen.dart';
import 'screens/final_review_screen.dart';
import 'screens/congratulations_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp2());
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/new-home',
          routes: {
            '/new-home': (context) => const NewHomeScreen(),
            '/v2-notifications': (context) => const NotificationsV2Screen(),
            '/cart-details': (context) => const CartDetailsScreen(),
            '/down-payment': (context) => const DownPaymentScreen(),
            '/phone-verification': (context) => const PhoneVerificationScreen(),

            '/employment-details': (context) => const EmploymentDetailsScreen(),
            '/additional-personal-details': (context) =>
                const AdditionalPersonalDetailsScreen(),
            '/final-review': (context) => const FinalReviewScreen(),
            '/congratulations': (context) => const CongratulationsScreen(),
          },
        );
      },
    );
  }
}
