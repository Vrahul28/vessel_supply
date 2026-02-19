import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/widgets/custom_app_bar.dart';
import '../../../res/routes_name/routes_name.dart';
import '../../security_page/widgets/security_item.dart';
import '../../security_page/widgets/setting_row.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool pinEnabled = true;
  bool biometricEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F7),
      appBar: CustomAppBar(
        text: 'Settings',
        iconButton2: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              // General Section
              _buildGeneralSection(),
              const SizedBox(height: 24),

              // Security Section
              _buildSecuritySection(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  /// GENERAL Section with PIN and Biometric settings
  Widget _buildGeneralSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0, bottom: 12),
            child: Text(
              'GENERAL',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF90A4AE),
                letterSpacing: 0.5,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                // Require App PIN
                SettingRow(
                  icon: Icons.wifi,
                  iconColor: const Color(0xFF7B1FA2),
                  iconBgColor: const Color(0xFFF3E5F5),
                  title: 'Syn Status',
                  subtitle: 'Enabled',
                  showChevron: true,
                  showDivider: false,
                ),
                // Biometric Unlock
                SettingRow(
                  icon: Icons.storage,
                  iconColor: const Color(0xFF7B1FA2),
                  iconBgColor: const Color(0xFFF3E5F5),
                  title: 'Offline Storage',
                  subtitle: 'Enabled',
                  showChevron: true,
                  showDivider: false,
                  onTap: () {
                    Get.toNamed(RoutesName.offlineStoragePage);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// SECURITY Section with multiple options
  Widget _buildSecuritySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0, bottom: 12),
            child: Text(
              'SECURITY',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF90A4AE),
                letterSpacing: 0.5,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                // Trusted Devices
                SecurityItem(
                  icon: Icons.notifications,
                  iconColor: const Color(0xFF1976D2),
                  iconBgColor: const Color(0xFFE3F2FD),
                  title: 'Notifications',
                  showDivider: true,
                  onTap: () {
                    Get.toNamed(RoutesName.notificationPage);
                  },
                ),
                // Session Timeout
                SecurityItem(
                  icon: Icons.person,
                  iconColor: const Color(0xFFD32F2F),
                  iconBgColor: const Color(0xFFFFEBEE),
                  title: 'Crew Management',
                  trailing: '',
                  showDivider: true,
                  onTap: () {
                    Get.toNamed(RoutesName.crewManagement);
                  },
                ),
                // Audit Trail
                SecurityItem(
                  icon: Icons.lock_open_rounded,
                  iconColor: const Color(0xFF388E3C),
                  iconBgColor: const Color(0xFFF1F8E9),
                  title: 'Application Lock',
                  showDivider: true,
                  onTap: () {
                    Get.toNamed(RoutesName.appLockPage);
                  },
                ),
                // Change PIN
                SecurityItem(
                  icon: Icons.lock,
                  iconColor: const Color(0xFFFF8F00),
                  iconBgColor: const Color(0xFFFFF3E0),
                  title: 'Security',
                  showDivider: false,
                  onTap: () {
                    Get.toNamed(RoutesName.securityPage);
                  },
                ),
                // Change PIN
                SecurityItem(
                  icon: Icons.lock,
                  iconColor: const Color(0xFFFF8F00),
                  iconBgColor: const Color(0xFFFFF3E0),
                  title: 'Support',
                  showDivider: false,
                  onTap: () {
                    Get.toNamed(RoutesName.supportPage);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}
