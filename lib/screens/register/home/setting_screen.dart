import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/locale_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: const Color(0xFF0A5276),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 140,
              color: const Color(0xFF0A5276),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 50, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF9FAFC),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle(isArabic ? 'الملف الشخصي' : 'Profile'),
                      _buildItem(
                        icon: Icons.person_outline,
                        title: isArabic ? 'معلومات أساسية' : 'Basic Info',
                        onTap: () =>
                            Navigator.pushNamed(context, '/basic-info'),
                        iconColor: const Color(0xFF0A5276),
                      ),
                      _buildSectionTitle(isArabic ? 'الإعدادات' : 'Settings'),
                      _buildItem(
                        icon: Icons.notifications_none,
                        title: isArabic ? 'الإشعارات' : 'Notifications',
                        iconColor: const Color(0xFF0A5276),
                        onTap: () =>
                            Navigator.pushNamed(context, '/notifications'),
                      ),
                      _buildItem(
                        icon: Icons.lock_outline,
                        title: isArabic
                            ? 'الخصوصية والأمان'
                            : 'Privacy & Security',
                        iconColor: const Color(0xFF0A5276),
                        onTap: () =>
                            Navigator.pushNamed(context, '/privacy-security'),
                      ),
                      _buildItem(
                        icon: Icons.language,
                        title: isArabic
                            ? 'اللغة المفضلة'
                            : 'Preferred Language',
                        iconColor: const Color(0xFF0A5276),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              isArabic ? 'ع' : 'EN',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                              color: Color.fromARGB(255, 187, 191, 198),
                            ),
                          ],
                        ),
                        showArrow: false,
                        onTap: () {
                          Provider.of<LocaleProvider>(
                            context,
                            listen: false,
                          ).toggleLanguage();
                        },
                      ),
                      _buildItem(
                        icon: Icons.light_mode_outlined,
                        title: isArabic ? 'وضع أيفن' : 'iFin Mode',
                        iconColor: const Color(0xFF0A5276),
                        trailing: Switch(
                          value: _isDarkMode,
                          onChanged: (val) => setState(() => _isDarkMode = val),
                          activeColor: const Color(0xFF0A5276),
                        ),
                        showArrow: false,
                      ),
                      _buildItem(
                        icon: Icons.info_outline,
                        title: isArabic ? 'آلية عمل أيفن' : 'How iFin Works',
                        iconColor: const Color(0xFF0A5276),
                      ),
                      _buildItem(
                        icon: Icons.headset_mic_outlined,
                        title: isArabic ? 'الدعم' : 'Support',
                        iconColor: const Color(0xFF0A5276),
                      ),
                      _buildItem(
                        icon: Icons.logout,
                        title: isArabic ? 'تسجيل الخروج' : 'Logout',
                        iconColor: const Color(0xFF0A5276),
                        showDivider: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildItem({
    required IconData icon,
    required String title,
    Color iconColor = const Color(0xFF0A5276),
    Widget? trailing,
    bool showArrow = true,
    bool showDivider = true,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: iconColor, size: 22),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
        trailing:
            trailing ??
            (showArrow
                ? const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Color.fromARGB(255, 187, 191, 198),
                  )
                : null),
        onTap: onTap ?? () {},
      ),
    );
  }
}
