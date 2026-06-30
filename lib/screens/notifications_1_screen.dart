import 'package:flutter/material.dart';
import '../../../core/shared_bottom_nav.dart';

class PrivacySecurityScreen extends StatefulWidget {
  const PrivacySecurityScreen({super.key});

  @override
  State<PrivacySecurityScreen> createState() => _PrivacySecurityScreenState();
}

class _PrivacySecurityScreenState extends State<PrivacySecurityScreen> {
  bool _biometrics = true;

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: const Color(0xFFF1F3F6),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF1F3F6),
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.chevron_left, color: Color(0xFF2D3453)),
          ),
          centerTitle: true,
          title: Text(
            isArabic ? 'الخصوصية والأمان' : 'Privacy & Security',
            style: const TextStyle(
              color: Color(0xFF2D3453),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFEEF0F3),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            isArabic ? 'البصمة' : 'Biometrics',
                            style: const TextStyle(
                              color: Color(0xFF2D3453),
                              fontSize: 15,
                            ),
                          ),
                          Switch(
                            value: _biometrics,
                            onChanged: (val) =>
                                setState(() => _biometrics = val),
                            activeColor: const Color(0xFF366F8C),
                          ),
                        ],
                      ),
                    ),
                    _buildItem(isArabic ? 'رمز PIN' : 'PIN'),
                    _buildItem(isArabic ? 'سياسة الخصوصية' : 'Privacy Policy'),
                    _buildItem(isArabic ? 'اتفاقية أيفن' : 'IFIN Agreement'),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const SharedBottomNav(selectedIndex: -1),
      ),
    );
  }

  Widget _buildItem(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(color: Color(0xFF2D3453), fontSize: 15),
          ),
        ],
      ),
    );
  }
}
