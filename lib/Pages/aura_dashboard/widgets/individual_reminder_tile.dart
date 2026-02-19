import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReminderTile extends StatelessWidget {
  final IconData icon;
  final Color iconBackgroundColor;
  final String title;
  final String subtitle;
  final bool showWarningBadge;
  final bool isEnabled;
  final ValueChanged<bool> onToggle;

  const ReminderTile({
    super.key,
    required this.icon,
    required this.iconBackgroundColor,
    required this.title,
    required this.subtitle,
    this.showWarningBadge = false,
    required this.isEnabled,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Icon Container
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 22,
                color: const Color(0xFF2F4E6F),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Title and Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    if (showWarningBadge)
                      Row(
                        children: [
                          const Icon(
                            Icons.warning_rounded,
                            size: 14,
                            color: Color(0xFFFF9800),
                          ),
                          const SizedBox(width: 4),
                        ],
                      ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: showWarningBadge
                            ? const Color(0xFFFF9800)
                            : Colors.grey[600],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Cupertino Switch
          CupertinoSwitch(
            value: isEnabled,
            onChanged: onToggle,
            activeColor: const Color(0xFF4CAF50),
            trackColor: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}