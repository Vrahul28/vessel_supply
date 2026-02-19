import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StorageActionTile extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isToggle;
  final bool toggleInitialValue;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onToggleChanged;
  final Color? iconColor;
  final bool isDangerous;

  const StorageActionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isToggle = false,
    this.toggleInitialValue = false,
    this.onTap,
    this.onToggleChanged,
    this.iconColor,
    this.isDangerous = false,
  });

  @override
  State<StorageActionTile> createState() => _StorageActionTileState();
}

class _StorageActionTileState extends State<StorageActionTile> {
  late bool _toggleValue;

  @override
  void initState() {
    super.initState();
    _toggleValue = widget.toggleInitialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.isToggle ? null : widget.onTap,
        highlightColor: Colors.grey.withOpacity(0.05),
        splashColor: Colors.grey.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          child: Row(
            children: [
              // Icon
              Icon(
                widget.icon,
                size: 24,
                color: widget.isDangerous
                    ? const Color(0xFFE53935)
                    : (widget.iconColor ?? const Color(0xFF2F4E6F)),
              ),
              const SizedBox(width: 12),
              // Title and Subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: widget.isDangerous
                            ? const Color(0xFFE53935)
                            : const Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              // Right Action
              if (widget.isToggle)
                CupertinoSwitch(
                  value: _toggleValue,
                  onChanged: (value) {
                    setState(() {
                      _toggleValue = value;
                    });
                    widget.onToggleChanged?.call(value);
                  },
                  activeColor: const Color(0xFF4CAF50),
                  trackColor: Colors.grey[300],
                )
              else
                Icon(
                  Icons.chevron_right,
                  size: 20,
                  color: Colors.grey[400],
                ),
            ],
          ),
        ),
      ),
    );
  }
}