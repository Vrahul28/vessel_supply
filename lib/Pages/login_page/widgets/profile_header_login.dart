import 'package:flutter/material.dart';
import '../../../res/app_spacing/app_spacing.dart';
import '../../../res/colors/app_colors.dart';

class ProfileHeaderLogin extends StatelessWidget {
  final VoidCallback onPressed;

  const ProfileHeaderLogin({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: 26,
              backgroundColor: AppColors.appBarColor,
              backgroundImage: const NetworkImage(
                'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop',
              ),
              onBackgroundImageError: (exception, stackTrace) {
                // Fallback icon if image fails
              },
            ),
            const SizedBox(width: AppSpacing.md),

            // Profile Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Vessel Profile',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.darkText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    'Aurora',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.subtitleGrey,
                    ),
                  ),
                ],
              ),
            ),

            // Chevron Icon
            Icon(
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