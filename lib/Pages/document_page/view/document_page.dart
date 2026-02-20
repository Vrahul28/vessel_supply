import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vessel_supply/res/colors/app_colors.dart';
import 'package:vessel_supply/res/routes_name/routes_name.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_primary_button.dart';
import '../../../widgets/search_widget.dart';
import '../models/doc_data.dart';
import '../widgets/document_tile.dart';


class DocumentsPage extends StatelessWidget {
  const DocumentsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final documents = const [
      DocData(
        title: 'Invoice #8842.pdf',
        details: '253 KB • PDF A/ICNGG',
        downloaded: false,
      ),
      DocData(
        title: 'Packing List.pdf',
        details: '160 KB • PDF A/ICNGG',
        downloaded: false,
      ),
      DocData(
        title: 'Customs Clearance.pdf',
        details: 'PDF A/ICNGG',
        downloaded: true,
      ),
      DocData(
        title: 'Delivery Receipt.pdf',
        details: 'PDF A/ICNGG',
        downloaded: true,
      ),
      DocData(
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
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: DocumentTile(
                title: "Document Center",
                details: "Search documents",
                icon: Icon(Icons.picture_as_pdf, color: AppColors.appBarColor),
                downloaded: false,
                onTap: () {
                  Get.toNamed(RoutesName.documentCenter);
                },
              ),
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
                    icon: Icon(Icons.picture_as_pdf, color: Color(0xFFD32F2F)),
                    onTap: (){
                      Get.toNamed(RoutesName.documentViwer);
                    },
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





