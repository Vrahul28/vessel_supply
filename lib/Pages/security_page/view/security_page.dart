import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/widgets/custom_app_bar.dart';
import '../../../res/routes_name/routes_name.dart';
import '../widgets/logout_button.dart';
import '../widgets/security_item.dart';
import '../widgets/setting_row.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  bool pinEnabled = true;
  bool biometricEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F7),
      appBar: CustomAppBar(
        text: 'Security',
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

              // Logout Button
              LogoutButton(),
              const SizedBox(height: 32),
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
                  icon: Icons.shield,
                  iconColor: const Color(0xFF42A5F5),
                  iconBgColor: const Color(0xFFE3F2FD),
                  title: 'Require App PIN',
                  trailing: CupertinoSwitch(
                    value: pinEnabled,
                    onChanged: (value) {
                      setState(() => pinEnabled = value);
                    },
                    activeColor: const Color(0xFF3D5A80),
                  ),
                  showDivider: true,
                  showChevron: false,
                ),
                // Biometric Unlock
                SettingRow(
                  icon: Icons.fingerprint,
                  iconColor: const Color(0xFF7B1FA2),
                  iconBgColor: const Color(0xFFF3E5F5),
                  title: 'Biometric Unlock',
                  subtitle: 'Enabled',
                  showChevron: true,
                  showDivider: false,
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
                  icon: Icons.devices,
                  iconColor: const Color(0xFF1976D2),
                  iconBgColor: const Color(0xFFE3F2FD),
                  title: 'Trusted Devices',
                  showDivider: true,
                ),
                // Session Timeout
                SecurityItem(
                  icon: Icons.schedule,
                  iconColor: const Color(0xFFD32F2F),
                  iconBgColor: const Color(0xFFFFEBEE),
                  title: 'Session Timeout',
                  trailing: '30 minutes',
                  showDivider: true,
                ),
                // Audit Trail
                SecurityItem(
                  icon: Icons.history,
                  iconColor: const Color(0xFF388E3C),
                  iconBgColor: const Color(0xFFF1F8E9),
                  title: 'Audit Trail',
                  showDivider: true,
                  onTap: () {
                    Get.toNamed(RoutesName.auditTrailPage);
                  },
                ),
                // Change PIN
                SecurityItem(
                  icon: Icons.lock,
                  iconColor: const Color(0xFFFF8F00),
                  iconBgColor: const Color(0xFFFFF3E0),
                  title: 'Change PIN',
                  showDivider: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}
