import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/view_models/favorites_cubit/favorites_cubit.dart';

class FavoritesItem extends StatelessWidget {

  final ProductItemModel favoriteItem;

  const FavoritesItem({super.key, required this.favoriteItem});

  @override
  Widget build(BuildContext context) {

    final favoriteCubit = BlocProvider.of<FavoritesCubit>(context);

    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 160,
              width: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color.fromARGB(255, 165, 130, 130),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CachedNetworkImage(
                  imageUrl: favoriteItem.imgUrl,
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
                child: IconButton(
                  onPressed: () => favoriteCubit.addToFavorites(favoriteItem.id),
                  icon: Icon(favoriteItem.isFavorite == false? Icons.favorite_border : Icons.favorite),
                  color: AppColors.red,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0,),
        Text(
          favoriteItem.name,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          favoriteItem.category,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
           color: Colors.grey,
          ),
        ),
        Text(
          '\$${favoriteItem.price}',
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
           fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}