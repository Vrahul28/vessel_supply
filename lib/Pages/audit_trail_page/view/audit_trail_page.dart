import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/res/routes_name/routes_name.dart';
import '../../../res/colors/app_colors.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/search_widget.dart';
import '../widgets/audit_log_card.dart';
import '../widgets/date_filter_row.dart';


class AuditTrailPage extends StatefulWidget {
  const AuditTrailPage({super.key});

  @override
  State<AuditTrailPage> createState() => _AuditTrailPageState();
}

class _AuditTrailPageState extends State<AuditTrailPage> {
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
        text: 'Audit Trail',
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
                    SearchBarWidget(hintText: 'Audit Log Search'),
                    const SizedBox(height: 14.0),
                    // Date Filter Row
                    const DateFilterRow(),
                    const SizedBox(height: 20.0),
                    // Audit Log Cards
                    AuditLogCard(
                      icon: Icons.description,
                      iconBackgroundColor: const Color(0xFF2196F3),
                      title: 'RFQ Created',
                      subtitle:
                          'J. Harris created Supply RFQ #202-463 on Sun Voyager',
                      date: 'Sep 24, 2024, 14:20',
                      onTap: () {
                        Get.toNamed(RoutesName.auditDetailsPage);
                      },
                    ),
                    const SizedBox(height: 14.0),
                    AuditLogCard(
                      icon: Icons.phone_iphone,
                      iconBackgroundColor: const Color(0xFF424242),
                      title: 'Device Registered',
                      subtitle:
                          'D. Nguyen registered new Cargo PDA on Titan Voyager',
                      date: 'Sep 23, 2024, 09:15',
                      onTap: () {},
                    ),
                    const SizedBox(height: 14.0),
                    AuditLogCard(
                      icon: Icons.check_box,
                      iconBackgroundColor: const Color(0xFF4CAF50),
                      title: 'Purchase Order Approved',
                      subtitle: 'M. Lewis approved PO #1507 for Pacific Supplier',
                      date: 'Sep 22, 2024, 18:45',
                      onTap: () {},
                    ),
                    const SizedBox(height: 14.0),
                    AuditLogCard(
                      icon: Icons.inventory_2,
                      iconBackgroundColor: const Color(0xFF00897B),
                      title: 'Inventory Adjustment',
                      subtitle: 'C. Lee made inventory adjustment on Aurora',
                      date: 'Sep 22, 2024, 17:30',
                      onTap: () {},
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



