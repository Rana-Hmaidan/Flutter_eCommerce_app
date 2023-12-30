part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {
  const PaymentState();
}

final class PaymentInitial extends PaymentState{}

final class PaymentLoading extends PaymentState{}

final class PaymentLoaded extends PaymentState{
  final List<ProductItemModel> cartItems;
  final double total;
  final AddressItemModel selectedAddressItem;

  const PaymentLoaded({
    required this.cartItems,
    required this.total,
    required this.selectedAddressItem,
  });
}

final class PaymentMethodChosen extends PaymentState{
  final String paymentMethodId;

  const PaymentMethodChosen({
    required this.paymentMethodId
  });
}

final class PaymentError extends PaymentState{
  final String message;

  const PaymentError({
    required this.message
  });
}

// final class SelectedAddressItem extends PaymentState{

//   final AddressItemModel selectedItem;
  
//   const SelectedAddressItem({
//     required this.selectedItem,
//   });
  
// }