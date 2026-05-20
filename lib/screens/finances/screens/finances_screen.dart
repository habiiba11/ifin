import 'package:flutter/material.dart';
import '../../../core/shared_bottom_nav.dart';

class FinancesScreen extends StatefulWidget {
  const FinancesScreen({super.key});

  @override
  State<FinancesScreen> createState() => _FinancesScreenState();
}

class _FinancesScreenState extends State<FinancesScreen> {
  bool _isTransaction = true;

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Scaffold(
      backgroundColor: const Color(0xFFF1F3F6),
      body: Directionality(
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, '/notifications'),
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: Stack(
                          children: [
                            const Center(
                              child: Icon(
                                Icons.notifications_outlined,
                                color: Color(0xFF2D3453),
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'iF',
                            style: TextStyle(
                              color: Color(0xFFE87722),
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: 'iN',
                            style: TextStyle(
                              color: Color(0xFF2D3453),
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/basic-info'),
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                        ),
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => _isTransaction = true),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: _isTransaction
                              ? const Color(0xFF0E5575)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text(
                          isArabic ? 'المعاملات' : 'Transaction',
                          style: TextStyle(
                            color: _isTransaction
                                ? Colors.white
                                : const Color(0xFF0E5575),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() => _isTransaction = false),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: !_isTransaction
                              ? const Color(0xFF0E5575)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text(
                          isArabic ? 'المدفوعات القادمة' : 'Upcoming Payment',
                          style: TextStyle(
                            color: !_isTransaction
                                ? Colors.white
                                : const Color(0xFF2D3453),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: _isTransaction
                    ? _buildTransactionTab(isArabic)
                    : _buildUpcomingTab(isArabic),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const SharedBottomNav(selectedIndex: 2),
    );
  }

  Widget _buildTransactionTab(bool isArabic) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        _buildTransactionGroup(
          isArabic ? 'محال' : 'Referred',
          const Color(0xFFE87722),
          [_transactionItem()],
        ),
        const SizedBox(height: 16),
        _buildTransactionGroup(
          isArabic ? 'موافق عليه' : 'Approved',
          Colors.green,
          [_transactionItem(), _transactionItem()],
        ),
        const SizedBox(height: 16),
        _buildTransactionGroup(
          isArabic ? 'مكتمل' : 'Completed',
          const Color(0xFF366F8C),
          [_transactionItem()],
        ),
      ],
    );
  }

  Widget _buildTransactionGroup(
    String status,
    Color color,
    List<Widget> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text(
                  'Transaction: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF2D3453),
                  ),
                ),
                Text(
                  status,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: color,
                  ),
                ),
              ],
            ),
            const Icon(Icons.arrow_drop_down, color: Color(0xFF2D3453)),
          ],
        ),
        const SizedBox(height: 8),
        ...items,
      ],
    );
  }

  Widget _transactionItem() {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.account_balance, color: Color(0xFF2D3453)),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nizwe Bank',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3453),
                  ),
                ),
                Text(
                  'Baskin-Robbins',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '- \$144.00',
                style: TextStyle(
                  color: Color(0xFF366F8C),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '9:10 PM',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingTab(bool isArabic) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFEEF0F3),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isArabic ? 'كل المدفوعات قادمة' : 'All Payments are Coming',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3453),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.history, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        isArabic ? 'آخر تحديث 9:10 م' : 'Last updated 9:10 PM',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Text(
                '\$220',
                style: TextStyle(
                  color: Color(0xFF366F8C),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          isArabic ? 'المدفوعات القادمة' : 'Upcoming Payments',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xFF2D3453),
          ),
        ),
        const SizedBox(height: 12),
        _buildUpcomingItem(
          isArabic ? 'القسط الثاني' : 'Second Installment',
          'Nizwe Bank',
          '- \$144.00',
          isArabic,
        ),
        _buildUpcomingItem(
          isArabic ? 'القسط الثالث' : 'Third Installment',
          'Al-Aizz Bank',
          '- \$76.00',
          isArabic,
        ),
      ],
    );
  }

  Widget _buildUpcomingItem(
    String installment,
    String bank,
    String amount,
    bool isArabic,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                installment,
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
              Text(
                isArabic ? 'باقي 12 يوم' : '12 Days Left',
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.account_balance,
                  color: Color(0xFF2D3453),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bank,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3453),
                      ),
                    ),
                    const Text(
                      'Baskin-Robbins',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ),
              Text(
                amount,
                style: const TextStyle(
                  color: Color(0xFF366F8C),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
