import 'package:flutter/material.dart';

class AdditionalPersonalDetailsScreen extends StatefulWidget {
  const AdditionalPersonalDetailsScreen({super.key});

  @override
  State<AdditionalPersonalDetailsScreen> createState() =>
      _AdditionalPersonalDetailsScreenState();
}

class _AdditionalPersonalDetailsScreenState
    extends State<AdditionalPersonalDetailsScreen> {
  String? _title;
  String? _salaryDay;
  String? _bankName;
  final TextEditingController _employeeNameController = TextEditingController();

  String _accommodation = 'Foreigner';
  String _education = 'High';
  String _jobDesignation = 'Private';
  int _dependants = 1;
  String _maritalStatus = 'Single';

  final List<String> titles = ['Mr.', 'Mrs.', 'Ms.', 'Dr.'];
  final List<String> salaryDays = List.generate(28, (i) => '${i + 1}');
  final List<String> banks = [
    'Nizwe Bank',
    'Bank Muscat',
    'Alizz Islamic Bank',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.chevron_left, color: Colors.black),
        ),
        centerTitle: true,
        title: const Text(
          'Additional Personal Details',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel('Customer Title'),
                    _buildDropdown(_title, 'Customer Title', titles, (v) {
                      setState(() => _title = v);
                    }),
                    const SizedBox(height: 18),
                    _buildLabel('Employee Name'),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F3F6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _employeeNameController,
                        decoration: const InputDecoration(
                          hintText: 'Employee Name',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    _buildLabel('Salary Day'),
                    _buildDropdown(_salaryDay, 'Salary Day', salaryDays, (v) {
                      setState(() => _salaryDay = v);
                    }),
                    const SizedBox(height: 18),
                    _buildLabel('Name Of Bank Where Salary Is Paid'),
                    _buildDropdown(_bankName, 'Name Of Bank', banks, (v) {
                      setState(() => _bankName = v);
                    }),
                    const SizedBox(height: 18),
                    _buildLabel('Accommodation'),
                    Row(
                      children: [
                        _buildRadio('Foreigner', _accommodation, (v) {
                          setState(() => _accommodation = v);
                        }),
                        const SizedBox(width: 20),
                        _buildRadio('Citizen', _accommodation, (v) {
                          setState(() => _accommodation = v);
                        }),
                      ],
                    ),
                    const SizedBox(height: 18),
                    _buildLabel('Education Level'),
                    Row(
                      children: [
                        _buildRadio('High', _education, (v) {
                          setState(() => _education = v);
                        }),
                        const SizedBox(width: 20),
                        _buildRadio('Middle', _education, (v) {
                          setState(() => _education = v);
                        }),
                      ],
                    ),
                    const SizedBox(height: 18),
                    _buildLabel('Job Designation'),
                    Row(
                      children: [
                        _buildRadio('Private', _jobDesignation, (v) {
                          setState(() => _jobDesignation = v);
                        }),
                        const SizedBox(width: 20),
                        _buildRadio('Governmental', _jobDesignation, (v) {
                          setState(() => _jobDesignation = v);
                        }),
                      ],
                    ),
                    const SizedBox(height: 18),
                    _buildLabel('No. Of Dependants'),
                    Wrap(
                      spacing: 16,
                      children: List.generate(5, (i) {
                        final value = i + 1;
                        return _buildRadioInt(value, _dependants, (v) {
                          setState(() => _dependants = v);
                        });
                      }),
                    ),
                    const SizedBox(height: 18),
                    _buildLabel('Marital Status'),
                    Row(
                      children: [
                        _buildRadio('Single', _maritalStatus, (v) {
                          setState(() => _maritalStatus = v);
                        }),
                        const SizedBox(width: 20),
                        _buildRadio('Married', _maritalStatus, (v) {
                          setState(() => _maritalStatus = v);
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/final-review');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF366F8C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  fixedSize: const Size(double.infinity, 52),
                ),

                child: const Text(
                  'Proceed To Summary Page',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }

  Widget _buildDropdown(
    String? value,
    String hint,
    List<String> items,
    Function(String?) onChanged,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF1F3F6),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
        items: items
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
        icon: const Icon(Icons.keyboard_arrow_down),
        isExpanded: true,
      ),
    );
  }

  Widget _buildRadio(String label, String groupValue, Function(String) onTap) {
    return GestureDetector(
      onTap: () => onTap(label),
      child: Row(
        children: [
          Radio<String>(
            value: label,
            groupValue: groupValue,
            activeColor: const Color(0xFF366F8C),
            onChanged: (v) => onTap(v!),
          ),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildRadioInt(int value, int groupValue, Function(int) onTap) {
    return GestureDetector(
      onTap: () => onTap(value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio<int>(
            value: value,
            groupValue: groupValue,
            activeColor: const Color(0xFF366F8C),
            onChanged: (v) => onTap(v!),
          ),
          Text('$value'),
        ],
      ),
    );
  }
}
