import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/colors/app_colors.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_primary_button.dart';
import '../../select_item_page/view/select_item_page.dart';
import '../../select_item_page/widgets/section_label.dart';
import '../widgets/offlice_guard_card.dart';
import '../widgets/support_logo_card.dart';
import '../widgets/sync_progress_card.dart';


class SyncSupportLogsPage extends StatefulWidget {
  const SyncSupportLogsPage({super.key});

  @override
  State<SyncSupportLogsPage> createState() => _SyncSupportLogsPageState();
}

class _SyncSupportLogsPageState extends State<SyncSupportLogsPage> with SingleTickerProviderStateMixin {
  bool isSyncing = true;
  double syncProgress = 0.56;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: CustomAppBar(
        text: 'Sync Logs',
        iconButton2: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 20),
            const SectionLabel(label: 'Pending Sync'),
            const SizedBox(height: 12),
            SupportLogCard(
              icon: Icons.build_circle_outlined,
              iconColor: const Color(0xFFFF9800),
              title: 'Maintenance',
              subtitle: 'Generator malfunction',
            ),
            const SizedBox(height: 12),
            SupportLogCard(
              icon: Icons.description_outlined,
              iconColor: const Color(0xFFFFC107),
              title: 'Documentation',
              subtitle: 'Missing customs invoice',
            ),
            const SizedBox(height: 12),
            SupportLogCard(
              icon: Icons.settings_suggest_outlined,
              iconColor: const Color(0xFFFF6B35),
              title: 'Technical',
              subtitle: 'Radar calibration error',
            ),
            const SizedBox(height: 12),
            SupportLogCard(
              icon: Icons.warning_amber_rounded,
              iconColor: const Color(0xFFFF7043),
              title: 'Alert',
              subtitle: 'Low critical stock - Engine Parts',
            ),
            const SizedBox(height: 28),
            const SectionLabel(label: 'OFFLINE GUIDES'),
            const SizedBox(height: 12),
            OfflineGuideCard(
              icon: Icons.sync_outlined,
              iconColor: const Color(0xFF4CAF50),
              title: 'Download PDFs',
              subtitle: 'Checklists & Manuals',
            ),
            const SizedBox(height: 20),
            SyncProgressCard(
              progress: syncProgress,
              isSyncing: isSyncing,
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              text: 'Cancel Sync',
              backgroundColor: AppColors.appBarColor,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Cancel Sync'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }, 
            ),
          ],
        ),
      ),
    );
  }
}















