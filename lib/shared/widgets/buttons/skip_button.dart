import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class SkipButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const SkipButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderMuted),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
