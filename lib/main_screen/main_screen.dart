import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vessel_supply/widgets/RFQ_progress_card.dart';
import 'package:vessel_supply/widgets/custom_action_card.dart';
import 'package:vessel_supply/widgets/welcome_card.dart';

import '../res/routes_name/routes_name.dart';
import '../widgets/custom_app_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Vessel Supply',
        iconButton: IconButton(
                onPressed: () {},
                icon:
                    const Icon(Icons.notifications_none, color: Colors.white),
                iconSize: 25,
              ),
              iconData: Icon(Icons.directions_boat, color: Colors.white,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const WelcomeCard(),
              const SizedBox(height: 20),
              const QuickGrid(),
              const SizedBox(height: 20),
              RfqProgressCard(),
            ],
          ),
        ),
      ),
    );
  }

}

class QuickGrid extends StatelessWidget {
  const QuickGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<CustomActionCard> items = [
      CustomActionCard(
        label: 'RFQs',
        icon: Icons.description,
        backgroundColor: Color(0xFFE3F2FD),
        iconColor: Color(0xFF1976D2),
        onTap: (){
          Get.toNamed(RoutesName.activeRFQ);
        },
      ),
      CustomActionCard(
        label: 'Deliveries',
        icon: Icons.local_shipping,
        backgroundColor: Color(0xFFF3E5F5),
        iconColor: Color(0xFF7B1FA2),
        onTap: (){
          Get.toNamed(RoutesName.deliveries);
        },
      ),
      CustomActionCard(
        label: 'Inventory',
        icon: Icons.inventory_2,
        backgroundColor: Color(0xFFFFF3E0),
        iconColor: Color(0xFFF57C00),
        onTap: (){
          Get.toNamed(RoutesName.inventory);
        },
      ),
      CustomActionCard(
        label: 'Crew Requests',
        icon: Icons.people,
        backgroundColor: Color(0xFFE0F2F1),
        iconColor: Color(0xFF00796B),
        onTap: (){
          Get.toNamed(RoutesName.crewManagement);
        },
      ),
    ];
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 1,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: items,
    );
  }
}

