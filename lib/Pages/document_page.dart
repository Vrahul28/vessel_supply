import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/res/colors/app_colors.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_primary_button.dart';
import '../widgets/search_widget.dart';


class DocumentsPage extends StatelessWidget {
  const DocumentsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final documents = const [
      _DocData(
        title: 'Invoice #8842.pdf',
        details: '253 KB • PDF A/ICNGG',
        downloaded: false,
      ),
      _DocData(
        title: 'Packing List.pdf',
        details: '160 KB • PDF A/ICNGG',
        downloaded: false,
      ),
      _DocData(
        title: 'Customs Clearance.pdf',
        details: 'PDF A/ICNGG',
        downloaded: true,
      ),
      _DocData(
        title: 'Delivery Receipt.pdf',
        details: 'PDF A/ICNGG',
        downloaded: true,
      ),
      _DocData(
        title: 'Manifest_Final_v2.pdf',
        details: '1.2 MB • PDF A/ICNGG',
        downloaded: false,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: CustomAppBar(
        text: 'Documents',
        iconButton2: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: SearchBarWidget(hintText: 'Search documents...'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                itemCount: documents.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  final d = documents[index];
                  return DocumentTile(
                    title: d.title,
                    details: d.details,
                    downloaded: d.downloaded,
                    onTap: () => debugPrint('Tapped ${d.title}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 18),
        child: PrimaryButton(
                      text: 'Offline Saved',
                      backgroundColor: AppColors.appBarColor,
                      onPressed: () {},
                    ),
      ),
    );
  }
}

class _DocData {
  final String title;
  final String details;
  final bool downloaded;
  const _DocData({required this.title, required this.details, required this.downloaded});
}


// DocumentTile
class DocumentTile extends StatelessWidget {
  final String title;
  final String details;
  final bool downloaded;
  final VoidCallback onTap;

  const DocumentTile({
    super.key,
    required this.title,
    required this.details,
    required this.downloaded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, 2)),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            children: [
              // Icon box
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Icon(Icons.picture_as_pdf, color: Color(0xFFD32F2F)),
                ),
              ),
              const SizedBox(width: 12),
              // Texts
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF1F1F1F)),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      details,
                      style: const TextStyle(fontSize: 12, color: Color(0xFF9E9E9E)),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // Right status
              downloaded
                  ? Row(
                      children: const [
                        Text('Downloaded', style: TextStyle(color: Color(0xFF2E8B57), fontWeight: FontWeight.w600)),
                        SizedBox(width: 8),
                        Icon(Icons.check_circle, color: Color(0xFF2E8B57)),
                      ],
                    )
                  : const Icon(Icons.chevron_right, color: Color(0xFFBDBDBD)),
            ],
          ),
        ),
      ),
    );
  }
}


