import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/colors/app_colors.dart';
import '../../../widgets/custom_app_bar.dart';
import '../widgets/audit_detail_count.dart';

class AuditDetailsScreen extends StatelessWidget {
	const AuditDetailsScreen({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: AppColors.screenBackground,
      appBar: CustomAppBar(
        text: 'Audit Details',
        iconButton2: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
			body: Column(
				children: const [
					Expanded(
						child: SingleChildScrollView(
							child: Padding(
								padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
								child: AuditDetailsContent(),
							),
						),
					),
				],
			),
		);
	}
}




