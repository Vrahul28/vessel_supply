import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/colors/app_colors.dart';
import '../../widgets/custom_app_bar.dart';

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

class AuditDetailsContent extends StatelessWidget {
	const AuditDetailsContent({super.key});

	@override
	Widget build(BuildContext context) {
		return Column(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: const [
				AuditInfoCard(),
				SizedBox(height: 18),
				Text(
					'CHANGE LOG',
					style: TextStyle(
						fontSize: 12,
						fontWeight: FontWeight.w600,
						color: Color(0xFF9E9E9E),
						letterSpacing: 0.6,
					),
				),
				SizedBox(height: 12),
				ChangeLogCard(),
				SizedBox(height: 14),
				RevertChangesTile(),
				SizedBox(height: 24),
			],
		);
	}
}

// Audit Info Card
class AuditInfoCard extends StatelessWidget {
	const AuditInfoCard({super.key});

	@override
	Widget build(BuildContext context) {
		return Container(
			width: double.infinity,
			decoration: BoxDecoration(
				color: Colors.white,
				borderRadius: BorderRadius.circular(14),
				boxShadow: [
					BoxShadow(
						color: Colors.black.withOpacity(0.06),
						blurRadius: 12,
						offset: const Offset(0, 4),
					),
				],
			),
			child: Padding(
				padding: const EdgeInsets.all(16.0),
				child: Column(
					children: [
						Row(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								Container(
									width: 36,
									height: 36,
									decoration: BoxDecoration(
										color: const Color(0xFFFFF3E0),
										borderRadius: BorderRadius.circular(10),
									),
									child: const Icon(Icons.info_outline, color: Color(0xFFFFB74D)),
								),
								const SizedBox(width: 12),
								Expanded(
									child: Column(
										crossAxisAlignment: CrossAxisAlignment.start,
										children: const [
											Text(
												'ID Changed',
												style: TextStyle(
													fontSize: 16,
													fontWeight: FontWeight.w700,
													color: Color(0xFF1F1F1F),
												),
											),
											SizedBox(height: 6),
											Text(
												'Entity Name: Request For Quote #98-452',
												style: TextStyle(
													fontSize: 13,
													fontWeight: FontWeight.w400,
													color: Color(0xFF757575),
												),
											),
										],
									),
								),
							],
						),
						const SizedBox(height: 14),
						const Divider(height: 1, color: Color(0xFFECEFF1)),
						const SizedBox(height: 12),
						Row(
							children: [
								Container(
									width: 42,
									height: 42,
									decoration: BoxDecoration(
										color: const Color(0xFFE3F2FD),
										borderRadius: BorderRadius.circular(10),
									),
									child: const Icon(Icons.verified_user_outlined, color: Color(0xFF1976D2)),
								),
								const SizedBox(width: 12),
								Expanded(
									child: Column(
										crossAxisAlignment: CrossAxisAlignment.start,
										children: const [
											Text(
												'Triggered By: M. Lewis',
												style: TextStyle(
													fontSize: 14,
													fontWeight: FontWeight.w600,
													color: Color(0xFF1F1F1F),
												),
											),
											SizedBox(height: 6),
											Text(
												'Fleet Manager • Sep 17, 2024, 09:08 UTC',
												style: TextStyle(
													fontSize: 12,
													fontWeight: FontWeight.w400,
													color: Color(0xFF9E9E9E),
												),
											),
										],
									),
								),
							],
						),
						const SizedBox(height: 15),
            LabelValueRow(label: 'Vessel', value: 'Aurora'),
            SizedBox(width: 12),
            LabelValueRow(label: 'Location', value: 'Bridge Tablet'),
						const SizedBox(height: 16),
						const ActionButtonsRow(),
					],
				),
			),
		);
	}
}

class LabelValueRow extends StatelessWidget {
	final String label;
	final String value;

	const LabelValueRow({super.key, required this.label, required this.value});

	@override
	Widget build(BuildContext context) {
		return Row(
			children: [
				Expanded(
					child: Text(
						label,
						style: const TextStyle(
							fontSize: 13,
							color: Color(0xFF9E9E9E),
							fontWeight: FontWeight.w500,
						),
					),
				),
				Expanded(
					child: Text(
						value,
						textAlign: TextAlign.right,
						style: const TextStyle(
							fontSize: 14,
							color: Color(0xFF1F1F1F),
							fontWeight: FontWeight.w600,
						),
					),
				),
			],
		);
	}
}

// Action Buttons Row
class ActionButtonsRow extends StatelessWidget {
	const ActionButtonsRow({super.key});

