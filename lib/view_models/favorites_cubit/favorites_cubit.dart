import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState>{

  Map<String , bool>  favoriteProducts = {};
  Map<String , bool> loadingProducts = {};
  bool isLoading = false;

  FavoritesCubit() : super(FavoritesState());

  Future<void> addFavorite(String productId) async{
    loadingProducts[productId] = true;
    emit(FavoriteLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    loadingProducts.remove(productId);
    favoriteProducts[productId] = true;
    final favoriteList = dummyProducts.where((item) => favoriteProducts[item.id] ?? false).toList();
    emit(FavoriteLoadedState(favoriteList));
  }

  Future<void> deleteFavorite(String productId) async{
    loadingProducts[productId] = true;
    emit(FavoriteLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    loadingProducts.remove(productId);
    favoriteProducts[productId] = false;
    final favoriteList = dummyProducts.where((item) => favoriteProducts[item.id] ?? false).toList();
    emit(FavoriteLoadedState(favoriteList));
  }

  Future<void> loadFavoriteProducts() async{
    emit(FavoriteLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    final favoriteList = dummyProducts.where((item) => (favoriteProducts[item.id] ?? false)).toList();
    emit(FavoriteLoadedState(favoriteList));
  } 
}

// class FavoritesCubit extends Cubit<FavoritesState>{
//   FavoritesCubit() : super(FavoritesInitial());

//     void getFavoritesItems(){
//     emit(FavoritesLoading());
//     Future.delayed(const Duration(seconds: 1),(){
//       emit(
//         FavoritesLoaded(
//           favoritesItems: dummyProducts.where((item) => item.isFavorite == true).toList(),
//       ));
//     });
//   }

//   void addToFavorites(String productId){
//     emit(FavoritesLoading());
//     final index = dummyProducts.indexWhere((item) => item.id == productId);
//     dummyProducts[index] = dummyProducts[index].copyWith(isFavorite: !dummyProducts[index].isFavorite);
//     emit(FavoritesLoading());

//     Future.delayed(const Duration(seconds: 1),(){
//       emit(
//         FavoritesLoaded(
//          favoritesItems: dummyProducts.where((item) => item.isFavorite == true).toList(),
//         ));
//     });
//   }

// }