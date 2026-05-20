import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('ar');

  Locale get locale => _locale;

  bool get isArabic => _locale.languageCode == 'ar';

  void toggleLanguage() {
    _locale = isArabic ? const Locale('en') : const Locale('ar');
    notifyListeners();
  }
}
