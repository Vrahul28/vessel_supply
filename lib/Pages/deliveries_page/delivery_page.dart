import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/res/routes_name/routes_name.dart';
import '../../res/colors/app_colors.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/search_widget.dart';


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
          onPressed: () {
            
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
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
                    SupplierCard(
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
                    SupplierCard(
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



// Filter Chips Bar Widget
class FilterChipsBar extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterChanged;
  final List<String> filters = const ['ALL', 'PENDING', 'IN TRANSIT', 'COMPLETED'];

  const FilterChipsBar({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((filter) {
          final isSelected = selectedFilter == filter;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(
                filter,
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.darkText,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              backgroundColor: isSelected ? AppColors.appBarColor : AppColors.lightGrey,
              onSelected: (_) => onFilterChanged(filter),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide.none,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// Supplier Card Widget
class SupplierCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool showChevron;
  final VoidCallback onPressed;

  const SupplierCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.showChevron = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(14),
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
        child: Row(
          children: [
            // Icon Container
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: AppColors.appBarColor,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),

            // Title and Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.darkText,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: AppColors.subtitleGrey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            // Chevron Icon
            if (showChevron)
              const Icon(
                Icons.chevron_right,
                color: AppColors.subtitleGrey,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}

// Restock Item Tile Widget
class RestockItemTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool showHighlight;
  final VoidCallback onRestockPressed;

  const RestockItemTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.showHighlight = false,
    required this.onRestockPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          // Icon
          Icon(
            icon,
            color: AppColors.appBarColor,
            size: 24,
          ),
          const SizedBox(width: 12),

          // Title and Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.darkText,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: showHighlight ? AppColors.buttonBlue : AppColors.subtitleGrey,
                    fontSize: 12,
                    fontWeight: showHighlight ? FontWeight.w500 : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),

          // Restock Button
          ElevatedButton(
            onPressed: onRestockPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonBlue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Restock',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Completed Delivery Card Widget
class CompletedDeliveryCard extends StatelessWidget {
  final String supplierName;
  final String completedDate;
  final List<String> items;

  const CompletedDeliveryCard({
    super.key,
    required this.supplierName,
    required this.completedDate,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          // Header
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                // Icon
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.folder,
                    color: AppColors.appBarColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),

                // Title and Subtitle
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        supplierName,
                        style: const TextStyle(
                          color: AppColors.darkText,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        completedDate,
                        style: const TextStyle(
                          color: AppColors.subtitleGrey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Divider
          Divider(
            height: 1,
            indent: 14,
            endIndent: 14,
            color: AppColors.lightGrey,
          ),

          // Items List
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: items.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: DeliveryItemRow(item: item),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// Delivery Item Row Widget
class DeliveryItemRow extends StatelessWidget {
  final String item;

  const DeliveryItemRow({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Item Text
        Expanded(
          child: Text(
            item,
            style: const TextStyle(
              color: AppColors.darkText,
              fontSize: 13,
            ),
          ),
        ),
        const SizedBox(width: 8),

        // Check Icon
        Container(
          decoration: BoxDecoration(
            color: AppColors.successGreen,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(4),
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 14,
          ),
        ),
      ],
    );
  }
}
