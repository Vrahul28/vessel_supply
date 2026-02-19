import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../res/app_spacing/app_spacing.dart';
import '../../../res/colors/app_colors.dart';
import '../../../widgets/custom_app_bar.dart';
import '../widgets/action_panel.dart';
import '../widgets/arrival_badge.dart';
import '../widgets/shipment_item_card.dart';

enum ButtonVariant { primary, secondary }
// Delivery Details Screen
class SupplierPage extends StatefulWidget {
  const SupplierPage({super.key});

  @override
  State<SupplierPage> createState() => _SupplierPageState();
}

class _SupplierPageState extends State<SupplierPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.appBarColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F7),
      appBar: CustomAppBar(
        text: 'Supplier Page',
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
                child: Column(
                  children: [
                    const SizedBox(height: AppSpacing.lg),
                    // Arrival Status Banner
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                      ),
                      child: const ArrivalBadge(),
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    // Section Title
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'SHIPMENT DETAILS',
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: AppColors.subtitleGrey,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    // Shipment Items
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                      ),
                      child: Column(
                        children: [
                          ShipmentItemCard(
                            imageUrl:
                                'https://sb.kaleidousercontent.com/67418/1920x1100/3a96a6f97b/transparent.png',
                            title: 'Cleaning Rags',
                            subtitle: '50 pcs',
                            showWarning: true,
                            warningText: 'Low stock',
                            onRestockPressed: () {
                              _showActionPanel();
                            },
                          ),
                          const SizedBox(height: AppSpacing.md),
                          ShipmentItemCard(
                            imageUrl:
                                'https://sb.kaleidousercontent.com/67418/1920x1100/3a96a6f97b/transparent.png',
                            title: 'Batteries',
                            subtitle: 'Pack of 12',
                            onRestockPressed: () {
                              _showActionPanel();
                            },
                          ),
                          const SizedBox(height: AppSpacing.md),
                          ShipmentItemCard(
                            imageUrl:
                                'https://sb.kaleidousercontent.com/67418/1920x1100/3a96a6f97b/transparent.png',
                            title: 'Engine Oil',
                            subtitle: '5 Gallons',
                            onRestockPressed: () {
                              _showActionPanel();
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxl),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showActionFeedback(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showActionPanel() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSpacing.xxl),
          topRight: Radius.circular(AppSpacing.xxl),
        ),
      ),
      builder: (BuildContext context) {
        return ActionPanelContent(
          onMarkAsReceived: () {
            _showActionFeedback('Marked as Received');
            Navigator.pop(context);
          },
          onUpdateETA: () {
            _showActionFeedback('Update ETA tapped');
            Navigator.pop(context);
          },
          onContactSupplier: () {
            _showActionFeedback('Contact Supplier tapped');
            Navigator.pop(context);
          },
          onViewPackingList: () {
            _showActionFeedback('View Packing List tapped');
            Navigator.pop(context);
          },
          onCancel: () => Navigator.pop(context),
        );
      },
    );
  }
}





