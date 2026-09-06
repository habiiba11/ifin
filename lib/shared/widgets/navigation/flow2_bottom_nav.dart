import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/constants/app_assets.dart';

class Flow2BottomNav extends StatelessWidget {
  final int currentIndex;

  const Flow2BottomNav({super.key, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      selectedItemColor: AppColors.primaryDeep,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, AppRoutes.newHome);
            break;
          case 1:
            Navigator.pushNamed(context, AppRoutes.cartDetails);
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(AppAssets.iconsHome),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(AppAssets.iconsFinances),
          label: 'Finances',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(AppAssets.iconsCalculator),
          label: 'Calculator',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(AppAssets.iconsSetting),
          label: 'Setting',
        ),
      ],
    );
  }
}
