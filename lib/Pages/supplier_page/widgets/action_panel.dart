import 'package:flutter/material.dart';
import '../../../res/app_spacing/app_spacing.dart';
import '../../../res/colors/app_colors.dart';
import '../../../widgets/custom_primary_button.dart';
import 'action_tile.dart';

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
              text: 'Cancel',
              onPressed: onCancel,
            ),
          ],
        ),
      ),
    );
  }
}