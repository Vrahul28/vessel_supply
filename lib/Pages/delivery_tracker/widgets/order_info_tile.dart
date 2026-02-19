import 'package:flutter/material.dart';

class OrderInfoTile extends StatelessWidget {
  final String supplierName;
  final String poNumber;
  final VoidCallback onTap;
  final bool showDivider;

  const OrderInfoTile({
    super.key,
    required this.supplierName,
    required this.poNumber,
    required this.onTap,
    required this.showDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                children: [
                  // Supplier Name
                  Expanded(
                    child: Text(
                      supplierName,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1F1F1F),
                      ),
                    ),
                  ),
                  // PO Number
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 6.0,
                      ),
                      child: Text(
                        poNumber,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF616161),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  // Chevron
                  const Icon(
                    Icons.chevron_right,
                    color: Color(0xFFBDBDBD),
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (showDivider)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(
              height: 1,
              color: const Color(0xFFE0E0E0),
              thickness: 1,
            ),
          ),
      ],
    );
  }
}