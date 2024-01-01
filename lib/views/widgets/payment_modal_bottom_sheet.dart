import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/payment_method_model.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/views/widgets/payment_item_widget.dart';

class PaymentModalBottomSheet extends StatelessWidget {
  const PaymentModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0,),
            Text(
              'Payment Method',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16.0,),
            ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: savedCards.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return PaymentItemWidget(paymentMethod: savedCards[index],);
              }
            ),
            PaymentItemWidget(additionOnTap: (){
              Navigator.of(context).pushNamed(AppRoutes.addPaymentCard);
              },
            ),
            const SizedBox(height: 16.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                onPressed: (){
                  
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: AppColors.white,
                ), 
                child: const Text('Confirm Payment',),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}