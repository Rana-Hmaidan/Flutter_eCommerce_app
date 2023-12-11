import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState>{
  FavoritesCubit() : super(FavoritesInitial());

    void getFavoritesItems(){
    emit(FavoritesLoading());
    Future.delayed(const Duration(seconds: 1),(){
      emit(
        FavoritesLoaded(
          favoritesItems: dummyProducts.where((item) => item.isFavorite == true).toList(),
      ));
    });
  }

  void addToFavorites(String productId){
    emit(FavoritesLoading());
    final index = dummyProducts.indexWhere((item) => item.id == productId);
    dummyProducts[index] = dummyProducts[index].copyWith(isFavorite: !dummyProducts[index].isFavorite);
    emit(FavoritesLoading());

    Future.delayed(const Duration(seconds: 1),(){
      emit(
        FavoritesLoaded(
         favoritesItems: dummyProducts.where((item) => item.isFavorite == true).toList(),
        ));
    });
  }

}