import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/res/routes_name/routes_name.dart';
import '../../../res/app_spacing/app_spacing.dart';
import '../../../res/colors/app_colors.dart';
import '../../../widgets/custom_primary_button.dart';
import '../widgets/biometric_buttons.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/offline_toggle.dart';
import '../widgets/password_field.dart';
import '../widgets/profile_header_login.dart';
import '../widgets/secondary_button.dart';

// Main Vessel Login Screen
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController vesselNameController;
  late TextEditingController passwordController;
  bool offlineModeEnabled = false;

  @override
  void initState() {
    super.initState();
    vesselNameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    vesselNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.lightGrey2,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                MediaQuery.of(context).padding.bottom,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Main Login Card
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.cardWhite,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Profile Header
                      ProfileHeaderLogin(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Profile tapped'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: AppSpacing.xxl),
                      // Vessel Name Field
                      CustomTextField(
                        icon: Icons.directions_boat,
                        hintText: 'Vessel Name Aurora',
                        controller: vesselNameController,
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      // Password Field
                      PasswordField(
                        controller: passwordController,
                      ),
                      const SizedBox(height: AppSpacing.xxl),
                      // Login Button
                      PrimaryButton(
                        text: 'Login',
                        onPressed: () {
                          Get.toNamed(RoutesName.dashboard);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Login button pressed'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: AppSpacing.md),
                      // Offline Toggle
                      OfflineToggleRow(
                        isEnabled: offlineModeEnabled,
                        onChanged: (value) {
                          setState(() {
                            offlineModeEnabled = value;
                          });
                        },
                      ),
                      const SizedBox(height: AppSpacing.md),
                      // QR Crew Login Button
                      SecondaryButton(
                        label: 'QR Crew Login',
                        icon: Icons.qr_code_2,
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('QR Crew Login pressed'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      // Biometric Buttons
                      BiometricButtons(
                        onFingerprintPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Fingerprint authentication'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        onQRPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('QR scan initiated'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppSpacing.xxl),

                // Footer Text
                Text(
                  'Coded Vessel ID 12345',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.subtitleGrey,
                        fontSize: 12,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}










