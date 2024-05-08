import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/product_item_model.dart';
import '../../utils/route/app_routes.dart';
import '../../view_models/home_cubit/home_cubit.dart';
import 'custom_carousel.dart';
import 'product_item.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit,
      buildWhen: (previous, current) =>
          current is HomeLoaded ||
          current is HomeLoading ||
          current is HomeError,
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is HomeError) {
          return Center(child: Text(state.message));
        } else if (state is HomeLoaded) {
          final products = state.products;
          final announcement = state.announcement;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  CustomCarousel(announcement: announcement),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "New Arrivals",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {}, 
                        child: const Text("See more"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Navigator.of(context, rootNavigator: true).pushNamed(
                          AppRoutes.productDetails,
                          arguments: products[index],
                        ),
                        child: ProdectItem(productItem: products[index]),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
