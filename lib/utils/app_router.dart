import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/view_models/product_details_cubit/product_details_cubit.dart';
import 'package:flutter_ecommerce_app/view_models/search_cubit/search_cubit.dart';
import 'package:flutter_ecommerce_app/views/pages/custom_bottom_navbar.dart';
import 'package:flutter_ecommerce_app/views/pages/my_orders_page.dart';
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
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const CustomBottomNavbar(),
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
