import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/home_carousel_model.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit() : super(HomeInitial());

  void getHomeData(){
    emit(HomeLoading());
    Future.delayed(const Duration(seconds: 1),(){
      emit(
        HomeLoaded(
          products: dummyProducts, 
          carouselItems: dummyCarouselItems
        ));
    });
  }

  void addToFavorites(String productId){
    emit(HomeLoading());
    final index = dummyProducts.indexWhere((item) => item.id == productId);
    dummyProducts[index] = dummyProducts[index].copyWith(isFavorite: !dummyProducts[index].isFavorite);
    emit(HomeLoading());
    Future.delayed(const Duration(seconds: 1),(){
      emit(
        HomeLoaded(
         products: dummyProducts,
         carouselItems: dummyCarouselItems
        ));
    });
  }
}