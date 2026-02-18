import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/colors/app_colors.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_primary_button.dart';

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
        color: Color(0xFFAAB4C3),
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.0,
      ),
    );
  }
}

class SupportLogCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;

  const SupportLogCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          debugPrint("$title tapped");
        },
        borderRadius: BorderRadius.circular(18),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 22,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color(0xFF9FA8B8),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Color(0xFF5A6E82),
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OfflineGuideCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;

  const OfflineGuideCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          debugPrint("$title tapped");
        },
        borderRadius: BorderRadius.circular(18),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 22,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color(0xFF9FA8B8),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Color(0xFF5A6E82),
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SyncProgressCard extends StatelessWidget {
  final double progress;
  final bool isSyncing;

  const SyncProgressCard({
    super.key,
    required this.progress,
    required this.isSyncing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Syncing Voyage X1 issue logs (1 min ago)',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (isSyncing)
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2ECC71)),
                    strokeWidth: 2,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          SyncProgressBar(progress: progress),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sync Progress: ${(progress * 100).toStringAsFixed(0)}%',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                'Good Connection',
                style: TextStyle(
                  color: Color(0xFF2ECC71),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SyncProgressBar extends StatelessWidget {
  final double progress;

  const SyncProgressBar({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: LinearProgressIndicator(
        value: progress,
        minHeight: 8,
        backgroundColor: AppColors.lightGrey,
        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF2ECC71)),
      ),
    );
  }
}




