import 'package:flutter/material.dart';
import 'package:vessel_supply/Pages/audit_detail_page/widgets/revert_change_tile.dart';
import 'audit_info_card.dart';
import 'change_log_card.dart';

class AuditDetailsContent extends StatelessWidget {
  const AuditDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        AuditInfoCard(),
        SizedBox(height: 18),
        Text(
          'CHANGE LOG',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF9E9E9E),
            letterSpacing: 0.6,
          ),
        ),
        SizedBox(height: 12),
        ChangeLogCard(),
        SizedBox(height: 14),
        RevertChangesTile(),
        SizedBox(height: 24),
      ],
    );
  }
}