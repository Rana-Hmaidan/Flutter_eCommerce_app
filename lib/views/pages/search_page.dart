import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/search_item_model.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/view_models/search_cubit/search_cubit.dart';
import 'package:flutter_ecommerce_app/views/widgets/last_search_item.dart';
import 'package:flutter_ecommerce_app/views/widgets/popular_search_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SearchCubit, SearchState>(
          bloc: BlocProvider.of<SearchCubit>(context),
          builder: (context, state) {
            if(state is SearchLoading){
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }else if(state is SearchError){
          return Center(
            child: Text(state.message),
          );
        }else if(state is SearchLoaded){
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          }, 
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                        const SizedBox(width: 6),
                        SizedBox(
                          width: 400,
                          height: 50,
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search...',
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
                      ],
                    ),
                    const SizedBox(height: 24.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Last Search',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: (){},
                          style: TextButton.styleFrom(
                            foregroundColor: Theme.of(context).colorScheme.primary,
                          ), 
                          child: const Text('Clear All'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    GridView.builder(
                            itemCount: state.lastSerchItems.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: MediaQuery.of(context).size.width /(MediaQuery.of(context).size.height/6),
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                            ),
                            itemBuilder: (context, index) => LastSearchItem(
                              onPressed: () {},
                              value: state.lastSerchItems[index],
                              onPresseedIcon: (){},
                            ),
                      ),
                      const SizedBox(height: 24,),
                      Text(
                          'Popular Search',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                      ),
                      const SizedBox(height: 10,),
                      ListView.separated(
                        itemCount: state.popularsearchItems.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (_, index) => const SizedBox(height: 10.0),
                        itemBuilder: (context, index) => PopularSearchItem(
                          searchItem: state.popularsearchItems[index],
                        ),
                      ),
                  ]
                ),
              ),
            );
           }else{
              return const SizedBox();
            }
          }
        )
      ),
    );
  }
}