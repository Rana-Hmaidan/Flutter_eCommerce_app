import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/views/widgets/product_item.dart';

class CounterWidget extends StatelessWidget {

  final dynamic cubit;
  final int value;
  final ProductItemModel productItem;

  const CounterWidget({super.key,  required this.cubit, required this.value, required this.productItem});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        color: AppColors.white,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => cubit.decrement(productItem.id), 
            icon: const Icon(Icons.remove),
          ),
          Text(
            '$value',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(
            onPressed: () => cubit.increment(productItem.id), 
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}