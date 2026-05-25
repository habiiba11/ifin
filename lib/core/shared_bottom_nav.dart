import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_strings.dart';
import 'locale_provider.dart';

class SharedBottomNav extends StatelessWidget {
  final int selectedIndex;

  const SharedBottomNav({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, _) {
        final isArabic = localeProvider.isArabic;
        return SizedBox(
          height: 70,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 70,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 10, 82, 118),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: !isArabic
                      ? [
                          _NavItem(
                            icon: Icons.settings,
                            label: AppStrings.get('settings', isArabic),
                            isSelected: selectedIndex == 0,
                            onTap: () =>
                                Navigator.pushNamed(context, '/settings'),
                          ),
                          _NavItem(
                            icon: Icons.calculate,
                            label: AppStrings.get('calculator', isArabic),
                            isSelected: selectedIndex == 1,
                            onTap: () =>
                                Navigator.pushNamed(context, '/calculator'),
                          ),
                          const SizedBox(width: 60),
                          _NavItem(
                            icon: Icons.dashboard_outlined,
                            label: AppStrings.get('finances', isArabic),
                            isSelected: selectedIndex == 2,
                            onTap: () =>
                                Navigator.pushNamed(context, '/finances'),
                          ),
                          _NavItem(
                            icon: Icons.home,
                            label: AppStrings.get('home', isArabic),
                            isSelected: selectedIndex == 3,
                            onTap: () => Navigator.pushNamed(context, '/home'),
                          ),
                        ]
                      : [
                          _NavItem(
                            icon: Icons.home,
                            label: AppStrings.get('home', isArabic),
                            isSelected: selectedIndex == 3,
                            onTap: () => Navigator.pushNamed(context, '/home'),
                          ),
                          _NavItem(
                            icon: Icons.dashboard_outlined,
                            label: AppStrings.get('finances', isArabic),
                            isSelected: selectedIndex == 2,
                            onTap: () =>
                                Navigator.pushNamed(context, '/finances'),
                          ),
                          const SizedBox(width: 60),
                          _NavItem(
                            icon: Icons.calculate,
                            label: AppStrings.get('calculator', isArabic),
                            isSelected: selectedIndex == 1,
                            onTap: () =>
                                Navigator.pushNamed(context, '/calculator'),
                          ),
                          _NavItem(
                            icon: Icons.settings,
                            label: AppStrings.get('settings', isArabic),
                            isSelected: selectedIndex == 0,
                            onTap: () =>
                                Navigator.pushNamed(context, '/settings'),
                          ),
                        ],
                ),
              ),
              Positioned(
                top: -25,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.qr_code_scanner,
                        color: Colors.orange,
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      AppStrings.get('scan', isArabic),
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? Colors.orange : Colors.white),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.orange : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
