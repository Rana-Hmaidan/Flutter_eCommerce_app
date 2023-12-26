import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/address_item_model.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';

class AddressItemWidget extends StatelessWidget {
  final AddressItemModel item;
  const AddressItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(
                  color: item.isSelected? Theme.of(context).colorScheme.primary : AppColors.grey,
                ),
                borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const SizedBox(height: 8.0,),
                          Text(
                            item.subTitle,
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          border: Border.all(
                            color: item.isSelected? Theme.of(context).colorScheme.primary : AppColors.grey,
                            width: 3.0,
                          ),
                          borderRadius: BorderRadius.circular(60.0),
                        ),
                        child: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                            item.imgUrl,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        ),
    );
  }
}