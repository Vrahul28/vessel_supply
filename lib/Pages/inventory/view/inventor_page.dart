import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/Pages/notification_page/widgets/section_header.dart';
import 'package:vessel_supply/res/routes_name/routes_name.dart';
import 'package:vessel_supply/widgets/custom_app_bar.dart';
import 'package:vessel_supply/widgets/inverntory_item_card.dart';
import 'package:vessel_supply/widgets/search_widget.dart';
import '../../../res/colors/app_colors.dart';
import '../../cleaning_rags/widget/restock_button.dart';
import '../widgets/filter_chip_widget.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: CustomAppBar(
        text: 'Inventory',
        iconButton2: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 18),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                SearchBarWidget(hintText: 'Search inventory...'),
                const SizedBox(height: 12),
                const FilterChipsRow(),
                const SizedBox(height: 20),
                const SectionHeader(label: 'SAFETY GEARS'),
                const SizedBox(height: 12),
                InventoryItemCard(
                  icon: Icons.anchor,
                  iconColor: const Color(0xFFFF6400),
                  title: 'Life Jackets',
                  subtitle: '5/50 pcs left',
                  button: RestockButton(
                    onPressed: () {
                      Get.toNamed(RoutesName.cleaningRags);
                    },
                  ),
                ),
                const SizedBox(height: 14),
                InventoryItemCard(
                  icon: Icons.handshake,
                  iconColor: AppColors.yellow,
                  title: 'Work Gloves',
                  subtitle: '12/100 pcs left',
                  button: RestockButton(
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 14),
                InventoryItemCard(
                  icon: Icons.construction,
                  iconColor: AppColors.yellow,
                  title: 'Hard Hats',
                  subtitle: '8/25 pcs left',
                  button: RestockButton(
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 22),
                const SectionHeader(label: 'TOOLS'),
                const SizedBox(height: 12),
                InventoryItemCard(
                  icon: Icons.build,
                  iconColor: const Color(0xFF3B82F6),
                  title: 'Tools',
                  subtitle: '25/50',
                  button: RestockButton(
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 90),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FilterChipsRow extends StatelessWidget {
  const FilterChipsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final items = ['ALL', 'SAFETY GEARS', 'CONSUMABLES', 'TOOLS'];
    return SizedBox(
      height: 44,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(items.length, (index) {
            final label = items[index];
            final bool selected = index == 0; // ALL selected by default
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: FilterChipWidget(label: label, selected: selected),
            );
          }),
        ),
      ),
    );
  }
}





