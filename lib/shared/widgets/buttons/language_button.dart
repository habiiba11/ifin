import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class LanguageButton extends StatelessWidget {
  final bool isArabic;
  final VoidCallback onPressed;

  const LanguageButton({
    super.key,
    required this.isArabic,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.borderLight, width: 1),
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(
        isArabic ? 'العربية' : 'English',
        style: const TextStyle(
          color: Colors.red,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
