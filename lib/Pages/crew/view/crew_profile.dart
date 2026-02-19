import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/Pages/crew/widgets/profile_header.dart';
import 'package:vessel_supply/Pages/crew/widgets/toggle_tile.dart';
import 'package:vessel_supply/Pages/crew/widgets/info_tile.dart';
import '../../../widgets/custom_app_bar.dart';

class CrewProfile extends StatefulWidget {
  const CrewProfile({super.key});

  @override
  State<CrewProfile> createState() => _CrewProfileState();
}

class _CrewProfileState extends State<CrewProfile> {
  int currentNavIndex = 3; // Account tab is active by default
  bool _adminPrivileges = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF1F5),
      appBar: CustomAppBar(
        text: 'Crew Profile',
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
              // Profile Header Section with two-tone background
              ProfileHeader(
                name: 'John Smith',
                position: 'Captain',
                erpId: '57348',
                pin: '1234',
                imageUrl:
                    'https://images.pexels.com/photos/27523254/pexels-photo-27523254.jpeg',
              ),
              // Main Settings Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
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
                      // Admin Privileges with Cupertino Switch
                      ToggleTile(
                        icon: Icons.shield,
                        label: 'Admin Privileges',
                        initialValue: _adminPrivileges,
                        onChanged: (value) {
                          setState(() {
                            _adminPrivileges = value;
                          });
                        },
                        iconColor: Colors.grey[600],
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey[200],
                        indent: 16,
                        endIndent: 16,
                      ),
                      // Role
                      InfoTile(
                        icon: Icons.person,
                        label: 'Role',
                        value: 'Captain',
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Role pressed')),
                          );
                        },
                        iconColor: Colors.grey[600],
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey[200],
                        indent: 16,
                        endIndent: 16,
                      ),
                      // Offline Access
                      InfoTile(
                        icon: Icons.schedule,
                        label: 'Offline Access',
                        value: 'Within 7 days',
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Offline Access pressed')),
                          );
                        },
                        iconColor: Colors.grey[600],
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey[200],
                        indent: 16,
                        endIndent: 16,
                      ),
                      // Audit Logs
                      InfoTile(
                        icon: Icons.description,
                        label: 'Audit Logs',
                        value: '42',
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Audit Logs pressed')),
                          );
                        },
                        iconColor: Colors.grey[600],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Remove from Crew Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => _showRemoveDialog(context),
                    icon: const Icon(Icons.delete_outline, size: 20),
                    label: const Text('Remove from Crew'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE53935),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  // Remove from Crew confirmation dialog
  void _showRemoveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove from Crew?'),
        content: const Text(
          'Are you sure you want to remove John Smith from the crew? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Crew member removed successfully'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Text(
              'Remove',
              style: TextStyle(color: Color(0xFFE53935)),
            ),
          ),
        ],
      ),
    );
  }
}
