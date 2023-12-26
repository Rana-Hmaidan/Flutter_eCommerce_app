import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';

class CategoryChipWidget extends StatelessWidget {

  const CategoryChipWidget({super.key, required this.label, required this.isSelected});

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InputChip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected? AppColors.white : AppColors.black87,
        ),
      ),
      selected: isSelected,
      showCheckmark: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side:  BorderSide(color: AppColors.grey.shade400),
      ),
    );
  }
}