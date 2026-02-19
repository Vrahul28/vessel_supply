import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/res/routes_name/routes_name.dart';
import 'package:vessel_supply/widgets/custom_app_bar.dart';
import 'package:vessel_supply/widgets/search_widget.dart';

import '../../notification_page/widgets/section_header.dart';
import '../widgets/crew_list.dart';

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
        iconButton2: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
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
                  child: const SectionHeader(label: 'CREW OF AURORA'),
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






