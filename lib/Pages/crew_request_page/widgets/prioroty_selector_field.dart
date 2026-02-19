import 'package:flutter/material.dart';
import '../../../res/app_spacing/app_spacing.dart';
import '../../../res/colors/app_colors.dart';

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