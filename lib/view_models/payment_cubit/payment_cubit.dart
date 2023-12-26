import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/address_item_model.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState>{
  PaymentCubit() : super(PaymentInitial());

  void getPaymentViewData(){
    emit(PaymentLoading());
    final cartItems = dummyProducts.where((item) => item.isAddedToCart == true).toList();
    final subTotal = cartItems.fold<double>(0, (sum, item) => sum + item.price);
    final AddressItemModel selectedAddressItem = dummyAddresses.first;
    Future.delayed(const Duration(seconds: 1),(){
      emit(
        PaymentLoaded(
          cartItems: cartItems,
          total: subTotal + 10,
          selectedAddressItem: selectedAddressItem,
        ));
    });
  }
}

  //   void getSelectedAddressViewData(){
  //   emit(PaymentLoading());
  //   final selectedItem = dummyAddresses.where((item) => item.isSelected == true) as AddressItemModel;
  //   Future.delayed(const Duration(seconds: 1),(){
  //     emit(
  //       SelectedAddressItem(
  //         selectedItem: selectedItem,
  //       )
  //     );
  //   });
  // }