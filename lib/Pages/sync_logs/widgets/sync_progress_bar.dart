import 'package:flutter/material.dart';

import '../../../../res/colors/app_colors.dart';

class SyncProgressBar extends StatelessWidget {
  final double progress;

  const SyncProgressBar({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: LinearProgressIndicator(
        value: progress,
        minHeight: 8,
        backgroundColor: AppColors.lightGrey,
        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF2ECC71)),
      ),
    );
  }
}