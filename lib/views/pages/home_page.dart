import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/home_cubit/home_cubit.dart';
import '../../view_models/category_view/category_cubit.dart'; // Import CategoryCubit
import '../widgets/categories_tab_view.dart';
import '../widgets/home_tab_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider( // Use MultiBlocProvider to provide multiple blocs
      providers: [
        BlocProvider(create: (context) => HomeCubit()..getHomeData()), // Provide HomeCubit
        BlocProvider(create: (context) => CategoryCubit()..getHomeData()), // Provide CategoryCubit


      ],
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: "Home"),
                Tab(text: "Categories"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  HomeTabView(),
                  CategoriesTabView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
