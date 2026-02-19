import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleTile extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool initialValue;
  final ValueChanged<bool> onChanged;
  final Color? iconColor;

  const ToggleTile({
    super.key,
    required this.icon,
    required this.label,
    required this.initialValue,
    required this.onChanged,
    this.iconColor,
  });

  @override
  State<ToggleTile> createState() => _ToggleTileState();
}

class _ToggleTileState extends State<ToggleTile> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                widget.icon,
                size: 24,
                color: widget.iconColor ?? Colors.grey[600],
              ),
              const SizedBox(width: 12),
              Text(
                widget.label,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ],
          ),
          CupertinoSwitch(
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
              widget.onChanged(value);
            },
            activeColor: const Color(0xFF4CAF50),
            trackColor: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
