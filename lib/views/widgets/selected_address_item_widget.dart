import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/address_item_model.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';

class SelectedAddressItemWidget extends StatelessWidget {
  
  final AddressItemModel selectedItem;
  
  const SelectedAddressItemWidget({super.key, required this.selectedItem,});

  @override
  Widget build(BuildContext context) {
    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(16.0),
                                   color: AppColors.grey.withOpacity(0.4),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: selectedItem.imgUrl,
                                ), 
                              ),
                              const SizedBox(width: 8.0,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      selectedItem.title,
                                      style: Theme.of(context).textTheme.labelLarge,
                                    ),
                                    const SizedBox(height: 8.0,),
                                    Text(
                                      selectedItem.subTitle,
                                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                        color: AppColors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                 ),
    );
  }
}