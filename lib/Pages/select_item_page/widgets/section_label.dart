import 'package:flutter/material.dart';
import '../../../res/colors/app_colors.dart';

class SectionLabel extends StatelessWidget {
  final String label;

  const SectionLabel({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: AppColors.subtitleGrey,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
      ),
    );
  }
}