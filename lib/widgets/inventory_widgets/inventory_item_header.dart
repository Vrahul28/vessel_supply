import 'package:flutter/material.dart';

class ItemHeader extends StatelessWidget {
  final String stockCount;
  final bool isLowStock;
  final String reorderPoint;

  const ItemHeader({
    super.key,
    required this.stockCount,
    this.isLowStock = false,
    required this.reorderPoint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          // Stock Count with Orange Highlight
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                stockCount,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFC77B30),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'pcs left',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Low Stock Warning
          if (isLowStock)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.15),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.amber.withOpacity(0.5),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.amber[800],
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Low stock',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.amber[800],
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 12),
          // Reorder Info
          Text(
            'Reorder Point: $reorderPoint pcs',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
