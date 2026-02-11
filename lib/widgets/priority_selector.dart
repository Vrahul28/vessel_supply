import 'package:flutter/material.dart';

class PrioritySelector extends StatefulWidget {
  final String initial;
  final ValueChanged<String>? onChanged;

  const PrioritySelector({Key? key, this.initial = 'Routine', this.onChanged}) : super(key: key);

  @override
  State<PrioritySelector> createState() => _PrioritySelectorState();
}

class _PrioritySelectorState extends State<PrioritySelector> {
  late String _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initial;
  }

  void _select(String value) {
    setState(() {
      _selected = value;
    });
    widget.onChanged?.call(value);
  }

  Widget _buildButton(String label, bool selected) {
    final bool isUrgent = label.toLowerCase() == 'urgent';
    return GestureDetector(
      onTap: () => _select(label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selected
              ? (isUrgent ? const Color(0xFFFFE5E5) : const Color(0xFFF1F3F5))
              : const Color(0xFFF1F3F5),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected && isUrgent ? const Color(0xFFE53935) : Colors.transparent,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected && isUrgent ? const Color(0xFFE53935) : const Color(0xFF374151),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Priority',
            style: TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildButton('Routine', _selected == 'Routine'),
              const SizedBox(width: 8),
              _buildButton('Urgent', _selected == 'Urgent'),
            ],
          ),
        ],
      ),
    );
  }
}
