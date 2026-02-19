import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/app_spacing/app_spacing.dart';
import '../../../res/colors/app_colors.dart';
import '../../../res/routes_name/routes_name.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_primary_button.dart';
import '../../../widgets/search_widget.dart';
import '../model/category.dart';
import '../model/selected_item.dart';
import '../widgets/category_tile.dart';
import '../widgets/section_label.dart';
import '../widgets/select_item_card.dart';


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
              text: 'Review Request',
              backgroundColor: AppColors.appBarColor,
              onPressed: () {
               Get.toNamed(RoutesName.reviewConfirmPage);
              }, 
            ),
      ),
    );
  }
}

