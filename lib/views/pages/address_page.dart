import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/view_models/address_cubit/address_cubit.dart';
import 'package:flutter_ecommerce_app/views/widgets/address_item_widget.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final TextEditingController _addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    final addressCubit = BlocProvider.of<AddressCubit>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address'),
        centerTitle: true,
      ),
      body: BlocBuilder<AddressCubit, AddressState>(
        bloc: BlocProvider.of<AddressCubit>(context),
        builder: (context, state){
          if(state is AddressLoading){
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }else if(state is AddressError){
            return Center(
              child: Text(state.message),
            );
          }else if(state is AddressLoaded){
            return SingleChildScrollView(
              child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  'Choose your location',
                  style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8.0,),
                  Text(
                  'Let\'s find your unforgettable event. Choose a location below to get started.',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.grey,
                  ),
                  ),
                  const SizedBox(height: 24.0,),
                  SizedBox(
                    height: 50,
                    child: TextField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          hintText: 'San Diego, CA',
                          hintStyle: const TextStyle(
                            color: AppColors.black,
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(PhosphorIcons.crosshair),
                            onPressed: (){},
                          ),
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.location_on_outlined),
                            onPressed: () {},
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0), 
                          ),
                          prefixIconColor: AppColors.black,
                          suffixIconColor: AppColors.grey,
                        ),
                      ),
                  ),
                  const SizedBox(height: 16.0,),
                  Text(
                  'Select location',
                  style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  ListView.builder(
                    itemCount: state.addressItems.length,
                    shrinkWrap: true,
                    physics:const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = state.addressItems[index];
                      return InkWell(
                        onTap: () => addressCubit.selectAddress(item.id),
                        child: AddressItemWidget(item: item,),
                      );
                    },
                  ),
                  const SizedBox(height: 34.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: (){
                            //final selectedItem = addressCubit.getSelectedAddressViewData();
                            Navigator.of(context, rootNavigator: true).popAndPushNamed(
                              AppRoutes.payment ,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            foregroundColor: AppColors.white,
                          ), 
                          child: const Text('Confirm'),
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
        }
      ),
    );
  }
}