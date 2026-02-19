import 'package:flutter/material.dart';


class SettingCardAccount extends StatelessWidget {
  final Widget column;
  const SettingCardAccount({
    super.key,
    required this.column,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: column
    );
  }
}
