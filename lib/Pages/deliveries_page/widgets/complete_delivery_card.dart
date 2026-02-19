import 'package:flutter/material.dart';

import '../../../res/colors/app_colors.dart';
import 'delivery_item_row.dart';

class CompletedDeliveryCard extends StatelessWidget {
  final String supplierName;
  final String completedDate;
  final List<String> items;

  const CompletedDeliveryCard({
    super.key,
    required this.supplierName,
    required this.completedDate,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                // Icon
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.folder,
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
                        supplierName,
                        style: const TextStyle(
                          color: AppColors.darkText,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        completedDate,
                        style: const TextStyle(
                          color: AppColors.subtitleGrey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Divider
          Divider(
            height: 1,
            indent: 14,
            endIndent: 14,
            color: AppColors.lightGrey,
          ),

          // Items List
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: items.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: DeliveryItemRow(item: item),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}