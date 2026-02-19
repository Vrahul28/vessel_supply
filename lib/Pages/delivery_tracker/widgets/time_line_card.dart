import 'package:flutter/material.dart';

import '../../../res/colors/app_colors.dart';

class TimelineCard extends StatelessWidget {
  const TimelineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTimelineStep(
              stepNumber: 1,
              icon: Icons.check,
              title: 'Packed',
              subtitle: 'Supplier Warehouse',
              isCompleted: true,
              circleColor: const Color(0xFF4CAF50),
            ),
            _buildDottedLine(),
            _buildTimelineStep(
              stepNumber: 2,
              icon: Icons.local_shipping,
              title: 'In Transit',
              subtitle: 'Est. Arrival: 2:30 PM',
              isCompleted: true,
              circleColor: const Color(0xFF1976D2),
            ),
            _buildDottedLine(),
            _buildTimelineStep(
              stepNumber: 3,
              icon: Icons.directions_boat,
              title: 'Arriving at Port',
              subtitle: 'Today, 2:32 PM',
              isCompleted: false,
              circleColor: AppColors.appBarColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineStep({
    required int stepNumber,
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isCompleted,
    required Color circleColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Step Indicator
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: circleColor,
            boxShadow: [
              BoxShadow(
                color: circleColor.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        // Content
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF212121),
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF757575),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Chevron Right
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Icon(
            Icons.chevron_right,
            color: Color(0xFFBDBDBD),
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildDottedLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Column(
          children: List.generate(
            6,
                (index) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 1.0),
              child: SizedBox(
                height: 3,
                width: 3,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.appBarColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}