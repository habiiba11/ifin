import 'package:flutter/material.dart';
import 'basic_info_screen.dart';

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
  final TextEditingController _hiddenController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _startTimer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _hiddenController.dispose();
    _focusNode.dispose();
    super.dispose();
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

  void _requestFocus() {
    FocusScope.of(context).requestFocus(_focusNode);
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF1F3F6),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _requestFocus,
        child: SingleChildScrollView(
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
                      : 'Enter the 6-digit code sent to you.',
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: _requestFocus,
                  child: Stack(
                    children: [
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
                              ),
                            ),
                            child: Center(
                              child: Text(
                                _code[index],
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          );
                        }),
                      ),
                      Positioned.fill(
                        child: Opacity(
                          opacity: 0,
                          child: TextField(
                            controller: _hiddenController,
                            focusNode: _focusNode,
                            keyboardType: TextInputType.number,
                            autofocus: true,
                            onChanged: (value) {
                              if (value.length > _currentIndex) {
                                _onKeyTap(value[value.length - 1]);
                              } else if (value.length < _currentIndex) {
                                _onDelete();
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(isArabic ? 'إعادة الإرسال خلال ' : 'Resend Code In '),
                    _canResend
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                _secondsRemaining = 10;
                                _canResend = false;
                                _code.fillRange(0, 6, '');
                                _currentIndex = 0;
                                _hiddenController.clear();
                              });
                              _startTimer();
                            },
                            child: Text(
                              isArabic ? 'إعادة الإرسال' : 'Resend',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF366F8C),
                              ),
                            ),
                          )
                        : Text('$_secondsRemaining'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
