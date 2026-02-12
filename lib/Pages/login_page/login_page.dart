import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/res/routes_name/routes_name.dart';
import '../../res/app_spacing/app_spacing.dart';
import '../../res/colors/app_colors.dart';

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
                      ProfileHeader(
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
                        label: 'Login',
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

// Profile Header Widget
class ProfileHeader extends StatelessWidget {
  final VoidCallback onPressed;

  const ProfileHeader({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: 26,
              backgroundColor: AppColors.appBarColor,
              backgroundImage: const NetworkImage(
                'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop',
              ),
              onBackgroundImageError: (exception, stackTrace) {
                // Fallback icon if image fails
              },
            ),
            const SizedBox(width: AppSpacing.md),

            // Profile Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Vessel Profile',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.darkText,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    'Aurora',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.subtitleGrey,
                        ),
                  ),
                ],
              ),
            ),

            // Chevron Icon
            Icon(
              Icons.chevron_right,
              color: AppColors.subtitleGrey,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Text Field Widget
class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.icon,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.subtitleGrey,
          fontSize: 14,
        ),
        prefixIcon: Icon(
          icon,
          color: AppColors.appBarColor,
          size: 20,
        ),
        filled: true,
        fillColor: AppColors.lightGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
      ),
    );
  }
}

// Password Field Widget
class PasswordField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: '••••••••',
        hintStyle: const TextStyle(
          color: AppColors.subtitleGrey,
          fontSize: 14,
        ),
        prefixIcon: const Icon(
          Icons.lock,
          color: AppColors.appBarColor,
          size: 20,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: AppColors.subtitleGrey,
            size: 20,
          ),
        ),
        filled: true,
        fillColor: AppColors.lightGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
      ),
    );
  }
}

// Primary Button Widget
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.appBarColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}

// Secondary Button Widget
class SecondaryButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onPressed;

  const SecondaryButton({
    super.key,
    required this.label,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: AppColors.lightGrey,
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: AppColors.subtitleGrey,
                size: 20,
              ),
              const SizedBox(width: AppSpacing.sm),
            ],
            Text(
              label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.darkText,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

// Offline Toggle Row Widget
class OfflineToggleRow extends StatelessWidget {
  final bool isEnabled;
  final Function(bool) onChanged;

  const OfflineToggleRow({
    super.key,
    required this.isEnabled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.check_circle,
          color: isEnabled ? AppColors.successGreen : AppColors.lightGrey,
          size: 18,
        ),
        const SizedBox(width: AppSpacing.sm),
        Text(
          'Offline Mode',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.darkText,
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(width: AppSpacing.md),
        CupertinoSwitch(
          value: isEnabled,
          onChanged: onChanged,
          activeColor: AppColors.successGreen,
        ),
      ],
    );
  }
}

// Biometric Buttons Widget
class BiometricButtons extends StatelessWidget {
  final VoidCallback onFingerprintPressed;
  final VoidCallback onQRPressed;

  const BiometricButtons({
    super.key,
    required this.onFingerprintPressed,
    required this.onQRPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Fingerprint Button
        GestureDetector(
          onTap: onFingerprintPressed,
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.fingerprint,
              color: AppColors.appBarColor,
              size: 28,
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.xl),

        // QR Code Button
        GestureDetector(
          onTap: onQRPressed,
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.qr_code_2,
              color: AppColors.appBarColor,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }
}
