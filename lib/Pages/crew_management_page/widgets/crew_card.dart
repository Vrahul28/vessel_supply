import 'package:flutter/material.dart';

class CrewCard extends StatelessWidget {
  final String name;
  final String title;
  VoidCallback? onPressed;

  CrewCard({
    super.key,
    required this.name,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            children: [
              // Avatar
              CircleAvatar(
                radius: 28,
                backgroundColor: _getAvatarColor(name),
                child: Text(
                  _getInitials(name),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              // Name and Title
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              // Chevron
              IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to get initials from name
  String _getInitials(String name) {
    final parts = name.split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name[0].toUpperCase();
  }

  // Helper method to assign consistent colors to avatars
  Color _getAvatarColor(String name) {
    final colors = [
      const Color(0xFF6B7280),
      const Color(0xFF4B5563),
      const Color(0xFF5A7C99),
      const Color(0xFF8B5A4A),
    ];
    return colors[name.length % colors.length];
  }
}