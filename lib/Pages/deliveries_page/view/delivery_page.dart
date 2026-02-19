import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/res/routes_name/routes_name.dart';
import '../../../res/colors/app_colors.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/search_widget.dart';
import '../widgets/complete_delivery_card.dart';
import '../widgets/filter_chip_bar.dart';
import '../widgets/restock_item_tile.dart';
import '../widgets/supplier_card.dart';

// Main Deliveries Screen
class DeliveriesScreen extends StatefulWidget {
  const DeliveriesScreen({super.key});

  @override
  State<DeliveriesScreen> createState() => _DeliveriesScreenState();
}

class _DeliveriesScreenState extends State<DeliveriesScreen> {
  String selectedFilter = 'ALL';

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.appBarColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: CustomAppBar(
        text: 'Deliveries',
        iconButton2: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                const SizedBox(height: 18),
                SearchBarWidget(hintText: 'Search deliveries...'),
                const SizedBox(height: 18),
                // Filter Tabs
                FilterChipsBar(
                  selectedFilter: selectedFilter,
                  onFilterChanged: (filter) {
                    setState(() {
                      selectedFilter = filter;
                    });
                  },
                ),
                const SizedBox(height: 16),
                // Delivery Cards List
                Column(
                  children: [
                    // Supplier ABC - Arriving
                    SupplierCardDeliveryPage(
                      icon: Icons.local_shipping,
                      title: 'Supplier ABC',
                      subtitle: 'Arriving today',
                      showChevron: true,
                      onPressed: () {
                        Get.toNamed(RoutesName.supplierPage);
                      },
                    ),
                    const SizedBox(height: 12),
                    // Restock Items Card
                    Container(
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
                          RestockItemTile(
                            icon: Icons.battery_full,
                            title: 'Batteries',
                            subtitle: '50 pcs left',
                            onRestockPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Restock action triggered'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                          ),
                          Divider(
                            height: 1,
                            color: AppColors.lightGrey,
                          ),
                          RestockItemTile(
                            icon: Icons.opacity,
                            title: 'Oil Filter',
                            subtitle: '10 pcs left',
                            showHighlight: true,
                            onRestockPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Restock action triggered'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Completed Delivery - Supplier DEF
                    CompletedDeliveryCard(
                      supplierName: 'Supplier DEF',
                      completedDate: 'Completed Apr 2',
                      items: [
                        '100 pcs Work Gloves',
                        '120 pcs Spray Bottles',
                        '25 pcs Light Bulbs',
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Supplier GHI
                    SupplierCardDeliveryPage(
                      icon: Icons.folder,
                      title: 'Supplier GHI',
                      subtitle: 'Completed Mar 25',
                      showChevron: true,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



