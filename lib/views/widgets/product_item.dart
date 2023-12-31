import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/view_models/favorites_cubit/favorites_cubit.dart';

class ProductItem extends StatelessWidget {
  final ProductItemModel productItem;

  const ProductItem({super.key, required this.productItem});


  @override
  Widget build(BuildContext context) {
   // final homeCubit = BlocProvider.of<HomeCubit>(context);

    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 190,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.shade200,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CachedNetworkImage(
                  imageUrl: productItem.imgUrl,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              )
            ),
            Positioned(
              top: 6.0,
              right: 8.0,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white60,
                ),
                child: BlocBuilder<FavoritesCubit, FavoritesState>(
                  builder: (context, state) {
                    final isFavorite = BlocProvider.of<FavoritesCubit>(context).favoriteProducts[productItem.id] ?? false;
                    final isLoading = BlocProvider.of<FavoritesCubit>(context).loadingProducts[productItem.id] ?? false;

                    return IconButton(
                      onPressed: (){
                        if(isFavorite){
                           BlocProvider.of<FavoritesCubit>(context).deleteFavorite(productItem.id);
                        }else{
                          BlocProvider.of<FavoritesCubit>(context).addFavorite(productItem.id);
                        }
                      },
                      icon: isLoading? const CircularProgressIndicator.adaptive() : Icon(
                        isFavorite? Icons.favorite : Icons.favorite_border,
                        color: isFavorite? AppColors.red : null,
                      ),
                    );
                  }
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0,),
        Text(
          productItem.name,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          productItem.category,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
           color: Colors.grey,
          ),
        ),
        Text(
          '\$${productItem.price}',
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
           fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}