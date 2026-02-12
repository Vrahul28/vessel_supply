import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../widgets/custom_app_bar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  // General Reminders toggles
  bool rfqRemindersEnabled = true;
  bool deliveryRemindersEnabled = true;

  // Urgent RFQs toggles
  bool supplyShortagesEnabled = true;
  bool orderedPendingEnabled = true;
  bool shoreResponseEnabled = true;

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
        text: 'Notifications',
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
              // GENERAL REMINDERS Section
              SectionHeader(label: 'GENERAL REMINDERS'),
              const SizedBox(height: 12),
              NotificationCard(
                children: [
                  NotificationTile(
                    icon: Icons.description_outlined,
                    iconBackgroundColor: const Color(0xFFE8EAED),
                    title: 'RFQ Reminders',
                    subtitle: 'Require PIN to open app',
                    isEnabled: rfqRemindersEnabled,
                    onToggle: (value) {
                      setState(() {
                        rfqRemindersEnabled = value;
                      });
                    },
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey[200],
                    indent: 54,
                    endIndent: 16,
                  ),
                  NotificationTile(
                    icon: Icons.local_shipping_outlined,
                    iconBackgroundColor: const Color(0xFFE8EAED),
                    title: 'Delivery Reminders',
                    subtitle: 'Request supplies offline',
                    isEnabled: deliveryRemindersEnabled,
                    onToggle: (value) {
                      setState(() {
                        deliveryRemindersEnabled = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 28),
              // URGENT RFQS Section
              SectionHeader(label: 'URGENT RFQS'),
              const SizedBox(height: 12),
              NotificationCard(
                children: [
                  NotificationTile(
                    icon: Icons.warning_outlined,
                    iconBackgroundColor: const Color(0xFFFFF3CD),
                    iconColor: const Color(0xFFFBC02D),
                    title: 'Supply Shortages',
                    subtitle: 'Request',
                    isEnabled: supplyShortagesEnabled,
                    onToggle: (value) {
                      setState(() {
                        supplyShortagesEnabled = value;
                      });
                    },
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey[200],
                    indent: 54,
                    endIndent: 16,
                  ),
                  NotificationTile(
                    icon: Icons.warning_outlined,
                    iconBackgroundColor: const Color(0xFFFFF3CD),
                    iconColor: const Color(0xFFFBC02D),
                    title: 'Ordered Pending',
                    subtitle: 'Request',
                    isEnabled: orderedPendingEnabled,
                    onToggle: (value) {
                      setState(() {
                        orderedPendingEnabled = value;
                      });
                    },
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey[200],
                    indent: 54,
                    endIndent: 16,
                  ),
                  NotificationTile(
                    icon: Icons.warning_outlined,
                    iconBackgroundColor: const Color(0xFFFFF3CD),
                    iconColor: const Color(0xFFFBC02D),
                    title: 'Shore Response',
                    subtitle: 'Request',
                    isEnabled: shoreResponseEnabled,
                    onToggle: (value) {
                      setState(() {
                        shoreResponseEnabled = value;
                      });
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

  void showSettingsMenu() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Notification settings'),
        duration: Duration(milliseconds: 500),
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

/// Notification Card container
class NotificationCard extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets padding;

  const NotificationCard({
    super.key,
    required this.children,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding,
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

/// Individual notification tile
class NotificationTile extends StatelessWidget {
  final IconData icon;
  final Color iconBackgroundColor;
  final Color? iconColor;
  final String title;
  final String subtitle;
  final bool isEnabled;
  final ValueChanged<bool> onToggle;

  const NotificationTile({
    super.key,
    required this.icon,
    required this.iconBackgroundColor,
    this.iconColor,
    required this.title,
    required this.subtitle,
    required this.isEnabled,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                const SizedBox(height: 2),
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
