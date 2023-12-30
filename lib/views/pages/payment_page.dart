import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/view_models/payment_cubit/payment_cubit.dart';
import 'package:flutter_ecommerce_app/views/widgets/payment_modal_bottom_sheet.dart';
import 'package:flutter_ecommerce_app/views/widgets/product_item_payment_widget.dart';
import 'package:flutter_ecommerce_app/views/widgets/selected_address_item_widget.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: BlocBuilder<PaymentCubit, PaymentState>(
        bloc: BlocProvider.of<PaymentCubit>(context),
        buildWhen: (previous, current) => current is PaymentLoaded || current is PaymentLoading || current is PaymentError,
        builder: (context, state) {
          if(state is PaymentLoading){
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }else if(state is PaymentError){
            return Center(
              child: Text(state.message),
            );
          }else if(state is PaymentLoaded){
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  children: [
                    buildInLineHeadLines(
                      context: context, 
                      title: 'Address', 
                      onTap: (){
                        Navigator.of(context, rootNavigator: true).pushNamed(
                          AppRoutes.address,
                        );
                      },
                    ),
                    const SizedBox(height: 8.0,),
                    if(state.selectedAddressItem.isSelected == true)...[
                      SelectedAddressItemWidget(selectedItem: state.selectedAddressItem,),
                    ]
                    else...[
                      InkWell(
                      onTap: (){
                        Navigator.of(context, rootNavigator: true).pushNamed(
                          AppRoutes.address,
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: AppColors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(
                            child: Text('Add Address'),
                          ),
                        ),
                      ),
                    )],
                    const SizedBox(height: 16.0,),
                    buildInLineHeadLines(context: context, title: 'Products', productsNumbers: state.cartItems.length),
                    const SizedBox(height: 8.0,),
                    ListView.builder(
                      itemCount: state.cartItems.length,
                      shrinkWrap: true,
                      physics:const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = state.cartItems[index];
                        return ProductItemPaymentWidget(item: item,);
                      },
                    ),
                    buildInLineHeadLines(context: context, title: 'Payment Method',),
                    const SizedBox(height: 8.0,),
                    InkWell(
                      onTap: () => showModalBottomSheet(
                        useSafeArea: true,
                        isScrollControlled: true,
                        context: context, 
                        builder: (ctx) => BlocProvider.value(
                          value: BlocProvider.of<PaymentCubit>(context),
                          child: const PaymentModalBottomSheet()
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: AppColors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(
                            child: Text('Add Payment Method'),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total amount',
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                        Text(
                          '\$${state.total}',
                          style: Theme.of(context).textTheme.labelLarge,

                        ),
                      ],
                    ),
                    const SizedBox(height: 34.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            foregroundColor: AppColors.white,
                          ), 
                          child: const Text('Checkout Now'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 34.0,),
                  ],
                ),
              ),
              );
            }else{
              return const SizedBox();
          }
        },
      ),
    );
  }
  Widget buildInLineHeadLines({required BuildContext context, required String title, int? productsNumbers , VoidCallback? onTap}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            if(productsNumbers != null) 
            Text(
              '($productsNumbers)',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
        if(onTap != null) 
        TextButton(
          onPressed: onTap, 
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.primary,
          ),
          child: Text(
            'Edit', 
            style: Theme.of(context).textTheme.titleMedium,
          )
        ),
      ],
    );
  }
}