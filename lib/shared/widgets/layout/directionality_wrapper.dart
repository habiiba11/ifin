import 'package:flutter/material.dart';

class DirectionalityWrapper extends StatelessWidget {
  final bool isArabic;
  final Widget child;

  const DirectionalityWrapper({
    super.key,
    required this.isArabic,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: child,
    );
  }
}
