part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {
  const ProductDetailsState();
}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState{}

final class ProductDetailsLoaded extends ProductDetailsState{
  
  final ProductItemModel productItem;
  final List<String> sizes;

  const ProductDetailsLoaded({
    required this.productItem,
    required this.sizes,
  });
}

final class ProductDetailsError extends ProductDetailsState{
  final String message;

  const ProductDetailsError({
    required this.message
  });
}