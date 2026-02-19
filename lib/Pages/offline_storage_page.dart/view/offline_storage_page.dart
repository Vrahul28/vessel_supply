import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_app_bar.dart';
import '../widgets/storage_action_tile.dart';
import '../widgets/storage_breakdown_item.dart';
import '../widgets/storage_progress_card.dart';


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







