import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/res/routes_name/routes_name.dart';

import '../../../res/colors/app_colors.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_primary_button.dart';
import '../../../widgets/search_widget.dart';
import '../widgets/delivery_details_card.dart';
import '../widgets/time_line_card.dart';

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


// Delivery Details Card Widget



