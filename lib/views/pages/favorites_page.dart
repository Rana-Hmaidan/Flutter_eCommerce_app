import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/category_item_model.dart';
import 'package:flutter_ecommerce_app/shared/widget_extension.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/view_models/favorites_cubit/favorites_cubit.dart';
import 'package:flutter_ecommerce_app/views/widgets/category_chip_widget.dart';
import 'package:flutter_ecommerce_app/views/widgets/product_item.dart';
import 'package:flutter_ecommerce_app/views/widgets/search_bar_widget.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

 // final TextEditingController _searchController = TextEditingController();

 @override
 void initState(){
    BlocProvider.of<FavoritesCubit>(context).loadFavoriteProducts();
    super.initState();
 }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SearchBarWidget(),
              const SizedBox(height: 16.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const CategoryChipWidget(
                      label: 'All',
                      isSelected: true,
                    ),
                    ...dummyCategories.map((item) => CategoryChipWidget(
                      label: item.name, 
                      isSelected: false),
                    ),
                  ].addSeparator(const SizedBox(width: 12.0)),
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: BlocBuilder<FavoritesCubit, FavoritesState>(
                  bloc: BlocProvider.of<FavoritesCubit>(context),
                  builder: (context, state) {
                    if(state is FavoriteLoadingState){
                      return const CircularProgressIndicator.adaptive();
                    }else if(state is FavoriteLoadedState){
                      return GridView.builder(
                        itemCount: state.products.length,
                        //shrinkWrap: true,
                        //physics: const NeverScrollableScrollPhysics(),
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
                          child: ProductItem(productItem: state.products[index]),
                          ),
                      );
                    }else{
                      return const SizedBox();
                    }
                  }
                ),
              ),
            ],
          ),
        ),
      );
  }
}