part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {
  const ProductDetailsState();
}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState{}

final class ProductDetailsLoaded extends ProductDetailsState{
  
  final ProductItemModel productItem;

  const ProductDetailsLoaded({
    required this.productItem,
  });
}

class QuantityCounterLoaded extends ProductDetailsState{
  final int value;
  final String productId;
  
  const QuantityCounterLoaded({
    required this.value,
    required this.productId,
  });
}

// class FavoriteLoaded extends ProductDetailsState{

//   final String productId;
//   final bool isFavorite;
  
//   const FavoriteLoaded({
//     required this.isFavorite,
//     required this.productId,
//   });
// }

final class ProductDetailsError extends ProductDetailsState{
  final String message;

  const ProductDetailsError({
    required this.message
  });
}