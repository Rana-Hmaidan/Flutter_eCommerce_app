import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/address_item_model.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState>{
  AddressCubit() : super(AddressInitial());

  void getAddressViewData(){
    emit(AddressLoading());
    final addressItems = dummyAddresses;
    Future.delayed(const Duration(seconds: 1),(){
      emit(
        AddressLoaded(
          addressItems: addressItems,
        ));
    });
  }

  void selectAddress(String addressId){
    emit(AddressLoading());
    final index = dummyAddresses.indexWhere((item) => item.id == addressId);
    dummyAddresses[index] = dummyAddresses[index].copyWith(isSelected: !dummyAddresses[index].isSelected);
    emit(AddressLoading());
    Future.delayed(const Duration(seconds: 1),(){
      emit(
       AddressLoaded(addressItems: dummyAddresses),
      );
    });
  }


  // void removeSelected(String addressId){
  //   emit(AddressLoading());
  //   final index = dummyAddresses.indexWhere((item) => item.id == addressId);
  //   dummyAddresses[index] = dummyAddresses[index].copyWith(isSelected: dummyAddresses[index].isSelected == false);
  //   emit(AddressLoading());
  //   Future.delayed(const Duration(seconds: 1),(){
  //     emit(
  //      AddressLoaded(addressItems: dummyAddresses),
  //     );
  //   });
  //}

}