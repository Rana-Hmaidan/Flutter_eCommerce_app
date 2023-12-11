import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
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
    );
  }
}