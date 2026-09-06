import 'package:flutter/material.dart';
import '../language_button.dart';
import 'package:provider/provider.dart';
import '../../../core/locale_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();

  Map<String, String> get texts {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return isArabic
        ? {
            "title": "سجل الآن",
            "subtitle": "أدخل رقم موبايلك",
            "continue": "المتابعة",
            "skip": "تخطي",
            "terms1": "من خلال إنشاء حساب، فإنك توافق على",
            "privacy": "سياسة الخصوصية",
            "and": " أيضاً ",
            "service": "شروط الخدمة",
          }
        : {
            "title": "Register Now",
            "subtitle": "Enter your phone number",
            "continue": "Continue",
            "skip": "Skip",
            "terms1": "By creating an account, you agree to",
            "privacy": "Privacy Policy",
            "and": " and ",
            "service": "Terms of Service",
          };
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFE5E5E5),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: LanguageButton(
                        isArabic: isArabic,
                        onPressed: () {
                          Provider.of<LocaleProvider>(
                            context,
                            listen: false,
                          ).toggleLanguage();
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: SizedBox(
                        height: 220,
                        width: 230,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: -70,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  width: 260,
                                  height: 260,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF366F8C),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  height: 2,
                                  color: const Color(0xFF366F8C),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Transform.translate(
                                  offset: const Offset(-1, 22),
                                  child: Container(
                                    width: 110,
                                    height: 210,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF144162),
                                      borderRadius: BorderRadius.circular(25),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          blurRadius: 15,
                                          offset: const Offset(0, 6),
                                        ),
                                      ],
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 4,
                                          left: 4,
                                          right: 4,
                                          bottom: 4,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 60,
                                                  height: 60,
                                                  decoration:
                                                      const BoxDecoration(
                                                        color: Color(
                                                          0xFFE8824A,
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                  child: const Icon(
                                                    Icons.mail_outline,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          left: 30,
                                          right: 30,
                                          child: Container(
                                            height: 10,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF144162),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        texts["title"]!,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF36416E),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        texts["subtitle"]!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF36416E),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: isArabic ? "رقم الموبايل" : "Phone Number",
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text("🇴🇲", style: TextStyle(fontSize: 20)),
                                SizedBox(width: 6),
                                Text(
                                  "OM  +968",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 1),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black54,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 0,
                            minHeight: 0,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 14, 73, 121),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xFF0C487A),
                        ),
                        children: [TextSpan(text: texts["terms1"]!)],
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xFF0C487A),
                        ),
                        children: [
                          TextSpan(
                            text: texts["privacy"]!,
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(text: texts["and"]!),
                          TextSpan(
                            text: texts["service"]!,
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/phone-verification');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF366F8C),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          texts["continue"]!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF366F8C)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          texts["skip"]!,
                          style: const TextStyle(
                            color: Color(0xFF366F8C),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
