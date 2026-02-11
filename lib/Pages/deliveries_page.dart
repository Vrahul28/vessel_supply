import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/models/delivery_model.dart';
import 'package:vessel_supply/models/manifest_item_model.dart';
import 'package:vessel_supply/widgets/custom_appbar.dart';
import 'package:vessel_supply/widgets/manifest_item_card.dart';
import 'package:vessel_supply/widgets/timeline_step.dart';

class DeliveriesPage extends StatefulWidget {
  const DeliveriesPage({super.key});

  @override
  State<DeliveriesPage> createState() => _DeliveriesPageState();
}

class _DeliveriesPageState extends State<DeliveriesPage> {
  late DeliveryModel delivery;
  late List<ManifestItemModel> manifestItems;

  @override
  void initState() {
    super.initState();
    delivery = DeliveryModel(id: '8842', steps: [
      DeliveryStep(
        status: DeliveryStepStatus.completed,
        title: 'Packed & Dispatched',
        subtitle: 'Singapore Port • 08:30 AM',
      ),
      DeliveryStep(
        status: DeliveryStepStatus.active,
        title: 'In Transit',
        subtitle: "Supply Boat 'Seagull 4'",
        rightLabel: 'ETA 14:20',
      ),
      DeliveryStep(
        status: DeliveryStepStatus.pending,
        title: 'Received Onboard',
        subtitle: 'Pending Confirmation',
      ),
    ]);

    manifestItems = [
      ManifestItemModel(title: 'Fuel Filters (Type B)', partNumber: 'FF-9921', quantity: 12),
      ManifestItemModel(title: 'Hydraulic Hoses', partNumber: 'HH-4420', quantity: 6),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      appBar: CustomAppBarActiveRFQ(
        title: 'Delivery',
          onBackPressed: (){
            Get.back();
          },
        ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Column(
                        children: List.generate(delivery.steps.length, (index) {
                          final step = delivery.steps[index];
                          final isLast = index == delivery.steps.length - 1;
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: TimelineStep(
                              step: step,
                              showConnectorBelow: !isLast,
                            ),
                          );
                        }),
                      ),
                      // Map preview + Live Tracking
                      const SizedBox(height: 8),
                      Container(
                        height: 90,
                        margin: const EdgeInsets.only(left: 16, right: 16, top: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE6E9EC),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Map view',
                            style: TextStyle(
                              color: Color(0xFF6B7280),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(color: Color(0xFFD1D5DB)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            elevation: 0,
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Live Tracking',
                            style: TextStyle(
                              color: Color(0xFF374151),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Divider(thickness: 1, height: 1),
                    ],
                  ),
                ),
              ),
              Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                     const SizedBox(height: 20),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: Text(
                          'Items Manifest',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF111827),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Column(
                children: manifestItems.map((it) => ManifestItemCard(item: it)).toList(),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}