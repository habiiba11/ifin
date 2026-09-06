class AppStrings {
  static Map<String, Map<String, String>> strings = {
    'ar': {
      // Bottom Nav
      'home': 'القائمة الرئيسية',
      'finances': 'التمويلات',
      'calculator': 'الحاسبة',
      'settings': 'الإعدادات',
      'scan': 'مسح',

      // Register Screen
      'register_title': 'سجل الآن',
      'register_subtitle': 'أدخل رقم موبايلك',
      'continue': 'المتابعة',
      'skip': 'تخطي',
      'phone_number': 'رقم الموبايل',
      'terms1': 'من خلال إنشاء حساب، فإنك توافق على',
      'privacy': 'سياسة الخصوصية',
      'and': ' أيضاً ',
      'service': 'شروط الخدمة',
      'language_ar': 'العربية',
      'language_en': 'English',

      // Basic Info
      'basic_info': 'معلومات أساسية',
      'save': 'حفظ التغييرات',

      // Notifications
      'notifications': 'الإشعارات',

      // Finances
      'transaction': 'المعاملات',
      'upcoming': 'المدفوعات القادمة',

      // Settings
      'profile': 'الملف الشخصي',
      'privacy_security': 'الخصوصية والأمان',
      'language': 'اللغة المفضلة',
    },
    'en': {
      // Bottom Nav
      'home': 'Home',
      'finances': 'Finances',
      'calculator': 'Calculator',
      'settings': 'Settings',
      'scan': 'Scan',

      // Register Screen
      'register_title': 'Register Now',
      'register_subtitle': 'Enter your phone number',
      'continue': 'Continue',
      'skip': 'Skip',
      'phone_number': 'Phone Number',
      'terms1': 'By creating an account, you agree to',
      'privacy': 'Privacy Policy',
      'and': ' and ',
      'service': 'Terms of Service',
      'language_ar': 'العربية',
      'language_en': 'English',

      // Basic Info
      'basic_info': 'Basic Info',
      'save': 'Save Changes',

      // Notifications
      'notifications': 'Notifications',

      // Finances
      'transaction': 'Transaction',
      'upcoming': 'Upcoming Payment',

      // Settings
      'profile': 'Profile',
      'privacy_security': 'Privacy & Security',
      'language': 'Preferred Language',
    },
  };

  static String get(String key, bool isArabic) {
    return strings[isArabic ? 'ar' : 'en']?[key] ?? key;
  }
}
