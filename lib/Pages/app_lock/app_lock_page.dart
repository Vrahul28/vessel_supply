import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/custom_app_bar.dart';

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
        iconData: Icon(Icons.arrow_back, color: Colors.white),
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

  // Custom AppBar
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF2F4E6F),
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        'Application Locks',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
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

// ===== REUSABLE WIDGETS =====

/// Section header widget
class SectionHeader extends StatelessWidget {
  final String label;

  const SectionHeader({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.grey[600],
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

/// Settings Card container
class SettingsCard extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets margin;

  const SettingsCard({
    super.key,
    required this.children,
    this.margin = const EdgeInsets.symmetric(horizontal: 16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }
}

/// Individual switch tile widget
class SwitchTile extends StatelessWidget {
  final IconData icon;
  final Color iconBackgroundColor;
  final String title;
  final String subtitle;
  final bool isEnabled;
  final ValueChanged<bool> onToggle;
  final Color? iconColor;

  const SwitchTile({
    super.key,
    required this.icon,
    required this.iconBackgroundColor,
    required this.title,
    required this.subtitle,
    required this.isEnabled,
    required this.onToggle,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      child: Row(
        children: [
          // Icon Container
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 22,
                color: iconColor ?? const Color(0xFF2F4E6F),
              ),
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
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Cupertino Switch
          CupertinoSwitch(
            value: isEnabled,
            onChanged: onToggle,
            activeColor: const Color(0xFF4CAF50),
            trackColor: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}