import 'package:flutter/material.dart';

enum RFQStatus {
  pending,
  accepted,
  delivered,
  draft,
}

class StatusBadge extends StatelessWidget {
  final RFQStatus status;

  const StatusBadge({
    Key? key,
    required this.status,
  }) : super(key: key);

  Map<RFQStatus, Map<String, Color>> get _statusStyles => {
        RFQStatus.pending: {
          'background': const Color(0xFFFFE7CC),
          'text': const Color(0xFFD9822B),
        },
        RFQStatus.accepted: {
          'background': const Color(0xFFDFF5E1),
          'text': const Color(0xFF2E8B57),
        },
        RFQStatus.delivered: {
          'background': const Color(0xFFE2E8F0),
          'text': const Color(0xFF4A6FA5),
        },
        RFQStatus.draft: {
          'background': const Color(0xFFE5E7EB),
          'text': const Color(0xFF6B7280),
        },
      };

  String get _statusText =>
      status.name[0].toUpperCase() + status.name.substring(1);

  @override
  Widget build(BuildContext context) {
    final colors = _statusStyles[status]!;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: colors['background'],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        _statusText,
        style: TextStyle(
          color: colors['text'],
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class RFQCard extends StatelessWidget {
  final String rfqNumber;
  final String department;
  final RFQStatus status;
  final VoidCallback? onTap;

  const RFQCard({
    Key? key,
    required this.rfqNumber,
    required this.department,
    required this.status,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side - RFQ info
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '#$rfqNumber',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  department,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 110, 114, 122),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            // Right side - Status badge
            StatusBadge(status: status),
          ],
        ),
      ),
    );
  }
}
