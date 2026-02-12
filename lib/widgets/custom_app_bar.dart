import 'package:flutter/material.dart';
import '../res/colors/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final IconButton? iconButton;
  final IconButton? iconButton2;

  const CustomAppBar({
    super.key,
    required this.text,
    this.iconButton,
    this.iconButton2,
  });

  @override
  Size get preferredSize => const Size.fromHeight(63);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appBarColor,
      elevation: 0,
      centerTitle: true,
      leading: Container(
        margin: const EdgeInsets.only(left: 16),
        child: iconButton2,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Stack(
            alignment: Alignment.center,
            children: [
              iconButton ?? const SizedBox(),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
