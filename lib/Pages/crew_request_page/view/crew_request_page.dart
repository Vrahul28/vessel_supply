import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vessel_supply/res/routes_name/routes_name.dart';
import '../../../res/app_spacing/app_spacing.dart';
import '../../../res/colors/app_colors.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_primary_button.dart';
import '../widgets/date_picker_field.dart';
import '../widgets/form_label.dart';
import '../widgets/prioroty_selector_field.dart';
import '../widgets/remarks_field.dart';
import '../widgets/rounded_dropdown_field.dart';


// Crew Request Page
class CrewRequestPage extends StatefulWidget {
  const CrewRequestPage({super.key});

  @override
  State<CrewRequestPage> createState() => _CrewRequestPageState();
}

class _CrewRequestPageState extends State<CrewRequestPage> {
  late GlobalKey<FormState> formKey;
  late TextEditingController dateController;
  late TextEditingController remarksController;

  String? selectedPort = 'Singapore (SGSIN)';
  String selectedPriority = 'High Priority';

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    dateController = TextEditingController(text: '20 Jul 2024');
    remarksController = TextEditingController(
      text: 'Need supplies urgently for next voyage.',
    );
  }

  @override
  void dispose() {
    dateController.dispose();
    remarksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: CustomAppBar(
        text: 'Crew Request',
        iconButton2: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Scrollable Form Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: AppSpacing.lg),
                child: Column(
                  children: [
                    // Main Form Card
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 16,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Delivery Port Field
                            FormLabel(label: 'Delivery Port'),
                            const SizedBox(height: AppSpacing.sm),
                            RoundedDropdownField(
                              value: selectedPort,
                              items: [
                                'Singapore (SGSIN)',
                                'Port Klang (MYPK)',
                                'Hong Kong (HKHKG)',
                                'Shanghai (CNSHA)',
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedPort = value;
                                });
                              },
                            ),
                            const SizedBox(height: AppSpacing.xl),

                            // Required Date Field
                            FormLabel(label: 'Required Date'),
                            const SizedBox(height: AppSpacing.sm),
                            DatePickerField(
                              controller: dateController,
                              onDateSelected: (date) {
                                final formatted =
                                    DateFormat('dd MMM yyyy').format(date);
                                dateController.text = formatted;
                              },
                            ),
                            const SizedBox(height: AppSpacing.xl),
                            // Priority Field
                            FormLabel(label: 'Priority'),
                            const SizedBox(height: AppSpacing.sm),
                            PrioritySelectorField(
                              value: selectedPriority,
                              onChanged: (value) {
                                setState(() {
                                  selectedPriority = value;
                                });
                              },
                            ),
                            const SizedBox(height: AppSpacing.xl),
                            // Notes / Remarks Field
                            FormLabel(label: 'Notes / Remarks'),
                            const SizedBox(height: AppSpacing.sm),
                            RemarksField(
                              controller: remarksController,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: AppSpacing.xxl),
                  ],
                ),
              ),
            ),

            // Bottom Action Button
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: PrimaryButton(
                text: 'Select Items',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    debugPrint('═════ FORM VALUES ═════');
                    debugPrint('Delivery Port: $selectedPort');
                    debugPrint('Required Date: ${dateController.text}');
                    debugPrint('Priority: $selectedPriority');
                    debugPrint('Remarks: ${remarksController.text}');
                    debugPrint('══════════════════════');

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Form submitted successfully!'),
                        duration: Duration(seconds: 2),
                      ),
                    );

                    Get.toNamed(RoutesName.selectItemsPage);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



