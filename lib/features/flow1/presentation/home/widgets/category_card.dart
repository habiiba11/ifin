import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: const BoxDecoration(
            color: AppColors.categoryCircle,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 32, color: AppColors.categoryIcon),
        ),
        const SizedBox(height: 10),
        Text(title, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
