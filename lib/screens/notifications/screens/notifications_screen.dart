import 'package:flutter/material.dart';
import '../../../core/shared_bottom_nav.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _paymentDue = true;
  bool _bankDecision = false;
  bool _transactionUpdates = false;
  bool _offersAndSurprises = false;

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
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.chevron_left, color: Color(0xFF2D3453)),
          ),
          centerTitle: true,
          title: Text(
            isArabic ? 'الإشعارات' : 'Notifications',
            style: const TextStyle(
              color: Color(0xFF2D3453),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.zero,
          child: Column(
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
                      _buildToggleItem(
                        isArabic
                            ? 'موعد الدفع/القسط'
                            : 'Payment/Installment due',
                        _paymentDue,
                        (val) => setState(() => _paymentDue = val),
                      ),
                      _buildToggleItem(
                        isArabic ? 'قرار البنك' : 'Bank decision is made',
                        _bankDecision,
                        (val) => setState(() => _bankDecision = val),
                      ),
                      _buildToggleItem(
                        isArabic ? 'تحديثات المعاملات' : 'Transaction Updates',
                        _transactionUpdates,
                        (val) => setState(() => _transactionUpdates = val),
                      ),
                      _buildToggleItem(
                        isArabic ? 'العروض والمفاجآت' : 'Offers and surprises',
                        _offersAndSurprises,
                        (val) => setState(() => _offersAndSurprises = val),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const SharedBottomNav(selectedIndex: -1),
      ),
    );
  }

  Widget _buildToggleItem(String title, bool value, Function(bool) onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Color(0xFF2D3453), fontSize: 15),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF366F8C),
          ),
        ],
      ),
    );
  }
}
