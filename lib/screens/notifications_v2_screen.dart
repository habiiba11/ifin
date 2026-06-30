import 'package:flutter/material.dart';

class NotificationsV2Screen extends StatefulWidget {
  const NotificationsV2Screen({super.key});

  @override
  State<NotificationsV2Screen> createState() => _NotificationsV2ScreenState();
}

class _NotificationsV2ScreenState extends State<NotificationsV2Screen> {
  final List<Map<String, dynamic>> notifications = const [
    {
      'icon': Icons.storefront,
      'iconColor': Colors.red,
      'title': 'Danube',
      'message':
          'Your products from Danub is ready for instant financing, please click to complete the transaction and get instant approval.',
      'date': '10 Jan 2022 - 8:00 PM',
      'isNew': true,
      'unread': false,
    },
    {
      'icon': Icons.account_balance,
      'iconColor': Color(0xFF8B2D8B),
      'title': 'Nizwe Bank',
      'message': 'Transfered money to Baskin',
      'date': '8:58 PM',
      'isNew': false,
      'unread': true,
    },
    {
      'icon': Icons.account_balance_wallet,
      'iconColor': Color(0xFFE87722),
      'title': 'Ifin',
      'message': 'Received money \$20 from Ifin',
      'date': '8:58 PM',
      'isNew': false,
      'unread': true,
    },
    {
      'icon': Icons.account_balance,
      'iconColor': Color(0xFF8B2D8B),
      'title': 'Nizwe Bank',
      'message': 'Happy Eid',
      'date': '8:58 PM',
      'isNew': false,
      'unread': false,
    },
    {
      'icon': Icons.account_balance_wallet,
      'iconColor': Color(0xFFE87722),
      'title': 'Ifin',
      'message': 'Received money \$20 from Ifin',
      'date': '8:58 PM',
      'isNew': false,
      'unread': false,
    },
  ];

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
            child: const Icon(Icons.chevron_left, color: Colors.black),
          ),
          centerTitle: true,
          title: Text(
            isArabic ? 'الإشعارات' : 'Notifications',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final item = notifications[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: item['unread'] == true
                    ? const Color(0xFFEFF1F4)
                    : Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (item['unread'] == true)
                    Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.only(top: 6, right: 4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.grey.shade100,
                    child: Icon(item['icon'], color: item['iconColor']),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item['title'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            if (item['isNew'] == true)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.orange.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  'NEW',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['message'],
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item['date'],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
