part of 'address_cubit.dart';

@immutable
sealed class AddressState {
  const AddressState();
}

final class AddressInitial extends AddressState{}

final class AddressLoading extends AddressState{}

final class AddressLoaded extends AddressState{

  final List<AddressItemModel> addressItems;
  const AddressLoaded({
    required this.addressItems,
  });
  
}

final class AddressError extends AddressState{
  final String message;

  const AddressError({
    required this.message
  });
}