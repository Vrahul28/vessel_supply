import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/res/routes_name/routes_name.dart';
import '../../res/colors/app_colors.dart';
import '../../widgets/custom_app_bar.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: CustomAppBar(
        text: 'Account',
      ),
      body: CustomScrollView(
        slivers: [
          // Header Background with Content
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.screenBackground,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 24.0,
                  bottom: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Card
                    _buildProfileCard(context),
                  ],
                ),
              ),
            ),
          ),
          // Settings Cards
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            sliver: SliverToBoxAdapter(
              child: _buildSettingsCard(context),
            ),
          ),
          // Bottom Padding
          const SliverPadding(padding: EdgeInsets.only(bottom: 24.0)),
        ],
      ),
    );
  }

  /// Profile Card Widget
  Widget _buildProfileCard(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          // Profile Header Row
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 16.0, right: 16.0, bottom: 0.0),
            child: Row(
              children: [
                // Avatar
                CircleAvatar(
                  radius: 25,
                  backgroundColor: const Color(0xFFE0E0E0),
                  backgroundImage: NetworkImage(
                    'https://ui-avatars.com/api/?name=Aurora&background=6366f1&color=fff&size=128',
                  ),
                  onBackgroundImageError: (exception, stackTrace) {},
                ),
                const SizedBox(width: 16.0),
                // Profile Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Vessel Profile',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1F1F1F),
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Aurora',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF757575),
                        ),
                      ),
                    ],
                  ),
                ),
                // Chevron Right
                Icon(
                  Icons.chevron_right,
                  color: Color(0xFF757575),
                  size: 24,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          // Divider
          Divider(
            height: 1,
            color: Color(0xFFE0E0E0),
            thickness: 1,
          ),
          const SizedBox(height: 16.0),
          // Sync Status Row
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF4CAF50),
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
                const SizedBox(width: 12.0),
                const Text(
                  'Sync Status: ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF424242),
                  ),
                ),
                const Text(
                  'Online',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4CAF50),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Settings Card Widget
  Widget _buildSettingsCard(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          // Settings Menu Items
          _buildMenuTile(
            icon: Icons.settings,
            title: 'Settings',
            titleColor: Color(0xFF212529),
            iconColor: Color(0xFF1F5F97),
            iconBgColor: Color(0xFFE3F2FD),
            onTap: () {
              Get.toNamed(RoutesName.settingPage);
            },
          ),
          Divider(
            height: 1,
            color: Color(0xFFE0E0E0),
            thickness: 1,
          ),
          _buildMenuTile(
            icon: Icons.security,
            title: 'Security',
            titleColor: Color(0xFF212529),
            iconColor: Color(0xFF7B1FA2),
            iconBgColor: Color(0xFFF3E5F5),
            onTap: () {
              Get.toNamed(RoutesName.securityPage);
            },
          ),
          Divider(
            height: 1,
            color: Color(0xFFE0E0E0),
            thickness: 1,
          ),
          // Logout Menu Item
          _buildMenuTile(
            icon: Icons.power_settings_new,
            title: 'Logout',
            titleColor: Color(0xFFD32F2F),
            iconColor: Color(0xFFD32F2F),
            iconBgColor: Color(0xFFFFEBEE),
            onTap: () {
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  /// Individual Menu Tile Widget
  Widget _buildMenuTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required Color iconBgColor,
    Color? titleColor,
    Color? iconColor,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        highlightColor: Color(0xFFF5F5F5),
        splashColor: Color(0xFFEEEEEE),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            children: [
              Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:  Icon(
                icon,
                color: iconColor,
                size: 22,
              ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF212529),
                    ),
                  ),
              ),
              Icon(
                Icons.chevron_right,
                color: titleColor ?? Color(0xFFBDBDBD),
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Logout Confirmation Dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Perform logout logic here
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Color(0xFFD32F2F)),
              ),
            ),
          ],
        );
      },
    );
  }
}
