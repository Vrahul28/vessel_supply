import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/res/routes_name/routes_name.dart';
import '../../../res/app_spacing/app_spacing.dart';
import '../../../res/colors/app_colors.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_primary_button.dart';
import '../model/summary_item.dart';
import '../widgets/info_row.dart';
import '../widgets/instruction_box.dart';
import '../widgets/summary_item_row.dart';


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
              child: PrimaryButton(
                text: 'Back',
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
                text: 'Submit Request',
                onPressed: () {
                  Get.toNamed(RoutesName.requestSentPage);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}







