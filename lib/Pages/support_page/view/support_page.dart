import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/res/routes_name/routes_name.dart';
import '../../../res/colors/app_colors.dart';
import '../../../widgets/custom_app_bar.dart';
import '../widgets/emerengy_card.dart';
import '../widgets/help_center_card.dart';
import '../widgets/raise_ticket_card.dart';
import '../widgets/sync_logs_card.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  final TextEditingController _ticketController = TextEditingController();

  @override
  void dispose() {
    _ticketController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: CustomAppBar(
        text: 'Support',
        iconButton2: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: [
                  EmergencySupportCard(
                    onCallPressed: () {
                      debugPrint("Calling emergency support...");
                    },
                  ),
                  const SizedBox(height: 20),
                  RaiseTicketCard(
                    controller: _ticketController,
                    onAttachPhoto: () {
                      debugPrint("Attach photo");
                    },
                    onSubmitTicket: () {
                      debugPrint("Ticket submitted");
                    },
                  ),
                  const SizedBox(height: 20),
                  HelpCenterCard(
                    onTap: () {
                      Get.toNamed(RoutesName.helpCeneterPage);
                    },
                  ),
                  const SizedBox(height: 20),
                  SyncLogsCard(
                    onSyncPressed: () {
                      Get.toNamed(RoutesName.syncPage);
                    },
                  ),
                  // const SizedBox(height: 32),
                  // const FooterInfo(),
                  // const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class FooterInfo extends StatelessWidget {
  const FooterInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'App v1.2.4',
          style: TextStyle(
            color: Color(0xFF999999),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Device ID: VS-8842 • Vessel: Aurora',
          style: TextStyle(
            color: Color(0xFF999999),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Color(0xFF4CAF50),
              size: 16,
            ),
            SizedBox(width: 4),
            Text(
              'All Systems Normal',
              style: TextStyle(
                color: Color(0xFF999999),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
