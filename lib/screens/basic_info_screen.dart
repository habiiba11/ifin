import 'package:flutter/material.dart';
import '../../../core/shared_bottom_nav.dart';

class BasicInfoScreen extends StatefulWidget {
  const BasicInfoScreen({super.key});

  @override
  State<BasicInfoScreen> createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
  final _nameController = TextEditingController(text: 'Ahmed Mohamed');
  final _phoneController = TextEditingController(text: '+20 1012345668');
  final _locationController = TextEditingController(text: 'Maadi,Cairo,Egypt');
  final _emailController = TextEditingController(text: 'Ahmed.Mo@Gmail.Com');
  final _genderController = TextEditingController(text: 'Male');

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    _emailController.dispose();
    _genderController.dispose();
    super.dispose();
  }

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
            child: const Icon(Icons.chevron_left, color: Color(0xFF2D3453)),
          ),
          centerTitle: true,
          title: Text(
            isArabic ? 'المعلومات الأساسية' : 'Basic Info',
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.zero,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFEEF0F3),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                        ),
                        child: const Icon(Icons.person, size: 50, color: Colors.white),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          child: const Icon(Icons.camera_alt, size: 14, color: Color(0xFF2D3453)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                _buildField(Icons.person_outline, _nameController),
                _buildField(Icons.phone_outlined, _phoneController, editable: false),
                _buildField(Icons.location_on_outlined, _locationController),
                _buildField(Icons.email_outlined, _emailController),
                _buildField(Icons.people_outline, _genderController),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/notifications'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF366F8C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      isArabic ? 'حفظ التغييرات' : 'Save Change',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const SharedBottomNav(selectedIndex: -1),
      ),
    );
  }

  Widget _buildField(IconData icon, TextEditingController controller, {bool editable = true}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF366F8C), size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              controller.text,
              style: const TextStyle(color: Color(0xFF2D3453), fontSize: 15),
            ),
          ),
          if (editable)
            const Icon(Icons.edit_outlined, color: Colors.grey, size: 18),
        ],
      ),
    );
  }
}