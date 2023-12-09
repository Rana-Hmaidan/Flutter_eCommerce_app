import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/view_models/quantity_cubit/quantity_state.dart';

class QuantityCubit extends Cubit<QuantityState> {
  QuantityCubit() : super(QuantityState(quantityCount: 1));
  
  void increment() => emit(
    QuantityState(
      quantityCount: state.quantityCount + 1, 
      isIncremented: true)
    );

  void decrement() => emit(
    QuantityState(
      quantityCount: state.quantityCount >= 1 ? state.quantityCount - 1 : 0 , 
      isIncremented: false)
    ); 
}