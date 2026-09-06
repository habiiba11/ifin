import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const PhoneField({
    super.key,
    required this.controller,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.borderField),
        ),
      ),
    );
  }
}
