import 'package:flutter/material.dart';

import '../../../res/colors/app_colors.dart';

class RestockItemTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool showHighlight;
  final VoidCallback onRestockPressed;

  const RestockItemTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.showHighlight = false,
    required this.onRestockPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          // Icon
          Icon(
            icon,
            color: AppColors.appBarColor,
            size: 24,
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
                  style: TextStyle(
                    color: showHighlight
                        ? AppColors.buttonBlue
                        : AppColors.subtitleGrey,
                    fontSize: 12,
                    fontWeight:
                    showHighlight ? FontWeight.w500 : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),

          // Restock Button
          ElevatedButton(
            onPressed: onRestockPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonBlue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Restock',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}