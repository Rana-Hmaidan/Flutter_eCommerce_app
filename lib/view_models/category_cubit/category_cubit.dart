import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/category_item_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState>{
  CategoryCubit() : super(CategoryInitial());

  void getCategoryData(){
    emit(CategoryLoading());
    Future.delayed(const Duration(seconds: 2),(){
      emit(
        CategoryLoaded(
          categories: dummyCategories, 
        ));
    });
  }
}