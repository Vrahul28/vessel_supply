import 'package:flutter/material.dart';
import '../../../res/colors/app_colors.dart';

class SupplierCardDeliveryPage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool showChevron;
  final VoidCallback onPressed;

  const SupplierCardDeliveryPage({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.showChevron = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(14),
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
            // Icon Container
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: AppColors.appBarColor,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),

            // Title and Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.darkText,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: AppColors.subtitleGrey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            // Chevron Icon
            if (showChevron)
              const Icon(
                Icons.chevron_right,
                color: AppColors.subtitleGrey,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}