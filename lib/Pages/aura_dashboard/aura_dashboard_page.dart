import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../widgets/custom_app_bar.dart';

class AuraDashboardPage extends StatefulWidget {
  const AuraDashboardPage({super.key});

  @override
  State<AuraDashboardPage> createState() => _AuraDashboardPageState();
}

class _AuraDashboardPageState extends State<AuraDashboardPage> {
  // General Reminders toggles
  bool rfqRemindersEnabled = true;
  bool deliveryRemindersEnabled = true;

  // Urgent RFQs toggles
  bool supplyShortagesEnabled = true;
  bool outboundReadyEnabled = true;

  final int notificationCount = 3;

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
        text: 'Aurora Dashboard',
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
              ReminderCard(
                children: [
                  ReminderTile(
                    icon: Icons.description_outlined,
                    iconBackgroundColor: const Color(0xFFE8EAED),
                    title: 'RFQ Reminders',
                    subtitle: '2 Urgent',
                    showWarningBadge: true,
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
                  ReminderTile(
                    icon: Icons.local_shipping_outlined,
                    iconBackgroundColor: const Color(0xFFE8EAED),
                    title: 'Delivery Reminders',
                    subtitle: 'Arriving at next port',
                    showWarningBadge: false,
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
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
                  children: [
                    // Supply Shortages Block
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header Row
                          Row(
                            children: [
                              // Icon Container
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFF3CD),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.warning_outlined,
                                    size: 22,
                                    color: Color(0xFFFBC02D),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              // Title and Subtitle
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Supply Shortages',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF1A1A1A),
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      'Action Required',
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
                              // Toggle
                              CupertinoSwitch(
                                value: supplyShortagesEnabled,
                                onChanged: (value) {
                                  setState(() {
                                    supplyShortagesEnabled = value;
                                  });
                                },
                                activeColor: const Color(0xFF4CAF50),
                                trackColor: Colors.grey[300],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          // Items List
                          ItemCountRow(
                            label: 'Safety Gears',
                            count: 2,
                          ),
                          const SizedBox(height: 8),
                          ItemCountRow(
                            label: 'Consumables',
                            count: 3,
                          ),
                          const SizedBox(height: 8),
                          ItemCountRow(
                            label: 'Tools',
                            count: 2,
                          ),
                        ],
                      ),
                    ),
                    // Divider
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(
                        height: 16,
                        color: Colors.grey[200],
                      ),
                    ),
                    // Outbound Ready Block
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header Row
                          Row(
                            children: [
                              // Icon Container
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE8EAED),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.checklist_rounded,
                                    size: 22,
                                    color: Color(0xFF2F4E6F),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              // Title and Subtitle
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Outbound Ready',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF1A1A1A),
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      'Ready for dispatch',
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
                              // Toggle
                              CupertinoSwitch(
                                value: outboundReadyEnabled,
                                onChanged: (value) {
                                  setState(() {
                                    outboundReadyEnabled = value;
                                  });
                                },
                                activeColor: const Color(0xFF4CAF50),
                                trackColor: Colors.grey[300],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          // Supplier List
                          ItemCountRow(
                            label: 'Supplier ABC',
                            count: 2,
                          ),
                          const SizedBox(height: 8),
                          ItemCountRow(
                            label: 'Supplier XYZ',
                            count: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
        'Aurora Dashboard',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              IconButton(
                icon:
                    const Icon(Icons.notifications_outlined, color: Colors.white, size: 24),
                onPressed: () => _showNotifications(),
              ),
              NotificationBadge(
                count: notificationCount,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showNotifications() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$notificationCount notifications'),
        duration: const Duration(milliseconds: 500),
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

/// Reminder Card container
class ReminderCard extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets padding;

  const ReminderCard({
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

/// Individual reminder tile
class ReminderTile extends StatelessWidget {
  final IconData icon;
  final Color iconBackgroundColor;
  final String title;
  final String subtitle;
  final bool showWarningBadge;
  final bool isEnabled;
  final ValueChanged<bool> onToggle;

  const ReminderTile({
    super.key,
    required this.icon,
    required this.iconBackgroundColor,
    required this.title,
    required this.subtitle,
    this.showWarningBadge = false,
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
                color: const Color(0xFF2F4E6F),
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
                Row(
                  children: [
                    if (showWarningBadge)
                      Row(
                        children: [
                          const Icon(
                            Icons.warning_rounded,
                            size: 14,
                            color: Color(0xFFFF9800),
                          ),
                          const SizedBox(width: 4),
                        ],
                      ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: showWarningBadge ? const Color(0xFFFF9800) : Colors.grey[600],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
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

/// Item count row widget
class ItemCountRow extends StatelessWidget {
  final String label;
  final int count;

  const ItemCountRow({
    super.key,
    required this.label,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: const Color(0xFFFFEBEE),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            count.toString(),
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFFE53935),
            ),
          ),
        ),
      ],
    );
  }
}

/// Notification badge widget
class NotificationBadge extends StatelessWidget {
  final int count;

  const NotificationBadge({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 0,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: Color(0xFFE53935),
          shape: BoxShape.circle,
        ),
        constraints: const BoxConstraints(
          minWidth: 20,
          minHeight: 20,
        ),
        child: Center(
          child: Text(
            count.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}