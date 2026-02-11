import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vessel_supply/widgets/custom_app_bar.dart';

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
        iconData: Icon(Icons.arrow_back, color: Colors.white),
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
              _buildLogoutButton(),
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
                _buildSettingRow(
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
                ),
                // Biometric Unlock
                _buildSettingRow(
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
                _buildSecurityItem(
                  icon: Icons.devices,
                  iconColor: const Color(0xFF1976D2),
                  iconBgColor: const Color(0xFFE3F2FD),
                  title: 'Trusted Devices',
                  showDivider: true,
                ),
                // Session Timeout
                _buildSecurityItem(
                  icon: Icons.schedule,
                  iconColor: const Color(0xFFD32F2F),
                  iconBgColor: const Color(0xFFFFEBEE),
                  title: 'Session Timeout',
                  trailing: '30 minutes',
                  showDivider: true,
                ),
                // Audit Trail
                _buildSecurityItem(
                  icon: Icons.history,
                  iconColor: const Color(0xFF388E3C),
                  iconBgColor: const Color(0xFFF1F8E9),
                  title: 'Audit Trail',
                  showDivider: true,
                ),
                // Change PIN
                _buildSecurityItem(
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

  /// Individual Security Item
  Widget _buildSecurityItem({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    String? trailing,
    required bool showDivider,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
          child: Row(
            children: [
              // Icon with circular background
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 16),
              // Title
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF212529),
                  ),
                ),
              ),
              // Trailing (optional)
              if (trailing != null)
                Text(
                  trailing,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF90A4AE),
                    fontWeight: FontWeight.w400,
                  ),
                )
              else
                const Icon(
                  Icons.chevron_right,
                  color: Color(0xFFBDBDBD),
                  size: 24,
                ),
            ],
          ),
        ),
        if (showDivider)
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 16),
            child: Container(
              height: 1,
              color: const Color(0xFFF5F5F5),
            ),
          ),
      ],
    );
  }

  /// Build individual setting row (for General section)
  Widget _buildSettingRow({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    String? subtitle,
    Widget? trailing,
    bool showChevron = false,
    required bool showDivider,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
          child: Row(
            children: [
              // Icon with circular background
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 16),
              // Title and Subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF212529),
                      ),
                    ),
                    if (subtitle != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          subtitle,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF90A4AE),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              // Trailing widget or chevron
              if (trailing != null)
                trailing
              else if (showChevron)
                const Icon(
                  Icons.chevron_right,
                  color: Color(0xFFBDBDBD),
                  size: 24,
                ),
            ],
          ),
        ),
        if (showDivider)
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 16),
            child: Container(
              height: 1,
              color: const Color(0xFFF5F5F5),
            ),
          ),
      ],
    );
  }

  /// Logout button
  Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          _showLogoutDialog();
        },
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFFFFEBEE),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.power_settings_new,
                color: Color(0xFFD32F2F),
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                'Log Out All Crew',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFD32F2F),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Logout confirmation dialog
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log Out All Crew'),
          content: const Text(
            'Are you sure you want to log out all crew members? This action cannot be undone.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Add logout logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logged out successfully')),
                );
              },
              child: const Text(
                'Log Out',
                style: TextStyle(color: Color(0xFFD32F2F)),
              ),
            ),
          ],
        );
      },
    );
  }
}