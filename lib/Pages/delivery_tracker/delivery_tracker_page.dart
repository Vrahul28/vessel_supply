import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/res/routes_name/routes_name.dart';

import '../../res/colors/app_colors.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_primary_button.dart';
import '../../widgets/search_widget.dart';

class DeliveryTrackerPage extends StatefulWidget {
  const DeliveryTrackerPage({super.key});

  @override
  State<DeliveryTrackerPage> createState() => _DeliveryTrackerPageState();
}

class _DeliveryTrackerPageState extends State<DeliveryTrackerPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: CustomAppBar(
        text: 'Delivery Tracker',
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
                    // Search Bar
                    SearchBarWidget(hintText: 'Search deliveries...'),
                    const SizedBox(height: 24.0),
                    // Delivery Progress Timeline
                    const TimelineCard(),
                    const SizedBox(height: 24.0),
                    // Delivery Details Section
                    const DeliveryDetailsCard(),
                    const SizedBox(height: 24.0),
                    // Acknowledge Button
                    PrimaryButton(
                      text: 'Acknowledge Delivery',
                      backgroundColor: AppColors.appBarColor,
                      onPressed: () {
                        Get.toNamed(RoutesName.acknowledgeDeliveryPage);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Delivery acknowledged!'),
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


// Timeline Card Widget
class TimelineCard extends StatelessWidget {
  const TimelineCard({super.key});

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
            _buildTimelineStep(
              stepNumber: 1,
              icon: Icons.check,
              title: 'Packed',
              subtitle: 'Supplier Warehouse',
              isCompleted: true,
              circleColor: const Color(0xFF4CAF50),
            ),
            _buildDottedLine(),
            _buildTimelineStep(
              stepNumber: 2,
              icon: Icons.local_shipping,
              title: 'In Transit',
              subtitle: 'Est. Arrival: 2:30 PM',
              isCompleted: true,
              circleColor: const Color(0xFF1976D2),
            ),
            _buildDottedLine(),
            _buildTimelineStep(
              stepNumber: 3,
              icon: Icons.directions_boat,
              title: 'Arriving at Port',
              subtitle: 'Today, 2:32 PM',
              isCompleted: false,
              circleColor: AppColors.appBarColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineStep({
    required int stepNumber,
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isCompleted,
    required Color circleColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Step Indicator
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: circleColor,
            boxShadow: [
              BoxShadow(
                color: circleColor.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        // Content
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF212121),
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF757575),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Chevron Right
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Icon(
            Icons.chevron_right,
            color: Color(0xFFBDBDBD),
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildDottedLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Column(
          children: List.generate(
            6,
            (index) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 1.0),
              child: SizedBox(
                height: 3,
                width: 3,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.appBarColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Delivery Details Card Widget
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


