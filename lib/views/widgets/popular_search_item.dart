import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/search_item_model.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';

class PopularSearchItem extends StatelessWidget {

  final SearchItemModel searchItem;

  const PopularSearchItem({super.key, required this.searchItem});

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.shade200,
              ),
            child: CachedNetworkImage(
                    imageUrl: searchItem.productItem.imgUrl,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
          ),
          const SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                searchItem.productItem.name,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                '${searchItem.productItem.searchCount}K Search today',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.grey
                ),
              ),
            ],
          ),
          const Spacer(),
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              color: Color(searchItem.descriptionColor).withOpacity(0.3),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0 ,vertical: 8.0),
              child: Text(
                searchItem.description,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Color(searchItem.descriptionColor),
                    fontWeight: FontWeight.w600,
                  ),
              ),
            ),
          ),
         const SizedBox(width: 16.0,),
        ],
      ),
    ) ;
  }
}