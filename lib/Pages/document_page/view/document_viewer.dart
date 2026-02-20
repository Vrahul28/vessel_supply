import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../../res/colors/app_colors.dart';
import '../../../widgets/custom_app_bar.dart';

class DocumentViewer extends StatelessWidget {
  const DocumentViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: CustomAppBar(
        text: 'Document Viwer',
        iconButton2: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Center(
        child: SfPdfViewer.asset("assets/pdf/file-sample_150kB.pdf"),
      ),
    );
  }
}