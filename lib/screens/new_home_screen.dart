import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewHomeScreen extends StatefulWidget {
  const NewHomeScreen({super.key});

  @override
  State<NewHomeScreen> createState() => _NewHomeScreenState();
}

class NewHomeCategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const NewHomeCategoryCard({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 240, 242, 244),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 26,
              color: const Color.fromARGB(255, 15, 72, 120),
            ),
          ),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> banners = [
    {
      'title': 'Financing is easier\nwith iFin',
      'image': 'https://picsum.photos/seed/banner1/800/400',
    },
    {
      'title': 'Get your finance\nin minutes',
      'image': 'https://picsum.photos/seed/banner2/800/400',
    },
    {
      'title': 'Trusted\npartners',
      'image': 'https://picsum.photos/seed/banner3/800/400',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: const Color(0xFF0E5289),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/new-home');
              break;
            case 1:
              Navigator.pushNamed(context, '/cart-details');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Finances',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double width = constraints.maxWidth;
            final bool isTablet = width >= 600 && width < 1024;
            final bool isDesktop = width >= 1024;

            // نحدد عدد أعمدة الـ Partners grid حسب حجم الشاشة
            final int gridCrossAxisCount = isDesktop
                ? 6
                : isTablet
                ? 4
                : 3;

            // ارتفاع البانر بيكبر شوية في الشاشات الكبيرة
            final double bannerHeight = isDesktop
                ? 320
                : isTablet
                ? 260
                : 200;

            // نحدد عرض أقصى للمحتوى عشان ميتمططش لأقصى الشاشة في الويب
            final double maxContentWidth = isDesktop ? 1000 : double.infinity;

            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxContentWidth),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                context,
                                '/v2-notifications',
                              ),
                              child: Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    const Center(
                                      child: Icon(
                                        Icons.notifications_none,
                                        size: 20,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          top: 6.h,
                                          right: 6.w,
                                        ),
                                        width: 8.w,
                                        height: 8.h,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFDF373C),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 1.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: Image.asset(
                                'assets/images/ifin1.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                'https://picsum.photos/seed/user/200/200',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: bannerHeight,
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (index) =>
                              setState(() => _currentPage = index),
                          itemCount: banners.length,
                          itemBuilder: (context, index) {
                            final banner = banners[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Stack(
                                  children: [
                                    Image.network(
                                      banner['image']!,
                                      height: bannerHeight,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      loadingBuilder:
                                          (context, child, progress) {
                                            if (progress == null) return child;
                                            return Container(
                                              height: bannerHeight,
                                              width: double.infinity,
                                              color: Colors.grey.shade200,
                                              child: const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            );
                                          },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Container(
                                              height: bannerHeight,
                                              width: double.infinity,
                                              color: Colors.grey.shade200,
                                              child: const Center(
                                                child: Icon(
                                                  Icons.image_not_supported,
                                                ),
                                              ),
                                            );
                                          },
                                    ),
                                    Container(
                                      height: bannerHeight,
                                      width: double.infinity,
                                      color: Colors.black.withOpacity(0.05),
                                    ),
                                    Positioned(
                                      left: 18,
                                      top: 24,
                                      right: 18,
                                      child: Text(
                                        banner['title']!,
                                        style: TextStyle(
                                          fontSize: isDesktop ? 26 : 19,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF0E5289),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(banners.length, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            width: _currentPage == index ? 18 : 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? const Color(0xFF0E5289)
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        color: const Color(0xFFF7F8FA),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 18,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Our Partners',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 14),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade200,
                                    blurRadius: 6,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: gridCrossAxisCount,
                                crossAxisSpacing: 6,
                                mainAxisSpacing: 14,
                                children: [
                                  NewHomeCategoryCard(
                                    title: 'Banks',
                                    icon: Icons.account_balance,
                                    onTap: () {},
                                  ),
                                  NewHomeCategoryCard(
                                    title: 'Market',
                                    icon: Icons.shopping_cart,
                                    onTap: () => Navigator.pushNamed(
                                      context,
                                      '/cart-details',
                                    ),
                                  ),
                                  NewHomeCategoryCard(
                                    title: 'Cars',
                                    icon: Icons.directions_car,
                                    onTap: () => Navigator.pushNamed(
                                      context,
                                      '/cart-details',
                                    ),
                                  ),
                                  NewHomeCategoryCard(
                                    title: 'Electronics',
                                    icon: Icons.devices,
                                    onTap: () => Navigator.pushNamed(
                                      context,
                                      '/cart-details',
                                    ),
                                  ),
                                  NewHomeCategoryCard(
                                    title: 'Furniture',
                                    icon: Icons.chair,
                                    onTap: () => Navigator.pushNamed(
                                      context,
                                      '/cart-details',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
