import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';

class NewHomeCategoryCard extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback? onTap;
  final double circleSize = 48;

  const NewHomeCategoryCard({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = circleSize.w;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size,
            height: size,
            decoration: const BoxDecoration(
              color: AppColors.cardCircle,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              icon,
              width: size * 0.6,
              height: size * 0.6,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
