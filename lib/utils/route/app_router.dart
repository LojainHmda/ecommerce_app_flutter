import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/product_item_model.dart';
import '../../view_models/favorite_cubit/favorite_cubit.dart';
import '../../view_models/product_details_view/product_details_cubit.dart';
import '../../views/pages/custom_bottom_navbar.dart';
import '../../views/pages/favorite_page.dart';
import '../../views/pages/login_page.dart';
import '../../views/pages/my_orders_page.dart';
import '../../views/pages/product_details_page.dart';
import 'app_routes.dart';

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
  return MaterialPageRoute(
    builder: (_) => BlocProvider(
      create: (context) {
        final cubit = FavoriteCubit();
        return cubit;
      },
      child:  FavoritePage(), 
    ),
    settings: settings,
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
