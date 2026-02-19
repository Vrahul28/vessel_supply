import 'package:flutter/material.dart';
import '../../../res/app_spacing/app_spacing.dart';
import '../../../res/colors/app_colors.dart';
import '../model/summary_item.dart';


class SummaryItemRow extends StatelessWidget {
  final SummaryItem item;

  const SummaryItemRow({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Check Icon
        Icon(
          Icons.check,
          color: AppColors.successGreen,
          size: 20,
        ),
        const SizedBox(width: AppSpacing.md),
        // Item Details
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: item.name,
                  style: const TextStyle(
                    color: AppColors.darkText,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ' × ${item.quantity}',
                  style: const TextStyle(
                    color: AppColors.subtitleGrey,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}