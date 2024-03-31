import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/utils/route/app_routes.dart';
import 'package:ecommerce_app/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:ecommerce_app/views/pages/custom_bottom_navbar.dart';
import 'package:ecommerce_app/views/pages/favorite_page.dart';
import 'package:ecommerce_app/views/pages/login_page.dart';
import 'package:ecommerce_app/views/pages/my_orders_page.dart';
import 'package:ecommerce_app/views/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/product_details_view/product_details_cubit.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.productDetails:
        final product = settings.arguments as ProductItemModel;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) {
                    final cubit = ProductDetailsCubit();
                    cubit.getProductDetailsData(product.id);
                    return cubit;
                  },
                  child: const ProductDetailsPage(),
                ),
            settings: settings);

      case AppRoutes.bottomNavbar:
        return MaterialPageRoute(
            builder: (_) => const CustomBottomNavBar(), settings: settings);

      case AppRoutes.homeLogin:
        return MaterialPageRoute(
            builder: (_) => const LoginPage(), settings: settings);

      case AppRoutes.myOrders:
        return MaterialPageRoute(builder: (_) => const MyOrderPage());


      case AppRoutes.favs:
        return 
  MaterialPageRoute(
    builder: (context) => BlocProvider.value(
      value: BlocProvider.of<FavoriteCubit>(context),
      child: FavoritePage(),
    ),
  

);

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text("Error Page"),
                  ),
                ));
    }
  }
}
