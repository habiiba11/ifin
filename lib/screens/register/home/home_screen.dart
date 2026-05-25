import 'package:flutter/material.dart';
import 'dart:async';
import 'setting_screen.dart';
import 'package:provider/provider.dart';
import '../../../core/locale_provider.dart';
import '../../../core/app_strings.dart';
import '../../../core/shared_bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected
                ? Colors.orange
                : const Color.fromARGB(255, 241, 243, 244),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected
                  ? Colors.orange
                  : const Color.fromARGB(255, 241, 243, 244),
            ),
          ),
        ],
      ),
    );
  }
}

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
            color: Color.fromARGB(255, 188, 200, 209),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 32,
            color: const Color.fromARGB(255, 15, 72, 120),
          ),
        ),
        const SizedBox(height: 10),
        Text(title, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _selectedIndex = 3;

  final List<String> images = [
   "https://picsum.photos/seed/finance1/800/400",
  "https://picsum.photos/seed/finance2/800/400",
  "https://picsum.photos/seed/finance3/800/400",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        if (!_pageController.hasClients) return;
        int nextPage = _currentPage + 1;
        if (nextPage == images.length) nextPage = 0;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SharedBottomNav(selectedIndex: _selectedIndex),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const ProfileScreen(),
          const SizedBox(),
          const SizedBox(),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 19, 85, 139),
                    ),
                    child: Consumer<LocaleProvider>(
                      builder: (context, localeProvider, _) {
                        final isArabic = localeProvider.isArabic;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.person,
                                color: Color(0xFF0E5289),
                                size: 28,
                              ),
                            ),
                            const Text(
                              "iFiN",
                              style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                context,
                                '/notifications',
                              ),
                              child: const Icon(
                                Icons.notifications_none,
                                size: 28,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: PageView.builder(
                                  controller: _pageController,
                                  onPageChanged: (index) =>
                                      setState(() => _currentPage = index),
                                  itemCount: images.length,
                                  itemBuilder: (context, index) =>
                                      Image.network(
                                        images[index],
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.black.withOpacity(0.45),
                                ),
                              ),
                              Positioned.fill(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Consumer<LocaleProvider>(
                                    builder: (context, localeProvider, _) {
                                      final isArabic = localeProvider.isArabic;
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            isArabic
                                                ? "ما هي آيفن؟"
                                                : "What is iFin?",
                                            style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            isArabic
                                                ? "WHAT IS IFIN?"
                                                : "WHAT IS IFIN?",
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          Text(
                                            isArabic
                                                ? "منصة رقمية تقدم حلول تمويل إسلامي فوري، حيث تتم عملية التمويل في 10 دقائق"
                                                : "A digital platform providing instant Islamic finance solutions in just 10 minutes",
                                            style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.white70,
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          const Text(
                                            "IFIN IS A DIGITAL PLATFORM FACILITATING INSTANT FINANCE IN JUST 10 MINUTES",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 60,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                width:
                                    (60 / images.length) * (_currentPage + 1),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Consumer<LocaleProvider>(
                      builder: (context, localeProvider, _) {
                        final isArabic = localeProvider.isArabic;
                        return Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 8,
                            children: [
                              CategoryCard(
                                title: isArabic ? "الأثاث" : "Furniture",
                                icon: Icons.chair,
                              ),
                              CategoryCard(
                                title: isArabic ? "السيارات" : "Cars",
                                icon: Icons.directions_car,
                              ),
                              CategoryCard(
                                title: isArabic ? "البنوك" : "Banks",
                                icon: Icons.account_balance,
                              ),
                              CategoryCard(
                                title: isArabic
                                    ? "الإلكترونيات"
                                    : "Electronics",
                                icon: Icons.devices,
                              ),
                              CategoryCard(
                                title: isArabic ? "معدات" : "Equipment",
                                icon: Icons.build,
                              ),
                              CategoryCard(
                                title: isArabic
                                    ? "قطع غيار السيارات"
                                    : "Car Parts",
                                icon: Icons.car_repair,
                              ),
                              CategoryCard(
                                title: isArabic
                                    ? "مواد بناء"
                                    : "Building Materials",
                                icon: Icons.engineering,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
