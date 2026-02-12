import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/app_spacing/app_spacing.dart';
import '../../res/colors/app_colors.dart';
import '../../res/routes_name/routes_name.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/search_widget.dart';

// Category Model
class Category {
  final String name;
  final IconData icon;

  Category({required this.name, required this.icon});
}

// Selected Item Model
class SelectedItem {
  final String name;
  final String category;
  final int quantity;
  bool isSelected;

  SelectedItem({
    required this.name,
    required this.category,
    required this.quantity,
    this.isSelected = true,
  });
}

// Select Items Page
class SelectItemsPage extends StatefulWidget {
  const SelectItemsPage({super.key});

  @override
  State<SelectItemsPage> createState() => _SelectItemsPageState();
}

class _SelectItemsPageState extends State<SelectItemsPage> {
  late TextEditingController searchController;

  final List<Category> categories = [
    Category(name: 'Provisions', icon: Icons.inventory_2),
    Category(name: 'Deck & Engine', icon: Icons.anchor),
    Category(name: 'Safety Equipment', icon: Icons.shield),
    Category(name: 'Medical Supplies', icon: Icons.medical_services),
  ];

  List<SelectedItem> selectedItems = [
    SelectedItem(
      name: 'Canned Meat',
      category: 'Provisions',
      quantity: 10,
    ),
    SelectedItem(
      name: 'Fresh Vegetables',
      category: 'Provisions',
      quantity: 5,
    ),
  ];

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int selectedCount = selectedItems.where((item) => item.isSelected).length;
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: CustomAppBar(
        text: 'Select Items',
        iconButton2: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.lg,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search Field
                    SearchBarWidget(hintText: 'Search items...'),
                    const SizedBox(height: AppSpacing.xxl),
                    // Categories Section
                    SectionLabel(label: 'CATEGORIES'),
                    const SizedBox(height: AppSpacing.md),
                    Column(
                      children: categories
                          .map(
                            (category) => Padding(
                              padding: const EdgeInsets.only(
                                bottom: AppSpacing.md,
                              ),
                              child: CategoryTile(
                                category: category,
                                onTap: () {
                                  debugPrint('Tapped: ${category.name}');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text('Selected: ${category.name}'),
                                      duration: const Duration(seconds: 1),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: AppSpacing.xxl),
                    // Selected Items Section
                    SectionLabel(label: 'SELECTED ITEMS'),
                    const SizedBox(height: AppSpacing.md),
                    Column(
                      children: selectedItems
                          .map(
                            (item) => Padding(
                              padding: const EdgeInsets.only(
                                bottom: AppSpacing.md,
                              ),
                              child: SelectedItemCard(
                                item: item,
                                onCheckboxChanged: (value) {
                                  setState(() {
                                    item.isSelected = value ?? false;
                                  });
                                },
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: PrimaryButton(
          label: 'Review Request',
          onPressed: () {
            Get.toNamed(RoutesName.reviewConfirmPage);
          },
        ),
      ),
    );
  }
}

// Section Label Widget
class SectionLabel extends StatelessWidget {
  final String label;

  const SectionLabel({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: AppColors.subtitleGrey,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
      ),
    );
  }
}

// Category Tile Widget
class CategoryTile extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const CategoryTile({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.lightGrey,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        child: Row(
          children: [
            // Icon Container
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                category.icon,
                color: AppColors.appBarColor,
                size: 24,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            // Title
            Expanded(
              child: Text(
                category.name,
                style: const TextStyle(
                  color: AppColors.darkText,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // Chevron Icon
            const Icon(
              Icons.chevron_right,
              color: AppColors.subtitleGrey,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}

// Selected Item Card Widget
class SelectedItemCard extends StatelessWidget {
  final SelectedItem item;
  final Function(bool?)? onCheckboxChanged;

  const SelectedItemCard({
    super.key,
    required this.item,
    this.onCheckboxChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Row(
        children: [
          // Checkbox
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: item.isSelected,
              onChanged: onCheckboxChanged,
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return AppColors.appBarColor;
                }
                return Colors.transparent;
              }),
              side: const BorderSide(
                color: AppColors.appBarColor,
                width: 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),

          // Item Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    color: AppColors.darkText,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  item.category,
                  style: const TextStyle(
                    color: AppColors.subtitleGrey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // Quantity
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Qty: ${item.quantity}',
                style: const TextStyle(
                  color: AppColors.darkText,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Boxes',
                style: const TextStyle(
                  color: AppColors.subtitleGrey,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Primary Button Widget
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.appBarColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          shadowColor: AppColors.appBarColor.withOpacity(0.4),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}
