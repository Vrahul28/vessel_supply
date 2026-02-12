import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/res/routes_name/routes_name.dart';
import '../../res/app_spacing/app_spacing.dart';
import '../../res/colors/app_colors.dart';
import '../../widgets/custom_app_bar.dart';

// Spacing Constants


// Summary Item Model
class SummaryItem {
  final String name;
  final String quantity;

  SummaryItem({required this.name, required this.quantity});
}

// Review & Confirm Page
class ReviewConfirmPage extends StatefulWidget {
  const ReviewConfirmPage({super.key});

  @override
  State<ReviewConfirmPage> createState() => _ReviewConfirmPageState();
}

class _ReviewConfirmPageState extends State<ReviewConfirmPage> {
  final List<SummaryItem> summaryItems = [
    SummaryItem(name: 'Canned Meat', quantity: '10'),
    SummaryItem(name: 'Fresh Vegetables', quantity: '5 Crates'),
    SummaryItem(name: 'Rope & Cables', quantity: '200m'),
    SummaryItem(name: 'Safety Gloves', quantity: '20 Pairs'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: CustomAppBar(
        text: 'Review & Confirm',
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
            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSpacing.lg),

                    // Delivery Information Card
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      child: Column(
                        children: [
                          InfoRow(
                            label: 'Delivery Port:',
                            value: 'Singapore',
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          InfoRow(
                            label: 'Required Date:',
                            value: '20 Jul 2024',
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          InfoRow(
                            label: 'Priority:',
                            value: 'High',
                            valueColor: AppColors.redNotification,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxl),

                    // Order Summary Section
                    Text(
                      'Order Summary',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.darkText,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      child: Column(
                        children: summaryItems
                            .asMap()
                            .entries
                            .map(
                              (entry) => Padding(
                                padding: EdgeInsets.only(
                                  bottom: entry.key != summaryItems.length - 1
                                      ? AppSpacing.md
                                      : 0,
                                ),
                                child: SummaryItemRow(
                                  item: entry.value,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxl),

                    // Special Instructions Section
                    Text(
                      'Special Instructions',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.darkText,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    InstructionBox(
                      text: 'Deliver by 8 AM before departure.',
                      controller: TextEditingController(
                          text: 'Deliver by 8 AM before departure.'),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom Action Buttons
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
          left: AppSpacing.lg,
          right: AppSpacing.lg,
          bottom: MediaQuery.of(context).padding.bottom + AppSpacing.lg,
          top: AppSpacing.lg,
        ),
        child: Row(
          children: [
            // Back Button
            Expanded(
              child: SecondaryButton(
                label: 'Back',
                onPressed: () {
                  debugPrint('Back pressed');
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(width: AppSpacing.lg),
            // Submit Button
            Expanded(
              child: PrimaryButton(
                label: 'Submit Request',
                onPressed: () {
                  Get.toNamed(RoutesName.requestSentPage);
                  // debugPrint('Request Submitted');
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(
                  //     content: Text('Request submitted successfully!'),
                  //     duration: Duration(seconds: 2),
                  //   ),
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Info Row Widget
class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.subtitleGrey,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: valueColor ?? AppColors.darkText,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

// Summary Item Row Widget
class SummaryItemRow extends StatelessWidget {
  final SummaryItem item;

  const SummaryItemRow({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Check Icon
        Icon(
          Icons.check,
          color: AppColors.successGreen,
          size: 20,
        ),
        const SizedBox(width: AppSpacing.md),

        // Item Details
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: item.name,
                  style: const TextStyle(
                    color: AppColors.darkText,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ' × ${item.quantity}',
                  style: const TextStyle(
                    color: AppColors.subtitleGrey,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Instruction Box Widget
class InstructionBox extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  const InstructionBox({
    super.key,
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 5,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
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
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.successGreen,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        elevation: 4,
        shadowColor: AppColors.successGreen.withOpacity(0.4),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}

// Secondary Button Widget
class SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const SecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.darkText,
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        side: const BorderSide(
          color: AppColors.lightGrey,
          width: 1.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
