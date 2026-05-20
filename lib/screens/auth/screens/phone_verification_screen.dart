import 'package:flutter/material.dart';
import 'package:ifin_ui_flutter/screens/profile/screens/basic_info_screen.dart';

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({super.key});

  @override
  State<PhoneVerificationScreen> createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  final List<String> _code = List.filled(6, '');
  int _currentIndex = 0;
  int _secondsRemaining = 10;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      if (_secondsRemaining > 0) {
        setState(() => _secondsRemaining--);
        _startTimer();
      } else {
        setState(() => _canResend = true);
      }
    });
  }

  void _onKeyTap(String value) {
    if (_currentIndex < 6) {
      setState(() {
        _code[_currentIndex] = value;
        _currentIndex++;
      });
      if (_currentIndex == 6) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BasicInfoScreen()),
        );
      }
    }
  }

  void _onDelete() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _code[_currentIndex] = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Scaffold(
      backgroundColor: const Color(0xFFF1F3F6),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        color: Color(0xFF2D3453),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
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
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    isArabic ? 'التحقق' : 'Verification',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333C6E),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    isArabic
                        ? 'أدخل الكود المكون من 6 أرقام.'
                        : 'Enter the 6-digit code sent to you at.',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF333C6E),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      return Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: index < _currentIndex
                                ? const Color(0xFF4A7C8E)
                                : const Color(0xFF4A7C8E).withOpacity(0.3),
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            _code[index],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D3453),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        isArabic ? 'إعادة الإرسال خلال ' : 'Resend Code In ',
                        style: const TextStyle(
                          color: Color(0xFF2D3453),
                          fontSize: 14,
                        ),
                      ),
                      _canResend
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  _secondsRemaining = 10;
                                  _canResend = false;
                                });
                                _startTimer();
                              },
                              child: Text(
                                isArabic ? 'إعادة الإرسال' : 'Resend',
                                style: const TextStyle(
                                  color: Color(0xFF366F8C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : Text(
                              '$_secondsRemaining ${isArabic ? 'ثانية' : 'Seconds'}',
                              style: const TextStyle(
                                color: Color(0xFFE87722),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 250,
            color: const Color(0xFFE8EBF0),
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              children: [
                _buildKeyRow(['1', '2\nABC', '3\nDEF']),
                _buildKeyRow(['4\nGHI', '5\nJKL', '6\nMNO']),
                _buildKeyRow(['7\nPQRS', '8\nTUV', '9\nWXYZ']),
                _buildBottomRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyRow(List<String> keys) {
    return Row(
      children: keys.map((key) {
        final parts = key.split('\n');
        return Expanded(
          child: GestureDetector(
            onTap: () => _onKeyTap(parts[0]),
            child: Container(
              margin: const EdgeInsets.all(6),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    parts[0],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2D3453),
                    ),
                  ),
                  if (parts.length > 1)
                    Text(
                      parts[1],
                      style: const TextStyle(
                        fontSize: 8,
                        color: Color(0xFF888888),
                        letterSpacing: 1.2,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBottomRow() {
    return Row(
      children: [
        const Expanded(child: SizedBox()),
        Expanded(
          child: GestureDetector(
            onTap: () => _onKeyTap('0'),
            child: Container(
              margin: const EdgeInsets.all(3),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  '0',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2D3453),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: _onDelete,
            child: const SizedBox(
              height: 50,
              child: Center(
                child: Icon(
                  Icons.backspace_outlined,
                  color: Color(0xFF2D3453),
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
