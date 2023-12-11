import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/search_item_model.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/view_models/favorites_cubit/favorites_cubit.dart';
import 'package:flutter_ecommerce_app/views/widgets/favorites_item.dart';
class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    int selectedSearchIndex = 0;

    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
       if(state is FavoritesLoading){
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }else if(state is FavoritesError){
          return Center(
            child: Text(state.message),
          );
        }else if(state is FavoritesLoaded){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0 ,vertical: 8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search something...',
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () => _searchController.clear(),
                          ),
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {},
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0), 
                          ),
                          prefixIconColor: AppColors.black,
                          suffixIconColor: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0,),
                 SizedBox(
                  height: 55,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Description.values.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsetsDirectional.only(end: 12.0),
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          decoration: BoxDecoration(
                            color: index == selectedSearchIndex? Theme.of(context).colorScheme.primary : AppColors.white,
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(color: AppColors.grey),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              Description.values[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: index == selectedSearchIndex? Colors.white : Colors.black54,
                              ),
                              ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0), 
                GridView.builder(
                    itemCount: state.favoritesItems.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                    ),
                    itemBuilder: (context, index) => InkWell(
                      onTap: (){},
                      child: FavoritesItem(favoriteItem: state.favoritesItems[index]),
                    ),
                ),
              ],
            ),
          ),
        );
        }else{
          return const SizedBox();
        }
      },
    );
  }
}