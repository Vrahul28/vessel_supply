import 'package:flutter/material.dart';
import '../../../res/colors/app_colors.dart';

class DeliveryItemRow extends StatelessWidget {
  final String item;

  const DeliveryItemRow({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Item Text
        Expanded(
          child: Text(
            item,
            style: const TextStyle(
              color: AppColors.darkText,
              fontSize: 13,
            ),
          ),
        ),
        const SizedBox(width: 8),

        // Check Icon
        Container(
          decoration: BoxDecoration(
            color: AppColors.successGreen,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(4),
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 14,
          ),
        ),
      ],
    );
  }
}