import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/widgets/search_widget.dart';
import '../../../res/colors/app_colors.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../notification_page/widgets/section_header.dart';
import '../widgets/article_card.dart';
import '../widgets/offline_guard_card.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: CustomAppBar(
        text: 'Help Center',
        iconButton2: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchBarWidget(hintText: 'Search Articles....'),
                  const SizedBox(height: 28),
                  const SectionHeader(label: 'TOP ARTICLES'),
                  const SizedBox(height: 12),
                  const ArticlesCard(),
                  const SizedBox(height: 28),
                  const SectionHeader(label: 'OFFLINE GUIDES'),
                  const SizedBox(height: 12),
                  const OfflineGuidesCard(),
                  // const SizedBox(height: 32),
                  // const Center(
                  //   child: FooterText(),
                  // ),
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











// class FooterText extends StatelessWidget {
//   const FooterText({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: const [
//         Text(
//           'App v1.2.4 • Device ID: VS-8842',
//           style: TextStyle(
//             color: Color(0xFF999999),
//             fontSize: 12,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//         SizedBox(height: 2),
//         Text(
//           'Vessel: Aurora • All Systems Normal',
//           style: TextStyle(
//             color: Color(0xFF999999),
//             fontSize: 12,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//       ],
//     );
//   }
// }
