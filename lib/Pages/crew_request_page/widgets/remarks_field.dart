import 'package:flutter/material.dart';
import '../../../res/app_spacing/app_spacing.dart';
import '../../../res/colors/app_colors.dart';

class RemarksField extends StatelessWidget {
  final TextEditingController controller;

  const RemarksField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 5,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.lightGrey,
        hintText: 'Need supplies urgently for next voyage.',
        hintStyle: const TextStyle(
          color: AppColors.subtitleGrey,
          fontSize: 13,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.all(AppSpacing.lg),
      ),
      style: const TextStyle(
        color: AppColors.darkText,
        fontSize: 13,
      ),
    );
  }
}