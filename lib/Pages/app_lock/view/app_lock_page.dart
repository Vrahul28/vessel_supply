import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/Pages/notification_page/widgets/section_header.dart';

import '../../../widgets/custom_app_bar.dart';
import '../widgets/setting_card.dart';
import '../widgets/switch_tile.dart';

class AppLockPage extends StatefulWidget {
  const AppLockPage({super.key});

  @override
  State<AppLockPage> createState() => _AppLockPageState();
}

class _AppLockPageState extends State<AppLockPage> {
  // App Lock toggle
  bool appLockEnabled = true;

  // Offline Locks toggles
  bool offlineRfqsEnabled = true;
  bool offlineDeliveriesEnabled = true;
  bool offlineInventoryEnabled = true;

  // Auto-Sync toggle
  bool autoSyncEnabled = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Color(0xFF2F4E6F),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF1F5),
      appBar: CustomAppBar(
        text: 'Application Locks',
        iconButton2: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // APP LOCK Section
              SettingsCard(
                children: [
                  SwitchTile(
                    icon: Icons.lock_outlined,
                    iconBackgroundColor: const Color(0xFFE8EAED),
                    title: 'App Lock',
                    subtitle: 'Require PIN to open app',
                    isEnabled: appLockEnabled,
                    onToggle: (value) {
                      setState(() {
                        appLockEnabled = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 28),
              // OFFLINE LOCKS Section Header
              SectionHeader(label: 'OFFLINE LOCKS'),
              const SizedBox(height: 12),
              SettingsCard(
                children: [
                  SwitchTile(
                    icon: Icons.description_outlined,
                    iconBackgroundColor: const Color(0xFFE8EAED),
                    title: 'Offline RFQs',
                    subtitle: 'Request supplies offline',
                    isEnabled: offlineRfqsEnabled,
                    onToggle: (value) {
                      setState(() {
                        offlineRfqsEnabled = value;
                      });
                    },
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey[200],
                    indent: 54,
                    endIndent: 16,
                  ),
                  SwitchTile(
                    icon: Icons.local_shipping_outlined,
                    iconBackgroundColor: const Color(0xFFE8EAED),
                    title: 'Offline Deliveries',
                    subtitle: 'Track deliveries offline',
                    isEnabled: offlineDeliveriesEnabled,
                    onToggle: (value) {
                      setState(() {
                        offlineDeliveriesEnabled = value;
                      });
                    },
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey[200],
                    indent: 54,
                    endIndent: 16,
                  ),
                  SwitchTile(
                    icon: Icons.inventory_2_outlined,
                    iconBackgroundColor: const Color(0xFFE8EAED),
                    title: 'Offline Inventory',
                    subtitle: 'View inventory offline',
                    isEnabled: offlineInventoryEnabled,
                    onToggle: (value) {
                      setState(() {
                        offlineInventoryEnabled = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 28),
              // AUTO-SYNC Section
              SettingsCard(
                children: [
                  SwitchTile(
                    icon: Icons.sync_outlined,
                    iconBackgroundColor: const Color(0xFFE8EAED),
                    title: 'Auto-Sync',
                    subtitle: 'Force sync to ERP now',
                    isEnabled: autoSyncEnabled,
                    onToggle: (value) {
                      setState(() {
                        autoSyncEnabled = value;
                      });
                      if (value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Syncing with ERP...'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    super.dispose();
  }
}




