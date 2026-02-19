import 'package:flutter/material.dart';

import '../../../res/colors/app_colors.dart';

class FilterChipsBar extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterChanged;
  final List<String> filters = const [
    'ALL',
    'PENDING',
    'IN TRANSIT',
    'COMPLETED'
  ];

  const FilterChipsBar({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((filter) {
          final isSelected = selectedFilter == filter;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(
                filter,
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.darkText,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              backgroundColor:
              isSelected ? AppColors.appBarColor : AppColors.lightGrey,
              onSelected: (_) => onFilterChanged(filter),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide.none,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          );
        }).toList(),
      ),
    );
  }
}