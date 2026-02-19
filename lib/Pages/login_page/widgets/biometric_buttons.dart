import 'package:flutter/material.dart';
import '../../../res/app_spacing/app_spacing.dart';
import '../../../res/colors/app_colors.dart';

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