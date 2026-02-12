import 'package:flutter/material.dart';
import 'package:vessel_supply/res/colors/app_colors.dart';

class CustomAppBarActiveRFQ extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final VoidCallback? onBackPressed;
  final VoidCallback? onNewPressed;

  const CustomAppBarActiveRFQ({
    super.key,
    required this.title,
    this.onBackPressed,
    this.onNewPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: const BoxDecoration(
        color: AppColors.appBarColor,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              // Back arrow button
              GestureDetector(
                onTap: onBackPressed,
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              const SizedBox(width: 12),
              // Title
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // New button
              GestureDetector(
                onTap: onNewPressed,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2E7BA5),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Text(
                    '+ New',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
