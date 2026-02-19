import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/routes_name/routes_name.dart';

class DeliveryDetailsCard extends StatelessWidget {
  const DeliveryDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Delivery Title
            const Text(
              'Delivery #78342',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF212121),
              ),
            ),
            const SizedBox(height: 16.0),
            // Supplier
            _buildDeliveryInfoRow(
              icon: Icons.business,
              title: 'Supplier ABC',
              trailing: Icons.chevron_right,
              onTap: () {
                Get.toNamed(RoutesName.deliveryNoPage);
              },
            ),
            const SizedBox(height: 16.0),
            // Divider
            Divider(
              height: 1,
              color: const Color(0xFFE0E0E0),
              thickness: 1,
            ),
            const SizedBox(height: 16.0),
            // Items
            _buildItemRow(
              title: 'Cleaning Rags',
              quantity: '50 pcs',
              quantityColor: const Color(0xFFD32F2F),
            ),
            const SizedBox(height: 12.0),
            _buildItemRow(
              title: 'Batteries',
              quantity: '3 boxes',
            ),
            const SizedBox(height: 12.0),
            _buildItemRow(
              title: 'Engine Oil',
              quantity: '100 L',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryInfoRow({
    required IconData icon,
    required String title,
    required IconData trailing,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2FD),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                icon,
                color: const Color(0xFF1976D2),
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xFF212121),
              ),
            ),
          ),
          Icon(
            trailing,
            color: const Color(0xFFBDBDBD),
            size: 24,
          ),
        ],
      ),
    );
  }

  Widget _buildItemRow({
    required String title,
    required String quantity,
    Color quantityColor = const Color(0xFF212121),
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF212121),
                ),
              ),
              const SizedBox(height: 2.0),
              Text(
                quantity,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: quantityColor,
                ),
              ),
            ],
          ),
        ),
        const Icon(
          Icons.chevron_right,
          color: Color(0xFFBDBDBD),
          size: 20,
        ),
      ],
    );
  }
}