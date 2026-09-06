import 'package:flutter/material.dart';

class CongratulationsScreen extends StatefulWidget {
  const CongratulationsScreen({super.key});

  @override
  State<CongratulationsScreen> createState() => _CongratulationsScreenState();
}

class _CongratulationsScreenState extends State<CongratulationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 60),
              SizedBox(
                height: 220,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 30,
                      top: 10,
                      child: _confetti(Colors.green, 10),
                    ),
                    Positioned(
                      left: 70,
                      top: 0,
                      child: _confetti(Colors.red, 6),
                    ),
                    Positioned(
                      right: 30,
                      top: 30,
                      child: Icon(
                        Icons.show_chart,
                        color: Colors.orange.withOpacity(0.7),
                        size: 30,
                      ),
                    ),
                    Positioned(
                      right: 60,
                      top: 80,
                      child: _confettiRing(Colors.purple, 14),
                    ),
                    Positioned(
                      left: 40,
                      bottom: 30,
                      child: _confettiRing(Colors.green, 12),
                    ),
                    Positioned(
                      left: 80,
                      bottom: 10,
                      child: Icon(
                        Icons.show_chart,
                        color: Colors.blue.withOpacity(0.7),
                        size: 24,
                      ),
                    ),
                    Positioned(
                      right: 40,
                      bottom: 20,
                      child: _confetti(Colors.orange, 8),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 60,
                      child: _confetti(Colors.blue, 10),
                    ),
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green.withOpacity(0.15),
                      ),
                      child: Center(
                        child: Container(
                          width: 110,
                          height: 110,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF4CAF50),
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 55,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text.rich(
                TextSpan(
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  children: [
                    const TextSpan(
                      text:
                          'congratulations, your your application for instant financing for Danub products with amount ',
                    ),
                    const TextSpan(
                      text: '1550\$',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text:
                          ' is Approved and you can deliver your products now',
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _confetti(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Widget _confettiRing(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 2),
      ),
    );
  }
}
