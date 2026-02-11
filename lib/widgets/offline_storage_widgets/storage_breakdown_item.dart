import 'package:flutter/material.dart';

class StorageBreakdownItem extends StatelessWidget {
  final IconData icon;
  final String moduleName;
  final int storageSizeMB;
  final VoidCallback? onTap;

  const StorageBreakdownItem({
    super.key,
    required this.icon,
    required this.moduleName,
    required this.storageSizeMB,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        highlightColor: Colors.grey.withOpacity(0.05),
        splashColor: Colors.grey.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          child: Row(
            children: [
              // Icon
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF2F4E6F).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: const Color(0xFF2F4E6F),
                ),
              ),
              const SizedBox(width: 12),
              // Module Name
              Expanded(
                child: Text(
                  moduleName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),
              // Storage Size
              Text(
                '$storageSizeMB MB',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
