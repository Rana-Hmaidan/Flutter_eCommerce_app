part of 'cart_cubit.dart';

@immutable
sealed class CartState {
  const CartState();
}

final class CartInitial extends CartState{}

final class CartLoading extends CartState{}

final class CartLoaded extends CartState{
  final List<ProductItemModel> cartItems;
  const CartLoaded({
    required this.cartItems,
  });
}

class QuantityCounterLoaded extends CartState{
  final int value;
  final String productId;
  
  const QuantityCounterLoaded({
    required this.value,
    required this.productId,
  });
}

final class CartError extends CartState{
  final String message;

  const CartError({
    required this.message
  });
}