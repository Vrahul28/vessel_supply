import 'package:flutter/material.dart';
import 'package:vessel_supply/widgets/custom_appbar.dart';
import 'package:get/get.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/priority_selector.dart';
import '../widgets/attach_photo_card.dart';

class NewRequestPage extends StatefulWidget {
  const NewRequestPage({super.key});

  @override
  State<NewRequestPage> createState() => _NewRequestPageState();
}

class _NewRequestPageState extends State<NewRequestPage> {
  String _department = 'Engine Department';
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _quantityController =
      TextEditingController(text: '1');
  final TextEditingController _notesController = TextEditingController();
  String _priority = 'Routine';

  @override
  void dispose() {
    _itemController.dispose();
    _quantityController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      appBar: CustomAppBarActiveRFQ(
        title: 'New Request',
        onBackPressed: () {
          Get.back();
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 16, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Department Dropdown
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Department',
                      style: TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 52,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.02),
                            blurRadius: 6,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: DropdownButtonFormField<String>(
                        value: _department,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        items: const [
                          DropdownMenuItem(
                              value: 'Engine Department',
                              child: Text('Engine Department')),
                          DropdownMenuItem(
                              value: 'Electrical Department',
                              child: Text('Electrical Department')),
                          DropdownMenuItem(
                              value: 'Deck Department',
                              child: Text('Deck Department')),
                        ],
                        onChanged: (v) {
                          if (v == null) return;
                          setState(() => _department = v);
                        },
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: Color(0xFF6B7280)),
                      ),
                    ),
                  ],
                ),
              ),

              // Item Name
              LabeledTextField(
                label: 'Item Name',
                hint: 'e.g. Hydraulic Pump Seal',
                controller: _itemController,
              ),

              // Quantity + Priority Row
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    // Quantity
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Quantity',
                            style: TextStyle(
                                fontSize: 13, color: Color(0xFF6B7280))),
                        const SizedBox(height: 8),
                        Container(
                          width: 120,
                          height: 52,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: TextFormField(
                            controller: _quantityController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 14)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    // Priority
                    PrioritySelector(
                      initial: _priority,
                      onChanged: (v) => setState(() => _priority = v),
                    ),
                  ],
                ),
              ),

              // Attach Photo Card
              AttachPhotoCard(onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Attach tapped')));
              }),

              // Notes
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Notes',
                        style:
                            TextStyle(fontSize: 13, color: Color(0xFF6B7280))),
                    const SizedBox(height: 8),
                    Container(
                      height: 120,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: TextFormField(
                        controller: _notesController,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          hintText: 'Add specification details...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Submit Button
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E5C89),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 2,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('Request submitted: $_itemController.text'),
                        ),
                      );
                    },
                    child: const Text(
                      'Submit Request',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
