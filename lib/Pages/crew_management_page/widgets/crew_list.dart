import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/routes_name/routes_name.dart';
import 'crew_card.dart';

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