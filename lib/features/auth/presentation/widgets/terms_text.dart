import 'package:flutter/material.dart';
import '../../../../core/localization/app_strings.dart';
import '../../../../core/theme/app_colors.dart';

class TermsText extends StatelessWidget {
  final bool isArabic;

  const TermsText({super.key, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.textLink,
            ),
            children: [
              TextSpan(text: AppStrings.get('terms1', isArabic)),
            ],
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.textLink,
            ),
            children: [
              TextSpan(
                text: AppStrings.get('privacy', isArabic),
                style: const TextStyle(decoration: TextDecoration.underline),
              ),
              TextSpan(text: AppStrings.get('and', isArabic)),
              TextSpan(
                text: AppStrings.get('service', isArabic),
                style: const TextStyle(decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
