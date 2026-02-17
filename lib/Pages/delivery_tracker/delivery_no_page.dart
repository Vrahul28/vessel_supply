import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/colors/app_colors.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_primary_button.dart';


class DeliveryNoPage extends StatelessWidget {
  const DeliveryNoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: CustomAppBar(
        text: 'Delivery #78342',
        iconButton2: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16.0),
                    // Map Banner
                    buildMapPreview(),
                    const SizedBox(height: 24.0),
                    // Items in Delivery Section
                    const Text(
                      'ITEMS IN DELIVERY',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF9E9E9E),
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    // Items Container
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          DeliveryItemTile(
                            icon: Icons.inventory_2_outlined,
                            title: 'Cleaning Rags',
                            subtitle: 'Deck Consumables',
                            quantity: '50 pcs',
                            onTap: () {},
                            showDivider: true,
                          ),
                          DeliveryItemTile(
                            icon: Icons.battery_std,
                            title: 'Batteries',
                            subtitle: 'AA & AAA Pack',
                            quantity: '3 boxes',
                            onTap: () {},
                            showDivider: true,
                          ),
                          DeliveryItemTile(
                            icon: Icons.opacity_outlined,
                            title: 'Engine Oil',
                            subtitle: 'Synthetic 5W-30',
                            quantity: '100 L',
                            onTap: () {},
                            showDivider: false,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    // Order Information Section
                    const Text(
                      'ORDER INFORMATION',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF9E9E9E),
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    // Order Information Container
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          OrderInfoTile(
                            supplierName: 'Supplier ABC',
                            poNumber: 'PO-8219',
                            onTap: () {},
                            showDivider: true,
                          ),
                          OrderInfoTile(
                            supplierName: 'Supplier XYZ',
                            poNumber: 'PO-7123',
                            onTap: () {},
                            showDivider: false,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    // Acknowledge Button
                    PrimaryButton(
                      text: 'Acknowledge Item',
                      backgroundColor: AppColors.appBarColor,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Item acknowledged!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// Map Banner Widget
 Widget buildMapPreview() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.grey[300]!,
              Colors.grey[400]!,
            ],
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.map,
            size: 48,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

// Delivery Item Tile Widget
class DeliveryItemTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String quantity;
  final VoidCallback onTap;
  final bool showDivider;

  const DeliveryItemTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.quantity,
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
                  // Icon Box
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Icon(
                        icon,
                        color: const Color(0xFF616161),
                        size: 24,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  // Title and Subtitle
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1F1F1F),
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF9E9E9E),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Quantity Badge
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3F2FD),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 6.0,
                      ),
                      child: Text(
                        quantity,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1976D2),
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

// Order Information Tile Widget
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

