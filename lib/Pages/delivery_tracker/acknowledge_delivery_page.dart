import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/colors/app_colors.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_primary_button.dart';


class AcknowledgeDeliveryPage extends StatefulWidget {
  const AcknowledgeDeliveryPage({super.key});

  @override
  State<AcknowledgeDeliveryPage> createState() =>
      _AcknowledgeDeliveryPageState();
}

class _AcknowledgeDeliveryPageState extends State<AcknowledgeDeliveryPage> {
  bool isMarkedAsReceived = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: CustomAppBar(
        text: 'Acknowledge Delivery',
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
                  children: [
                    const SizedBox(height: 16.0),
                    // Delivery Info Card
                    const DeliveryInfoCard(),
                    const SizedBox(height: 20.0),
                    // Map Preview
                    _buildMapPreview(),
                    const SizedBox(height: 20.0),
                    // Shipment Overview Section
                    const SizedBox(height: 20.0),
                    // Section Title
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Shipment Overview',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF212121),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    // Item Tiles
                    ShipmentItemTile(
                      icon: Icons.inventory_2_outlined,
                      title: 'Cleaning Rags',
                      subtitle: 'Deck Supplies',
                      quantity: '50 pcs',
                      onTap: () {},
                    ),
                    const SizedBox(height: 12.0),
                    ShipmentItemTile(
                      icon: Icons.battery_std,
                      title: 'Batteries',
                      subtitle: 'AA & AAA Packs',
                      quantity: '3 boxes',
                      onTap: () {},
                    ),
                    const SizedBox(height: 16.0),
                    // Marked as Received Row
                    _buildMarkedAsReceivedRow(),
                    const SizedBox(height: 24.0),
                    // Confirm Button
                    PrimaryButton(
                      text: 'Confirm All Items',
                      backgroundColor: AppColors.appBarColor,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('All items confirmed!'),
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

  Widget _buildMapPreview() {
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

  Widget _buildMarkedAsReceivedRow() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              isMarkedAsReceived = !isMarkedAsReceived;
            });
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              children: [
                Icon(
                  isMarkedAsReceived
                      ? Icons.check_box
                      : Icons.check_box_outlined,
                  color: const Color(0xFF4CAF50),
                  size: 24,
                ),
                const SizedBox(width: 12.0),
                const Expanded(
                  child: Text(
                    'Marked as Received',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF212121),
                    ),
                  ),
                ),
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
    );
  }
}


// Delivery Info Card Widget
class DeliveryInfoCard extends StatelessWidget {
  const DeliveryInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          children: [
            // Arrived Badge
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFDFF3E4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 6.0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Color(0xFF4CAF50),
                      size: 16,
                    ),
                    const SizedBox(width: 6.0),
                    const Text(
                      'Arrived!',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4CAF50),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            // Delivery Number Title
            const Text(
              'Delivery #78342',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1F1F1F),
              ),
            ),
            const SizedBox(height: 10.0),
            // Location Details
            const Text(
              'Singapore Port, Terminal 3',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF616161),
              ),
            ),
            const SizedBox(height: 4.0),
            const Text(
              'Today, 2:32 PM',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Color(0xFF9E9E9E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Shipment Item Tile Widget
class ShipmentItemTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String quantity;
  final VoidCallback onTap;

  const ShipmentItemTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.quantity,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
    );
  }
}

