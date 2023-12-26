import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/view_models/product_details_cubit/product_details_cubit.dart';
import 'package:flutter_ecommerce_app/views/widgets/counter_widget.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsPage extends StatelessWidget {

  final ProductItemModel productItem;

  const ProductDetailsPage({super.key, required this.productItem});

  @override
  Widget build(BuildContext context) {

    final productDetailsCubit = BlocProvider.of<ProductDetailsCubit>(context);

    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      bloc: BlocProvider.of<ProductDetailsCubit>(context),
     // buildWhen: (previous, current) => (current is QuantityCounterLoaded && current.productId == productItem.id ) || current is ProductDetailsLoaded,
      builder: (context, state) {
         if(state is ProductDetailsLoading){
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }else if(state is ProductDetailsError){
          return Center(
            child: Text(state.message),
          );
        }else if(state is ProductDetailsLoaded){
        return Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: state.productItem.imgUrl,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => const Center(
                     child: CircularProgressIndicator.adaptive(),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      }, 
                      icon: const Icon(Icons.arrow_back_ios_new_rounded)
                    ),  
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Detail Product',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () => productDetailsCubit.addToFavorites(state.productItem.id),
                      icon: Icon(state.productItem.isFavorite == false? Icons.favorite_border : Icons.favorite),
                      color: AppColors.red,
                      ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration:  BoxDecoration(
                        borderRadius:  const BorderRadius.vertical(
                          top: Radius.circular(35.0),
                        ),
                        color: AppColors.grey.shade100,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    state.productItem.name,
                                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.star_rate,
                                        color: Colors.deepOrange,
                                        size: 18,
                                        ),
                                      const SizedBox(width: 6,),
                                      Text(
                                        '${state.productItem.rate}',
                                        style: Theme.of(context).textTheme.titleMedium,
                                      ),
                                      Text(
                                        '(${state.productItem.reviewCount})Review',
                                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                          color: AppColors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if(state is QuantityCounterLoaded) ...[
                                    CounterWidget(
                                      cubit: productDetailsCubit, 
                                      value: state.productItem.quantity, 
                                      productItem: productItem,
                                    ),
                                  ]else ...[
                                    CounterWidget(
                                      cubit: productDetailsCubit, 
                                      value: state.productItem.quantity,
                                      productItem: productItem,
                                    ),
                                  ],
                                  const SizedBox(width: 10.0,),
                                  Text(
                                    'Available in stok',
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Size',
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10,),
                              GridView.builder(
                                  itemCount: Size.values.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 6,
                                    crossAxisSpacing: 1,
                                    childAspectRatio: MediaQuery.of(context).size.width /(MediaQuery.of(context).size.height/2),
                                    mainAxisSpacing: 1,
                                  ),
                                  itemBuilder: (context, index) => CircleAvatar(
                                    backgroundColor: AppColors.white,
                                    child: TextButton(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      onPressed: (){},
                                      child: Text(
                                        Size.values[index].name,
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 16,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Description',
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10,),
                              ReadMoreText(
                                state.productItem.description,
                                trimLines: 4,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'Read More',
                                trimExpandedText: 'Less',
                                colorClickableText: Theme.of(context).colorScheme.primary,
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black45,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text.rich(
                                TextSpan(
                                   text: '\$',
                                   style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).colorScheme.primary,
                                   ),
                                children: [
                                  TextSpan(
                                    text: (state.productItem.price * state.productItem.quantity).toStringAsFixed(2),
                                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ]
                              ),
                              ),
                              const Spacer(),
                              SizedBox(
                                height: 50,
                                child: ElevatedButton.icon(
                                onPressed: () => productDetailsCubit.addToCart(productItem.id),
                                  icon: const Icon(
                                  Icons.shopping_cart,
                                    color: AppColors.white,
                                  ),
                                  label: Text(
                                    'Add to Cart',
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.white,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context).colorScheme.primary,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
        }else{
          return const SizedBox();
        }
      },
    );
  }
}