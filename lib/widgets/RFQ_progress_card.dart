import 'package:flutter/material.dart';

class RfqProgressCard extends StatelessWidget {
  const RfqProgressCard({super.key});

  final int pending = 8;
  final int quoted = 5;
  final int accepted = 3;

  @override
  Widget build(BuildContext context) {
    final int total = pending + quoted + accepted;
    final double pendingPercent = pending / total;
    final double quotedPercent = quoted / total;
    final double acceptedPercent = accepted / total;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'RFQ Progress',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
              Icon(
                Icons.trending_up,
                size: 18,
                color: const Color(0xFF1F5F97),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                flex: (pendingPercent * 100).toInt(),
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFF42A5F5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              Expanded(
                flex: (quotedPercent * 100).toInt(),
                child: Container(
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF26A69A),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              Expanded(
                flex: (acceptedPercent * 100).toInt(),
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFFBDBDBD),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildProgressLabel('Pending', pending, const Color(0xFF42A5F5)),
              ),
              Expanded(
                child: _buildProgressLabel('Quoted', quoted, const Color(0xFF26A69A)),
              ),
              Expanded(
                child: _buildProgressLabel('Accepted', accepted, const Color(0xFFBDBDBD)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressLabel(String label, int count, Color color) {
    return Text(
      '● $count $label',
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }
}