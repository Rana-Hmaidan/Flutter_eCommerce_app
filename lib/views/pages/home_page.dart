import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/view_models/category_cubit/category_cubit.dart';
import 'package:flutter_ecommerce_app/view_models/home_cubit/home_cubit.dart';
import 'package:flutter_ecommerce_app/views/widgets/category_tab_view.dart';
import 'package:flutter_ecommerce_app/views/widgets/home_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  late final TabController _tabController;

  @override
  void initState(){
    super.initState();
     _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          'https://pbs.twimg.com/profile_images/1493704582505144323/Stvh3FSK_400x400.jpg'
                        ),
                      ),
                      const SizedBox(width: 16.0,),
                      Column(
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
                    ],
                  ),
                  Row(
                    children: [
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
                  ),
                ],
              ),
              const SizedBox(height: 24.0,),
              TabBar(
                controller: _tabController,
                unselectedLabelColor: AppColors.grey,
                tabs:const [
                  Tab(
                    text: 'Home',
                  ),
                  Tab(
                    text: 'Category',
                  ),
                ],
              ),
              const SizedBox(height: 24.0,),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    BlocProvider(
                      create: (context) {
                        final homeCubit = HomeCubit();
                        homeCubit.getHomeData();
                        return homeCubit;
                      },
                      child: const HomeTabView(),
                    ),
                    BlocProvider(
                      create: (context) {
                        final categoryCubit = CategoryCubit();
                        categoryCubit.getCategoryData();
                        return categoryCubit;
                      },
                      child: const CategoryTabView(),
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}