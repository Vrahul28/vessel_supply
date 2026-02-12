import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/widgets/inventory_widgets/inventory_item_header.dart';
import 'package:vessel_supply/widgets/inventory_widgets/stock_info_card.dart';
import 'package:vessel_supply/widgets/inventory_widgets/supplier_card.dart';
import 'package:vessel_supply/widgets/inventory_widgets/sync_status_card.dart';
import 'package:vessel_supply/widgets/inventory_widgets/restock_button.dart';

import '../../widgets/custom_app_bar.dart';


class CleaningRags extends StatefulWidget {
  const CleaningRags({super.key});

  @override
  State<CleaningRags> createState() => _CleaningRagsState();
}

class _CleaningRagsState extends State<CleaningRags> {
  int currentNavIndex = 1; 
  bool _isRestocking = false;

  @override
  void initState() {
    super.initState();
    // Set light status bar icons
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
      backgroundColor: const Color(0xFFEEF3F8),
      appBar: CustomAppBar(
        text: 'Cleaning Rags',
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
              // Product Header Section
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: ItemHeader(
                  stockCount: '20',
                  isLowStock: true,
                  reorderPoint: '100',
                ),
              ),
              const SizedBox(height: 20),
              // Stock Info Card
              StockInfoCard(
                stockLevel: '20 pcs',
                reorderPoint: '100 pcs',
              ),
              const SizedBox(height: 16),
              // Supplier Card
              SupplierCard(
                suppliers: const ['Supplier ABC', 'Supplier XYZ'],
                onSupplierSelected: (supplier) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Selected: $supplier'),
                      duration: const Duration(milliseconds: 800),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              // Sync Status Card
              SyncStatusCard(
                title: 'Sync Status',
                subtitle: 'Connected to ERP',
                timestamp: 'Auto-Sync 14 mins ago',
                isConnected: true,
              ),
              const SizedBox(height: 28),
              // Restock Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: RestockButton(
                    onPressed: _handleRestock,
                    label: 'Restock',
                    isLoading: _isRestocking,
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }


  // Restock button handler
  void _handleRestock() {
    setState(() {
      _isRestocking = true;
    });

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isRestocking = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✓ Restock order placed successfully'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.green,
          ),
        );
      }
    });
  }

  // Bottom navigation handler
  void handleBottomNavTap(int index) {
    setState(() {
      currentNavIndex = index;
    });

    final labels = ['Home', 'Restock', 'Account'];
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Navigating to ${labels[index]}'),
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
