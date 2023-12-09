import 'package:bloc/bloc.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:meta/meta.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  void getProductDetailsItemData(ProductItemModel productItem, List<String> sizes){
    emit(ProductDetailsLoading());
    Future.delayed(const Duration(seconds: 2),(){
      emit(
        ProductDetailsLoaded(
          productItem: productItem ,
          sizes: dummySizes
        ));
    });
  }

}
