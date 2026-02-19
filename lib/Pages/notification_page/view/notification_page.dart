import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../app_lock/view/app_lock_page.dart';
import '../widgets/notification_card.dart';
import '../widgets/notification_tile.dart';
import '../widgets/section_header.dart';

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



