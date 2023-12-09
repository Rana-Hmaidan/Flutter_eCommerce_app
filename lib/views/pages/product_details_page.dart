import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/view_models/product_details_cubit/product_details_cubit.dart';
import 'package:flutter_ecommerce_app/view_models/quantity_cubit/quantity_cubit.dart';
import 'package:flutter_ecommerce_app/view_models/quantity_cubit/quantity_state.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsPage extends StatelessWidget {

  final ProductItemModel productItem;

  const ProductDetailsPage({super.key, required this.productItem});

  @override
  Widget build(BuildContext context) {
    final quantityCubit =BlocProvider.of<QuantityCubit>(context);
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      bloc: BlocProvider.of<ProductDetailsCubit>(context),
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
        return Column(
              children: [
                Expanded(
                  flex: 7,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 300,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.grey.shade200,
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
                                  onPressed: (){}, 
                                  icon: const Icon( Icons.favorite_border,),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(35.0),
                            ),
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
                                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                                            style: Theme.of(context).textTheme.bodyMedium,
                                          ),
                                          Text(
                                            '(${state.productItem.reviewCount})Review',
                                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                                      BlocBuilder<QuantityCubit, QuantityState>(
                                        bloc: quantityCubit,
                                        builder: (context, state) {
                                          return DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: AppColors.grey.shade200,
                                              borderRadius: BorderRadius.circular(24.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                CircleAvatar(
                                                  radius: 15,
                                                  backgroundColor: AppColors.white,
                                                  child: IconButton(
                                                    onPressed: quantityCubit.decrement,
                                                    icon: const Icon(
                                                      Icons.remove,
                                                      size: 12,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 6.0,),
                                                Text(
                                                  '${state.quantityCount}',
                                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                ),
                                                ),
                                                const SizedBox(width: 6.0,),
                                                CircleAvatar(
                                                  radius: 15,
                                                  backgroundColor: AppColors.white,
                                                  child: IconButton(
                                                    onPressed: quantityCubit.increment, 
                                                    icon: const Icon(
                                                      Icons.add,
                                                      size: 12,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                             ),
                                            ),
                                          );
                                        }
                                      ),
                                      const SizedBox(width: 10.0,),
                                      Text(
                                        'Available in stok',
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Size',
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  GridView.builder(
                                      itemCount: state.sizes.length,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 5,
                                        crossAxisSpacing: 8,
                                        childAspectRatio: MediaQuery.of(context).size.width /(MediaQuery.of(context).size.height/2),
                                        mainAxisSpacing: 8,
                                      ),
                                      itemBuilder: (context, index) => CircleAvatar(
                                        radius: 30,
                                        backgroundColor: AppColors.grey.shade200,
                                        child: Text(
                                          state.sizes[index],
                                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                            fontWeight: FontWeight.w600,
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
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  ReadMoreText(
                                    state.productItem.description,
                                    trimLines: 5,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: 'Read More',
                                    trimExpandedText: 'Less',
                                    colorClickableText: Theme.of(context).colorScheme.primary,
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black45,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:24.0, vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${(state.productItem.price).toStringAsFixed(2) * quantityCubit.state.quantityCount}',
                          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: ElevatedButton.icon(
                            onPressed: (){},
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
                  ),
                ),
               // const SizedBox(height: 8,),
              ],
            );
        }else{
          return const SizedBox();
        }
      },
    );
  }
}