import 'package:flutter/material.dart';
import '../../../res/colors/app_colors.dart';

class FormLabel extends StatelessWidget {
  final String label;

  const FormLabel({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: AppColors.darkText,
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.3,
      ),
    );
  }
}