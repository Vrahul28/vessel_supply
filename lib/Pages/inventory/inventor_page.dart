import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/res/routes_name/routes_name.dart';
import 'package:vessel_supply/widgets/custom_app_bar.dart';
import 'package:vessel_supply/widgets/inverntory_item_card.dart';
import 'package:vessel_supply/widgets/search_widget.dart';
import '../../res/colors/app_colors.dart';

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
                const SectionTitle(title: 'SAFETY GEARS'),
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
                     onPressed: () {
                    
                  },
                  ),
                ),
                const SizedBox(height: 14),
                InventoryItemCard(
                  icon: Icons.construction,
                  iconColor: AppColors.yellow,
                  title: 'Hard Hats',
                  subtitle: '8/25 pcs left',
                  button: RestockButton(    
                     onPressed: () {
                    
                  },
                  ),
                ),
    
                const SizedBox(height: 22),
                const SectionTitle(title: 'TOOLS'),
                const SizedBox(height: 12),
    
                InventoryItemCard(
                  icon: Icons.build,
                  iconColor: const Color(0xFF3B82F6),
                  title: 'Tools',
                  subtitle: '25/50',
                  button: RestockButton(        
                     onPressed: () {
                    
                  },
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

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool selected;

  const FilterChipWidget({super.key, required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    if (selected) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFE5E7EB),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black87),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xFF1F3A5F),
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
    );
  }
}



class RestockButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const RestockButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 92,
      height: 40,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 3,
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF2563EB)]),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.zero, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            onPressed: onPressed,
            child: const Text('Restock', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
          ),
        ),
      ),
    );
  }
}



