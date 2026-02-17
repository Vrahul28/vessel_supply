import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/res/routes_name/routes_name.dart';
import '../../res/colors/app_colors.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/search_widget.dart';



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


// Date Filter Row Widget
class DateFilterRow extends StatelessWidget {
  const DateFilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Date Picker Container
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  color: Color(0xFF616161),
                  size: 18,
                ),
                const SizedBox(width: 8.0),
                const Text(
                  'Sep 14, 2024 - Sep 24, 2024',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF424242),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Filter Button
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                  vertical: 10.0,
                ),
                child: Row(
                  children: const [
                    Text(
                      'Filters',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF424242),
                      ),
                    ),
                    SizedBox(width: 4.0),
                    Icon(
                      Icons.chevron_right,
                      color: Color(0xFF616161),
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Audit Log Card Widget
class AuditLogCard extends StatelessWidget {
  final IconData icon;
  final Color iconBackgroundColor;
  final String title;
  final String subtitle;
  final String date;
  final VoidCallback onTap;

  const AuditLogCard({
    super.key,
    required this.icon,
    required this.iconBackgroundColor,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Icon Box
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: iconBackgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(width: 14.0),
                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1F1F1F),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Text(
                        subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF757575),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF9E9E9E),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8.0),
                // Chevron Arrow
                const Icon(
                  Icons.chevron_right,
                  color: Color(0xFFBDBDBD),
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
