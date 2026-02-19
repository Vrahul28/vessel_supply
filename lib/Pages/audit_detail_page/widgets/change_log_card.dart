import 'package:flutter/material.dart';

class ChangeLogCard extends StatelessWidget {
  const ChangeLogCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Audit Details',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1F1F1F),
              ),
            ),
            const SizedBox(height: 10),
            const Divider(color: Color(0xFFECEFF1)),
            const SizedBox(height: 10),
            _changeRow('Item Quantity Updated', '2 → 1'),
            const SizedBox(height: 8),
            _changeRow('Gas Detector', '1'),
          ],
        ),
      ),
    );
  }

  Widget _changeRow(String left, String right) {
    final bool isChanged = right.contains('→') || right == '1';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            left,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF424242),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          right,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: isChanged ? const Color(0xFFD32F2F) : const Color(0xFF424242),
          ),
        ),
      ],
    );
  }
}