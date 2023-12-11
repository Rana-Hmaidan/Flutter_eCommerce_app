import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/view_models/cart_cubit/cart_cubit.dart';
import 'package:flutter_ecommerce_app/view_models/favorites_cubit/favorites_cubit.dart';
import 'package:flutter_ecommerce_app/views/pages/cart_page.dart';
import 'package:flutter_ecommerce_app/views/pages/favorites_page.dart';
import 'package:flutter_ecommerce_app/views/pages/home_page.dart';
import 'package:flutter_ecommerce_app/views/pages/profile_page.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  late PersistentTabController _controller ;
  int _currentIndex = 0;

  @override
  void initState(){
    super.initState();
    _controller =  PersistentTabController();
    _controller.addListener(() {
      setState(() {
      _currentIndex = _controller.index;
      });
    });
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _buildScreens(){
    return [
      const HomePage(),
      BlocProvider(
        create: (context){
          final cubit = CartCubit();
          cubit.getCartItems();
          return cubit;
        },
        child: const CartPage(),
        ),
        BlocProvider(
        create: (context){
          final cubit = FavoritesCubit();
          cubit.getFavoritesItems();
          return cubit;
        },
        child: const FavoritesPage(),
        ),
      const ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(){
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home), 
        title: ('Home'), 
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart), 
        title: ('Cart'), 
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite), 
        title: ('Favorites'), 
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person), 
        title: ('Profile'), 
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding:  EdgeInsetsDirectional.all(12.0),
            child: CircleAvatar(
                          radius: 25,
                          backgroundImage: CachedNetworkImageProvider(
                            'https://pbs.twimg.com/profile_images/1493704582505144323/Stvh3FSK_400x400.jpg'
                          ),
                     ),
          ),
          title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, Tarik',
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Let\'s go shopping',
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                  ),
          centerTitle: false,
          actions:[
            if(_currentIndex == 0) ...[
              IconButton(
              onPressed: (){
                Navigator.of(context, rootNavigator: true).pushNamed(
                  AppRoutes.search,
               );
              }, 
              icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.notifications_none),
              ),
            ],
            if(_currentIndex == 1) ...[
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 8.0),
                child: TextButton.icon(
                  onPressed: (){
                    Navigator.of(context).pushNamed(AppRoutes.myOrders);
                  }, 
                  label: const Text('My Orders'),
                  icon: const Icon(Icons.shopping_bag),
                ),
              ),
            ],
            if(_currentIndex == 2) ...[
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 8.0),
                child: IconButton(
                  onPressed: (){}, 
                  icon: const Icon(Icons.notifications_none),
                ),
              ),
            ]
          ]
        ),
        body : PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
      ),
    );
  }
}