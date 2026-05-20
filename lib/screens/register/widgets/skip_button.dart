import 'package:flutter/material.dart' hide CarouselController;

class SkipButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const SkipButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color.fromARGB(255, 216, 226, 230)),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 113, 173, 197),
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
