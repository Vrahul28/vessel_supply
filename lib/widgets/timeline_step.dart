import 'package:flutter/material.dart';
import '../models/delivery_model.dart';

class TimelineStep extends StatelessWidget {
  final DeliveryStep step;
  final bool showConnectorBelow;

  const TimelineStep({super.key, required this.step, this.showConnectorBelow = true});

  Widget _buildCircle() {
    switch (step.status) {
      case DeliveryStepStatus.completed:
        return Container(
          width: 28,
          height: 28,
          decoration: const BoxDecoration(
            color: Color(0xFF2E8B57),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Icon(
              Icons.check,
              size: 16,
              color: Colors.white,
            ),
          ),
        );
      case DeliveryStepStatus.active:
        return Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF2F80ED), width: 2),
          ),
        );
      case DeliveryStepStatus.pending:
      default:
        return Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFC7CDD3), width: 2),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    const connectorDotCount = 6;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left timeline column
        SizedBox(
          width: 60,
          child: Column(
            children: [
              _buildCircle(),
              if (showConnectorBelow) const SizedBox(height: 8),
              if (showConnectorBelow)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(connectorDotCount, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      width: 2,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: Color(0xFFC7CDD3),
                        borderRadius: BorderRadius.all(Radius.circular(1)),
                      ),
                    );
                  }),
                ),
            ],
          ),
        ),

        // Right content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          step.title,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: step.status == DeliveryStepStatus.pending
                                ? const Color(0xFF6B7280)
                                : const Color(0xFF111827),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          step.subtitle,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (step.rightLabel != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        step.rightLabel!,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF2F80ED),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ],
    );
  }
}
