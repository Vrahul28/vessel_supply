import 'package:flutter/material.dart';

class DocumentTile extends StatelessWidget {
  final String title;
  final String details;
  final bool downloaded;
  final VoidCallback onTap;

  const DocumentTile({
    super.key,
    required this.title,
    required this.details,
    required this.downloaded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, 2)),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            children: [
              // Icon box
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Icon(Icons.picture_as_pdf, color: Color(0xFFD32F2F)),
                ),
              ),
              const SizedBox(width: 12),
              // Texts
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF1F1F1F)),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      details,
                      style: const TextStyle(fontSize: 12, color: Color(0xFF9E9E9E)),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // Right status
              downloaded
                  ? Row(
                children: const [
                  Text('Downloaded', style: TextStyle(color: Color(0xFF2E8B57), fontWeight: FontWeight.w600)),
                  SizedBox(width: 8),
                  Icon(Icons.check_circle, color: Color(0xFF2E8B57)),
                ],
              )
                  : const Icon(Icons.chevron_right, color: Color(0xFFBDBDBD)),
            ],
          ),
        ),
      ),
    );
  }
}