	@override
	Widget build(BuildContext context) {
		return Row(
			children: [
				Expanded(
					child: OutlinedButton(
						onPressed: () => print('View details'),
						style: OutlinedButton.styleFrom(
							side: const BorderSide(color: AppColors.appBarColor),
							shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
							padding: const EdgeInsets.symmetric(vertical: 12),
						),
						child: const Text(
							'VIEW DETAILS',
							style: TextStyle(
								color: Color(0xFF37474F),
								fontWeight: FontWeight.w600,
							),
						),
					),
				),
				const SizedBox(width: 12),
				Expanded(
					child: ElevatedButton(
						onPressed: () => print('Device approved'),
						style: ElevatedButton.styleFrom(
							backgroundColor: const Color(0xFF2E8B57),
							shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
							padding: const EdgeInsets.symmetric(vertical: 12),
						),
						child: const Text(
							'APPROVE DEVICE',
							style: TextStyle(
								color: Colors.white,
								fontWeight: FontWeight.w600,
							),
						),
					),
				),
			],
		);
	}
}

// Change Log Card
class ChangeLogCard extends StatelessWidget {
	const ChangeLogCard({super.key});

	@override
	Widget build(BuildContext context) {
		return Container(
			width: double.infinity,
			decoration: BoxDecoration(
				color: Colors.white,
				borderRadius: BorderRadius.circular(12),
				boxShadow: [
					BoxShadow(
						color: Colors.black.withOpacity(0.04),
						blurRadius: 10,
						offset: const Offset(0, 3),
					),
				],
			),
			child: Padding(
				padding: const EdgeInsets.all(14.0),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						const Text(
							'Audit Details',
							style: TextStyle(
								fontSize: 14,
								fontWeight: FontWeight.w700,
								color: Color(0xFF1F1F1F),
							),
						),
						const SizedBox(height: 10),
						const Divider(color: Color(0xFFECEFF1)),
						const SizedBox(height: 10),
						_changeRow('Item Quantity Updated', '2 → 1'),
						const SizedBox(height: 8),
						_changeRow('Gas Detector', '1'),
					],
				),
			),
		);
	}

	Widget _changeRow(String left, String right) {
		final bool isChanged = right.contains('→') || right == '1';
		return Row(
			mainAxisAlignment: MainAxisAlignment.spaceBetween,
			children: [
				Expanded(
					child: Text(
						left,
						style: const TextStyle(
							fontSize: 14,
							color: Color(0xFF424242),
							fontWeight: FontWeight.w500,
						),
					),
				),
				const SizedBox(width: 8),
				Text(
					right,
					style: TextStyle(
						fontSize: 14,
						fontWeight: FontWeight.w700,
						color: isChanged ? const Color(0xFFD32F2F) : const Color(0xFF424242),
					),
				),
			],
		);
	}
}

// Revert Changes Tile
class RevertChangesTile extends StatelessWidget {
	const RevertChangesTile({super.key});

	@override
	Widget build(BuildContext context) {
		return Material(
			color: Colors.transparent,
			child: InkWell(
				onTap: () => print('Revert pressed'),
				borderRadius: BorderRadius.circular(12),
				child: Container(
					width: double.infinity,
					decoration: BoxDecoration(
						color: Colors.white,
						borderRadius: BorderRadius.circular(12),
						boxShadow: [
							BoxShadow(
								color: Colors.black.withOpacity(0.04),
								blurRadius: 10,
								offset: const Offset(0, 3),
							),
						],
					),
					padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
					child: Row(
						children: [
							Container(
								width: 40,
								height: 40,
								decoration: BoxDecoration(
									color: const Color(0xFFFFF3E0),
									borderRadius: BorderRadius.circular(10),
								),
								child: const Icon(Icons.restore, color: Color(0xFFFFB74D)),
							),
							const SizedBox(width: 12),
							const Expanded(
								child: Text(
									'Revert Changes',
									style: TextStyle(
										fontSize: 15,
										fontWeight: FontWeight.w600,
										color: Color(0xFF1F1F1F),
									),
								),
							),
							Container(
								padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
								decoration: BoxDecoration(
									color: const Color(0xFFF5F5F5),
									borderRadius: BorderRadius.circular(8),
								),
								child: const Text(
									'Admin Only',
									style: TextStyle(
										fontSize: 12,
										fontWeight: FontWeight.w600,
										color: Color(0xFF616161),
									),
								),
							),
							const SizedBox(width: 8),
							const Icon(Icons.chevron_right, color: Color(0xFFBDBDBD)),
						],
					),
				),
			),
		);
	}
}

