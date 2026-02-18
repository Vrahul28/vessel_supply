import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/widgets/search_widget.dart';
import '../../res/colors/app_colors.dart';
import '../../widgets/custom_app_bar.dart';

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
                  const SectionTitle(title: 'TOP ARTICLES'),
                  const SizedBox(height: 12),
                  const ArticlesCard(),
                  const SizedBox(height: 28),
                  const SectionTitle(title: 'OFFLINE GUIDES'),
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


class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xFF7A8FA0),
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
      ),
    );
  }
}

class ArticlesCard extends StatelessWidget {
  const ArticlesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final articles = [
      'Troubleshooting Connection Issues',
      'Ordering Spare Parts & Supplies',
      'Understanding Inventory Risk',
      'Syncing Data with Shore Office',
      'Preparing for Vessel Inspection',
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1A000000),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: List.generate(
          articles.length,
          (index) => Column(
            children: [
              ArticleTile(title: articles[index]),
              if (index < articles.length - 1)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(
                    color: Color(0xFFEEEEEE),
                    height: 1,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArticleTile extends StatelessWidget {
  final String title;

  const ArticleTile({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFE8F4FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Icon(
                Icons.folder_outlined,
                color: Color(0xFF2196F3),
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF333333),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: Color(0xFFBBBBBB),
            size: 22,
          ),
        ],
      ),
    );
  }
}

class OfflineGuidesCard extends StatelessWidget {
  const OfflineGuidesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1A000000),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: const [
          GuideTile(
            icon: Icons.download_for_offline_outlined,
            title: 'Download PDFs',
            subtitle: 'Checklists & Manuals',
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Color(0xFFEEEEEE),
              height: 1,
            ),
          ),
          GuideTile(
            icon: Icons.shield_outlined,
            title: 'Emergency Protocols',
            subtitle: 'Safety Procedures',
          ),
        ],
      ),
    );
  }
}

class GuideTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const GuideTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFE8F4FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(
                icon,
                color: const Color(0xFF2F7FA0),
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: Color(0xFFBBBBBB),
            size: 22,
          ),
        ],
      ),
    );
  }
}

class FooterText extends StatelessWidget {
  const FooterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'App v1.2.4 • Device ID: VS-8842',
          style: TextStyle(
            color: Color(0xFF999999),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 2),
        Text(
          'Vessel: Aurora • All Systems Normal',
          style: TextStyle(
            color: Color(0xFF999999),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
