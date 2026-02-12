import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vessel_supply/res/routes_name/routes_name.dart';
import '../../res/app_spacing/app_spacing.dart';
import '../../res/colors/app_colors.dart';
import '../../widgets/custom_app_bar.dart';


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
                label: 'Select Items',
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

// Header Panel Widget
class HeaderPanel extends StatelessWidget {
  const HeaderPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: const BoxDecoration(
        color: AppColors.appBarColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Row(
          children: [
            // Back Button
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.lg),
            // Title
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Request',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: AppSpacing.xs),
                  Text(
                    'Create a new supply request',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Form Label Widget
class FormLabel extends StatelessWidget {
  final String label;

  const FormLabel({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: AppColors.darkText,
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.3,
      ),
    );
  }
}

// Rounded Dropdown Field Widget
class RoundedDropdownField extends StatelessWidget {
  final String? value;
  final List<String> items;
  final Function(String?) onChanged;

  const RoundedDropdownField({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ))
          .toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.lightGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        suffixIcon: const Padding(
          padding: EdgeInsets.only(right: AppSpacing.md),
          child: Icon(
            Icons.arrow_drop_down,
            color: AppColors.subtitleGrey,
          ),
        ),
      ),
      style: const TextStyle(
        color: AppColors.darkText,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

// Date Picker Field Widget
class DatePickerField extends StatelessWidget {
  final TextEditingController controller;
  final Function(DateTime) onDateSelected;

  const DatePickerField({
    super.key,
    required this.controller,
    required this.onDateSelected,
  });

  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2026),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.appBarColor,
              onPrimary: Colors.white,
              onSurface: AppColors.darkText,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      onDateSelected(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      onTap: () => _selectDate(context),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.lightGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        suffixIcon: const Padding(
          padding: EdgeInsets.only(right: AppSpacing.md),
          child: Icon(
            Icons.calendar_today,
            color: AppColors.subtitleGrey,
            size: 20,
          ),
        ),
      ),
      style: const TextStyle(
        color: AppColors.darkText,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

// Priority Selector Field Widget
class PrioritySelectorField extends StatelessWidget {
  final String value;
  final Function(String) onChanged;

  const PrioritySelectorField({
    super.key,
    required this.value,
    required this.onChanged,
  });

  void _showPriorityBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Priority',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: AppSpacing.lg),
            ...['Low Priority', 'Medium Priority', 'High Priority']
                .map(
                  (priority) => GestureDetector(
                    onTap: () {
                      onChanged(priority);
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                        vertical: AppSpacing.md,
                      ),
                      margin: const EdgeInsets.only(bottom: AppSpacing.md),
                      decoration: BoxDecoration(
                        color: value == priority
                            ? AppColors.appBarColor.withOpacity(0.1)
                            : AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(12),
                        border: value == priority
                            ? Border.all(
                                color: AppColors.appBarColor,
                                width: 2,
                              )
                            : null,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            priority,
                            style: TextStyle(
                              color: value == priority
                                  ? AppColors.appBarColor
                                  : AppColors.darkText,
                              fontWeight: value == priority
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                            ),
                          ),
                          if (value == priority)
                            const Icon(
                              Icons.check_circle,
                              color: AppColors.appBarColor,
                            ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
            const SizedBox(height: AppSpacing.lg),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPriorityBottomSheet(context),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value,
              style: const TextStyle(
                color: AppColors.darkText,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Icon(
              Icons.info_outline,
              color: AppColors.subtitleGrey,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

// Remarks Field Widget
class RemarksField extends StatelessWidget {
  final TextEditingController controller;

  const RemarksField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 5,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.lightGrey,
        hintText: 'Need supplies urgently for next voyage.',
        hintStyle: const TextStyle(
          color: AppColors.subtitleGrey,
          fontSize: 13,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.all(AppSpacing.lg),
      ),
      style: const TextStyle(
        color: AppColors.darkText,
        fontSize: 13,
      ),
    );
  }
}

// Primary Button Widget
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.appBarColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          shadowColor: AppColors.appBarColor.withOpacity(0.4),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}
