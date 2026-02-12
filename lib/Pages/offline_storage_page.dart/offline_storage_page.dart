import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../widgets/custom_app_bar.dart';

class OfflineStoragePage extends StatefulWidget {
  const OfflineStoragePage({super.key});

  @override
  State<OfflineStoragePage> createState() => _OfflineStoragePageState();
}

class _OfflineStoragePageState extends State<OfflineStoragePage> {
  bool _syncNowEnabled = false;

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
        text: 'Offline Storage',
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
            children: [
              const SizedBox(height: 20),
              // Storage Usage Card
              StorageProgressCard(
                title: 'Offline Cache Usage',
                usedMB: 158,
                totalMB: 500,
              ),
              const SizedBox(height: 24),
              // Storage Breakdown List Card
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section Title
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 16, 18, 12),
                      child: Text(
                        'Storage Breakdown',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey[200],
                      indent: 18,
                      endIndent: 18,
                    ),
                    // RFQs
                    StorageBreakdownItem(
                      icon: Icons.description_outlined,
                      moduleName: 'RFQs',
                      storageSizeMB: 64,
                      onTap: () => _showModuleDetails('RFQs', 64),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey[200],
                      indent: 54,
                      endIndent: 18,
                    ),
                    // Deliveries
                    StorageBreakdownItem(
                      icon: Icons.local_shipping_outlined,
                      moduleName: 'Deliveries',
                      storageSizeMB: 61,
                      onTap: () => _showModuleDetails('Deliveries', 61),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey[200],
                      indent: 54,
                      endIndent: 18,
                    ),
                    // Inventory
                    StorageBreakdownItem(
                      icon: Icons.inventory_2_outlined,
                      moduleName: 'Inventory',
                      storageSizeMB: 29,
                      onTap: () => _showModuleDetails('Inventory', 29),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey[200],
                      indent: 54,
                      endIndent: 18,
                    ),
                    // Documents
                    StorageBreakdownItem(
                      icon: Icons.insert_drive_file_outlined,
                      moduleName: 'Documents',
                      storageSizeMB: 4,
                      onTap: () => _showModuleDetails('Documents', 4),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Actions Card
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
                    // Clear Data
                    StorageActionTile(
                      icon: Icons.delete_outline,
                      title: 'Clear Data',
                      subtitle: 'Erase all offline data',
                      isDangerous: true,
                      onTap: _showClearDataConfirmation,
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey[200],
                      indent: 18,
                      endIndent: 18,
                    ),
                    // Sync Now
                    StorageActionTile(
                      icon: Icons.sync_outlined,
                      title: 'Sync Now',
                      subtitle: 'Force sync to ERP now',
                      isToggle: true,
                      toggleInitialValue: _syncNowEnabled,
                      onToggleChanged: _handleSyncNow,
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

  // Show module details
  void _showModuleDetails(String moduleName, int sizeMB) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$moduleName: $sizeMB MB'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  // Show clear data confirmation
  void _showClearDataConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Offline Data?'),
        content: const Text(
          'This will delete all cached offline data. You can re-sync from the ERP system later.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _performClearData();
            },
            child: const Text(
              'Clear',
              style: TextStyle(color: Color(0xFFE53935)),
            ),
          ),
        ],
      ),
    );
  }

  // Perform clear data with animation
  void _performClearData() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✓ Offline data cleared successfully'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.green,
          ),
        );
      }
    });
  }

  // Handle sync now toggle
  void _handleSyncNow(bool value) {
    setState(() {
      _syncNowEnabled = value;
    });

    if (value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Syncing with ERP...'),
          duration: Duration(seconds: 2),
        ),
      );

      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() {
            _syncNowEnabled = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('✓ Sync completed successfully'),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.green,
            ),
          );
        }
      });
    }
  }

  // Show storage settings
  void _showStorageSettings() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Storage settings'),
        duration: Duration(seconds: 1),
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

// ===== WIDGETS =====

class StorageProgressCard extends StatelessWidget {
  final int usedMB;
  final int totalMB;
  final String title;

  const StorageProgressCard({
    super.key,
    required this.usedMB,
    required this.totalMB,
    required this.title,
  });

  double get _progressValue => usedMB / totalMB;
  int get _percentageUsed => ((_progressValue) * 100).toInt();

  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 16),
          // Progress Bar
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: _progressValue,
              minHeight: 8,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF2F4E6F),
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Storage Stats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$usedMB / $totalMB MB Used',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '$_percentageUsed%',
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF2F4E6F),
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

class StorageBreakdownItem extends StatelessWidget {
  final IconData icon;
  final String moduleName;
  final int storageSizeMB;
  final VoidCallback? onTap;

  const StorageBreakdownItem({
    super.key,
    required this.icon,
    required this.moduleName,
    required this.storageSizeMB,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        highlightColor: Colors.grey.withOpacity(0.05),
        splashColor: Colors.grey.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          child: Row(
            children: [
              // Icon
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF2F4E6F).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: const Color(0xFF2F4E6F),
                ),
              ),
              const SizedBox(width: 12),
              // Module Name
              Expanded(
                child: Text(
                  moduleName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),
              // Storage Size
              Text(
                '$storageSizeMB MB',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StorageActionTile extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isToggle;
  final bool toggleInitialValue;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onToggleChanged;
  final Color? iconColor;
  final bool isDangerous;

  const StorageActionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isToggle = false,
    this.toggleInitialValue = false,
    this.onTap,
    this.onToggleChanged,
    this.iconColor,
    this.isDangerous = false,
  });

  @override
  State<StorageActionTile> createState() => _StorageActionTileState();
}

class _StorageActionTileState extends State<StorageActionTile> {
  late bool _toggleValue;

  @override
  void initState() {
    super.initState();
    _toggleValue = widget.toggleInitialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.isToggle ? null : widget.onTap,
        highlightColor: Colors.grey.withOpacity(0.05),
        splashColor: Colors.grey.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          child: Row(
            children: [
              // Icon
              Icon(
                widget.icon,
                size: 24,
                color: widget.isDangerous
                    ? const Color(0xFFE53935)
                    : (widget.iconColor ?? const Color(0xFF2F4E6F)),
              ),
              const SizedBox(width: 12),
              // Title and Subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: widget.isDangerous
                            ? const Color(0xFFE53935)
                            : const Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              // Right Action
              if (widget.isToggle)
                CupertinoSwitch(
                  value: _toggleValue,
                  onChanged: (value) {
                    setState(() {
                      _toggleValue = value;
                    });
                    widget.onToggleChanged?.call(value);
                  },
                  activeColor: const Color(0xFF4CAF50),
                  trackColor: Colors.grey[300],
                )
              else
                Icon(
                  Icons.chevron_right,
                  size: 20,
                  color: Colors.grey[400],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
