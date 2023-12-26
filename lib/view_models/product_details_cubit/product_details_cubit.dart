import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:meta/meta.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  void getProductDetailsItemData(ProductItemModel productItem){
    emit(ProductDetailsLoading());
    Future.delayed(const Duration(seconds: 1),(){
      emit(
        ProductDetailsLoaded(
          productItem: productItem ,
        ));
    });
  }

  void addToFavorites(String productId){
    emit(ProductDetailsLoading());
    final index = dummyProducts.indexWhere((item) => item.id == productId);
    dummyProducts[index] = dummyProducts[index].copyWith(isFavorite: !dummyProducts[index].isFavorite);

    emit(ProductDetailsLoading());

    Future.delayed(const Duration(seconds: 1),(){
      emit(
        ProductDetailsLoaded(
          productItem: dummyProducts[index],
        ));
    });
  }

  void increment(String productId){
      emit(ProductDetailsLoading());
      final index = dummyProducts.indexWhere((item) => item.id == productId);
      dummyProducts[index] = dummyProducts[index].copyWith(quantity: dummyProducts[index].quantity + 1);
      emit(QuantityCounterLoaded(value: dummyProducts[index].quantity, productId: productId));
      Future.delayed(const Duration(seconds: 1),(){
      emit(
        ProductDetailsLoaded(
          productItem: dummyProducts[index],
        ));
    });
  }
  
  void decrement(String productId){
    emit(ProductDetailsLoading());
     final index = dummyProducts.indexWhere((item) => item.id == productId);
      dummyProducts[index] = dummyProducts[index].copyWith(quantity: dummyProducts[index].quantity - 1);
      emit(QuantityCounterLoaded(value: dummyProducts[index].quantity, productId: productId));

      Future.delayed(const Duration(seconds: 1),(){
      emit(
        ProductDetailsLoaded(
          productItem: dummyProducts[index],
        ));
    });
  }
  
  void addToCart(String productId){
    emit(ProductDetailsLoading());
    final index = dummyProducts.indexWhere((item) => item.id == productId);
    dummyProducts[index] = dummyProducts[index].copyWith(
      isAddedToCart: true, 
      quantity: dummyProducts[index].quantity, 
      size: dummyProducts[index].size,
      price: dummyProducts[index].price,
    );
    emit(ProductDetailsLoading());
    Future.delayed(const Duration(seconds: 1),(){
      emit(
        ProductDetailsLoaded(
          productItem: dummyProducts[index],
        ));
    });
    
  }

}
