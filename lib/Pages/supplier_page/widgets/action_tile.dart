import 'package:flutter/material.dart';

import '../../../res/app_spacing/app_spacing.dart';
import '../../../res/colors/app_colors.dart';

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