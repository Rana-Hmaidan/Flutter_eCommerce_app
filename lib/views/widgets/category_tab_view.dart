import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/category_item_model.dart';
import 'package:flutter_ecommerce_app/view_models/category_cubit/category_cubit.dart';
import 'package:flutter_ecommerce_app/views/widgets/category_item.dart';

class CategoryTabView extends StatelessWidget {
  const CategoryTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      bloc: BlocProvider.of<CategoryCubit>(context),
      builder: (context, state) {
        if(state is CategoryLoading){
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }else if(state is CategoryError){
          return Center(
            child: Text(state.message),
          );
        }else if(state is CategoryLoaded){
          return ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: dummyCategories.length,
              separatorBuilder: (_, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) => CategoryItem(categoryItem: dummyCategories[index]),
          );
        }else{
          return const SizedBox();
        }
      }
    );
  }
}