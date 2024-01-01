import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/view_models/address_cubit/address_cubit.dart';
import 'package:flutter_ecommerce_app/view_models/favorites_cubit/favorites_cubit.dart';
import 'package:flutter_ecommerce_app/view_models/payment_cubit/payment_cubit.dart';
import 'package:flutter_ecommerce_app/view_models/product_details_cubit/product_details_cubit.dart';
import 'package:flutter_ecommerce_app/view_models/search_cubit/search_cubit.dart';
import 'package:flutter_ecommerce_app/views/pages/add_payment_card.dart';
import 'package:flutter_ecommerce_app/views/pages/address_page.dart';
import 'package:flutter_ecommerce_app/views/pages/create_account_page.dart';
import 'package:flutter_ecommerce_app/views/pages/custom_bottom_navbar.dart';
import 'package:flutter_ecommerce_app/views/pages/login_page.dart';
import 'package:flutter_ecommerce_app/views/pages/my_orders_page.dart';
import 'package:flutter_ecommerce_app/views/pages/payment_page.dart';
import 'package:flutter_ecommerce_app/views/pages/product_details_page.dart';
import 'package:flutter_ecommerce_app/views/pages/search_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.productDetails:
        final ProductItemModel productDetailsArguments = settings.arguments as ProductItemModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(create: (context) {
                final productDetailsCubit = ProductDetailsCubit();
                productDetailsCubit.getProductDetailsItemData(productDetailsArguments);
                return productDetailsCubit;
               },
            child: ProductDetailsPage( productItem: productDetailsArguments,),
             ),
          settings: settings,
        );
      case AppRoutes.search: 
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final searchCubit = SearchCubit();
              searchCubit.getSearchData();
              return searchCubit;
            },
            child: const SearchPage()
          ),
          settings: settings,
        );
      case AppRoutes.myOrders: 
        return MaterialPageRoute(
          builder: (_) => const MyOrdersPage(),
          settings: settings,
      );
      case AppRoutes.addPaymentCard: 
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context){
              final paymentCubit = PaymentCubit();
              return paymentCubit;
            },
            child: const AddPaymentCard()
            ),
          settings: settings,
      );
      case AppRoutes.payment: 
      //final AddressItemModel selectedAddressItemArguments = settings.arguments as AddressItemModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context){
              final paymentCubit = PaymentCubit();
              paymentCubit.getPaymentViewData();
              return paymentCubit;
            },
            child: const PaymentPage()
          ),
          settings: settings,
      );
      case AppRoutes.address: 
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context){
              final addressCubit = AddressCubit();
              addressCubit.getAddressViewData();
              return addressCubit;
            },
            child: const AddressPage()
          ),
          settings: settings,
        );
        case AppRoutes.login: 
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: settings,
        );
        case AppRoutes.createAccount: 
        return MaterialPageRoute(
          builder: (_) => const CreateAccountPage(),
          settings: settings,
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => FavoritesCubit(),
            child: const CustomBottomNavbar()
          ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Error Page!'),
            ),
          ),
          settings: settings,
        );
    }
  }
}
