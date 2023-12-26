import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/view_models/home_cubit/home_cubit.dart';
import 'package:flutter_ecommerce_app/views/widgets/product_item.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: BlocProvider.of<HomeCubit>(context),
      builder: (context, state) {
        if(state is HomeLoading){
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }else if(state is HomeError){
          return Center(
            child: Text(state.message),
          );
        }else if(state is HomeLoaded){
          return SingleChildScrollView(
          child: Column(
                children: [
                      FlutterCarousel(
                        options: CarouselOptions(
                         height: 200.0, 
                        showIndicator: true,
                        slideIndicator: const CircularSlideIndicator(),
                        ),
                        items: state.carouselItems.map((item) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: CachedNetworkImage(
                                imageUrl: item.imgUrl,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                ),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 24.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'New Arrivals',
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: (){}, 
                            child: const Text('See All'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0,),
                      GridView.builder(
                        itemCount: state.products.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 25,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.5 /2,
                        ),
                        itemBuilder: (context, index) => InkWell(
                          onTap: (){
                            Navigator.of(context, rootNavigator: true).pushNamed(
                              AppRoutes.productDetails,
                              arguments: state.products[index],
                            );
                          },
                          child: ProductItem(productItem: state.products[index])
                        ),
                      ),
                ],
          ),
        );
        }else{
          return const SizedBox();
        }
      }
    );
  }
}