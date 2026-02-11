import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/res/routes_name/routes_name.dart';
import 'package:vessel_supply/widgets/custom_app_bar.dart';
import 'package:vessel_supply/widgets/search_widget.dart';


class CrewManagementScreen extends StatelessWidget {
  const CrewManagementScreen({super.key});

  // Sample crew data
  static final List<Map<String, String>> crewMembers = [
    {'name': 'John Smith', 'title': 'Captain'},
    {'name': 'Chris Becker', 'title': 'Chief Engineer'},
    {'name': 'Mary Klein', 'title': '2nd Officer'},
    {'name': 'Raj Patel', 'title': 'Bosun'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: CustomAppBar(
      text: 'Crew Management',
      iconData: Icon(Icons.arrow_back, color: Colors.white),
      ),
      body: Column(
        children: [
          // Expanded scrollable content
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(height: 20),
                // Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SearchBarWidget(hintText: 'Search crew...'),
                ),
                const SizedBox(height: 24),
                // Section Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const SectionHeader(title: 'CREW OF AURORA'),
                ),
                const SizedBox(height: 12),
                // Crew List
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CrewListWidget(crewMembers: crewMembers),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class AddCrewButton extends StatelessWidget {
  const AddCrewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.add, color: Color(0xFF2563EB), size: 20),
                const SizedBox(width: 4),
                const Text(
                  'Add Crew',
                  style: TextStyle(
                    color: Color(0xFF2563EB),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xFF3F5A7C),
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
      ),
    );
  }
}

class CrewListWidget extends StatelessWidget {
  final List<Map<String, String>> crewMembers;

  const CrewListWidget({super.key, required this.crewMembers});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: List.generate(crewMembers.length, (index) {
          final crew = crewMembers[index];
          final isLast = index == crewMembers.length - 1;
          return Column(
            children: [
              CrewCard(
                name: crew['name'] ?? '',
                title: crew['title'] ?? '',
                onPressed: () {
                  Get.toNamed(RoutesName.crewProfile);
                },
              ),
              if (!isLast)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Divider(
                    height: 1,
                    color: Colors.grey.shade200,
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}


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
