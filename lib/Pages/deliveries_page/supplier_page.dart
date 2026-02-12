import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../res/colors/app_colors.dart';
import '../../widgets/custom_app_bar.dart';

// Spacing Constants
class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
}

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
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
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

// Arrival Badge Widget
class ArrivalBadge extends StatelessWidget {
  const ArrivalBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.schedule,
            color: AppColors.successGreen,
            size: 18,
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            'Arriving today',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.successGreen,
                  fontWeight: FontWeight.w600,
                  fontSize: 15
                ),
          ),
        ],
      ),
    );
  }
}

// Shipment Item Card Widget
class ShipmentItemCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final bool showWarning;
  final String warningText;
  final VoidCallback onRestockPressed;

  const ShipmentItemCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    this.showWarning = false,
    this.warningText = '',
    required this.onRestockPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 56,
              height: 56,
              color: AppColors.lightGrey,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.lightGrey,
                    child: const Icon(
                      Icons.image_not_supported,
                      color: AppColors.subtitleGrey,
                      size: 24,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),

          // Item Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.darkText,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.subtitleGrey,
                      ),
                ),
                if (showWarning) ...[
                  const SizedBox(height: AppSpacing.xs),
                  Row(
                    children: [
                      const Icon(
                        Icons.warning_rounded,
                        color: AppColors.successGreen,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        warningText,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: AppColors.successGreen,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.md),

          // Restock Button
          ElevatedButton(
            onPressed: onRestockPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.appBarColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.sm,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: Text(
              'Restock',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

// Action Panel Widget
class ActionPanelContent extends StatelessWidget {
  final VoidCallback onMarkAsReceived;
  final VoidCallback onUpdateETA;
  final VoidCallback onContactSupplier;
  final VoidCallback onViewPackingList;
  final VoidCallback onCancel;

  const ActionPanelContent({
    super.key,
    required this.onMarkAsReceived,
    required this.onUpdateETA,
    required this.onContactSupplier,
    required this.onViewPackingList,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Mark as Received Action
            ActionTile(
              icon: Icons.check_circle,
              iconColor: AppColors.successGreen,
              title: 'Mark as Received',
              showArrow: false,
              onTap: onMarkAsReceived,
            ),

            // Divider
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
              child: Divider(
                height: 1,
                color: AppColors.lightGrey,
              ),
            ),

            // Update ETA Action
            ActionTile(
              icon: Icons.schedule,
              title: 'Update ETA',
              showArrow: true,
              onTap: onUpdateETA,
            ),

            // Divider
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
              child: Divider(
                height: 1,
                color: AppColors.lightGrey,
              ),
            ),

            // Contact Supplier Action
            ActionTile(
              icon: Icons.phone,
              title: 'Contact Supplier',
              showArrow: true,
              onTap: onContactSupplier,
            ),

            // Divider
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
              child: Divider(
                height: 1,
                color: AppColors.lightGrey,
              ),
            ),

            // View Packing List Action
            ActionTile(
              icon: Icons.description,
              title: 'View Packing List',
              showArrow: true,
              onTap: onViewPackingList,
            ),
            const SizedBox(height: AppSpacing.xl),
            // Cancel Button
            PrimaryButton(
              label: 'Cancel',
              onPressed: onCancel,
              variant: ButtonVariant.secondary,
            ),
          ],
        ),
      ),
    );
  }
}

// Action Tile Widget
class ActionTile extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String title;
  final bool showArrow;
  final VoidCallback onTap;

  const ActionTile({
    super.key,
    required this.icon,
    required this.title,
    this.iconColor,
    this.showArrow = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor ?? AppColors.appBarColor,
              size: 24,
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.darkText,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            if (showArrow)
              const Icon(
                Icons.chevron_right,
                color: AppColors.subtitleGrey,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}

// Primary Button Widget
enum ButtonVariant { primary, secondary }

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final ButtonVariant variant;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = ButtonVariant.primary,
  });

  @override
  Widget build(BuildContext context) {
    final isPrimary = variant == ButtonVariant.primary;

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? AppColors.appBarColor : AppColors.appBarColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
