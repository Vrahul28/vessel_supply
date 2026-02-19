import 'package:flutter/material.dart';

import 'guid_tile.dart';

class OfflineGuidesCard extends StatelessWidget {
  const OfflineGuidesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1A000000),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: const [
          GuideTile(
            icon: Icons.download_for_offline_outlined,
            title: 'Download PDFs',
            subtitle: 'Checklists & Manuals',
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFFEEEEEE),
              height: 1,
            ),
          ),
          GuideTile(
            icon: Icons.shield_outlined,
            title: 'Emergency Protocols',
            subtitle: 'Safety Procedures',
          ),
        ],
      ),
    );
  }
}