import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color iconBgColor;
  final Color? titleColor;
  final Color? iconColor;

  const MenuTile({
    super.key,
     required this.icon,
    required this.title,
    required this.onTap,
    required this.iconBgColor,
    this.titleColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        highlightColor: Color(0xFFF5F5F5),
        splashColor: Color(0xFFEEEEEE),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child:  Icon(
                  icon,
                  color: iconColor,
                  size: 22,
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF212529),
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: titleColor ?? Color(0xFFBDBDBD),
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
