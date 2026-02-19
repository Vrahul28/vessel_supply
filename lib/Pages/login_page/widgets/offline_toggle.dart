import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../res/app_spacing/app_spacing.dart';
import '../../../res/colors/app_colors.dart';


class OfflineToggleRow extends StatelessWidget {
  final bool isEnabled;
  final Function(bool) onChanged;

  const OfflineToggleRow({
    super.key,
    required this.isEnabled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.check_circle,
          color: isEnabled ? AppColors.successGreen : AppColors.lightGrey,
          size: 18,
        ),
        const SizedBox(width: AppSpacing.sm),
        Text(
          'Offline Mode',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.darkText,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        CupertinoSwitch(
          value: isEnabled,
          onChanged: onChanged,
          activeColor: AppColors.successGreen,
        ),
      ],
    );
  }
}