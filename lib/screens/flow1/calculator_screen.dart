import 'package:flutter/material.dart';

import '../../../../core/shared_bottom_nav.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String? _selectedBank = 'Alizz Islamic Bank';
  String? _selectedProduct = 'Alizz Murabaha Goods - STL';
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _downPaymentController = TextEditingController();
  int _duration = 12;
  int? _selectedChip = 12;

  final List<String> banks = [
    'Alizz Islamic Bank',
    'Bank Muscat',
    'Bank Nizwa',
  ];
  final List<String> products = ['Alizz Murabaha Goods - STL'];

  final List<int> chips = [12, 24, 36, 48, 60, 72, 84, 96, 108, 120];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: SharedBottomNav(selectedIndex: 1),
        backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: const Color(0xFF0A5276),
          elevation: 0,
          centerTitle: true,

          actions: const [
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 28,
              ),
            ),
          ],

          leading: const Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Icon(Icons.person, color: Colors.white, size: 20),
            ),
          ),
          title: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'i',
                  style: TextStyle(
                    color: Color(0xFFF5A623),
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                TextSpan(
                  text: 'Fi',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
                TextSpan(
                  text: 'N',
                  style: TextStyle(
                    color: Color(0xFFF5A623),
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ],
            ),
          ),
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Dropdowns ──
              _buildDropdown(
                label: 'المؤسسة المالية',
                value: _selectedBank,
                items: banks,
                onChanged: (val) => setState(() => _selectedBank = val),
              ),
              const SizedBox(height: 12),
              _buildDropdown(
                label: 'المنتج التمويلي',
                value: _selectedProduct,
                items: products,
                onChanged: (val) => setState(() => _selectedProduct = val),
              ),
              const SizedBox(height: 12),

              // ── Text Fields ──
              _buildTextField(
                label: 'الثمن الاجمالي',
                hint: 'أدخل ثمن الشراء (المحدد في المتجر)',
                controller: _amountController,
              ),
              const SizedBox(height: 12),
              _buildTextField(
                label: 'الدفعة المقدمة',
                hint: 'حدد الدفعة المقدمة',
                controller: _downPaymentController,
              ),
              const SizedBox(height: 6),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '0.0% الحد الأدنى للدفعة المقدمة',
                  style: TextStyle(
                    color: Color(0xFF0A5276),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // ── Duration Label ──
              const Text(
                'حدد مدة التمويل (بالأشهر)',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),

              // ── Stepper ──
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        child: Text(
                          '$_duration',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () => setState(() {
                              _duration++;
                              _selectedChip = null;
                            }),
                            child: const Icon(Icons.arrow_drop_up, size: 27),
                          ),
                          Transform.translate(
                            offset: const Offset(0, -3),
                            child: InkWell(
                              onTap: () => setState(() {
                                if (_duration > 1) {
                                  _duration--;
                                  _selectedChip = null;
                                }
                              }),
                              child: const Icon(
                                Icons.arrow_drop_down,
                                size: 27,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 2),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // ── Chips label ──
              const Text(
                'أو اختر من فترات الائتمان المحددة مسبقاً',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              // Chips Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 3.2,
                  crossAxisSpacing: 3.2,
                  childAspectRatio: 2,
                ),
                itemCount: chips.length,
                itemBuilder: (context, index) {
                  final chip = chips[index];
                  final isSelected = _selectedChip == chip;
                  return GestureDetector(
                    onTap: () => setState(() {
                      _selectedChip = chip;
                      _duration = chip;
                    }),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF0A5276)
                            : Colors.grey.shade100,
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFFF2F6F9)
                              : Colors.grey.shade300,
                          width: 0.2,
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Center(
                        child: Text(
                          '$chip',
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF435B6B),
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),

              // ── Calculate Button ──
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A5276),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'احسب القسط الشهري',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFF2F6F9),

                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          '0.0',
                          style: TextStyle(
                            color: Color(0xFFF5A623),
                            fontSize: 16,
                          ),
                        ),
                        Text('القسط الشهري', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 15),

                    _buildResultRow('مبلغ التمويل', ''),
                    _buildResultRow('معدل الربح', '0.0%'),
                    _buildResultRow('مبلغ الربح', ''),
                    _buildResultRow('المبلغ الاجمالي المستحق', ''),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 13),
        ),
        items: items
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(e),
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
        icon: const Icon(Icons.keyboard_arrow_down),
        isExpanded: true,
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        textDirection: TextDirection.ltr,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: InputBorder.none,
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 13),
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ),
    );
  }

  Widget _buildResultRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
