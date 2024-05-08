import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/product_item_model.dart';
import '../../utils/app_colors.dart';
import '../../view_models/product_details_view/product_details_cubit.dart';
import '../widgets/counter_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProductDetailsCubit>(context);
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      bloc: cubit,
      buildWhen: (previous, current) =>
          current is ProductDetailsILoading ||
          current is ProductDetailsILoaded ||
          current is ProductDetailsError,
      builder: (context, state) {
        if (state is ProductDetailsILoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        } else if (state is ProductDetailsError) {
          return Scaffold(
            body: Center(
              child: Text(state.massge),
            ),
          );
        } else if (state is ProductDetailsILoaded) {
          final product = state.product;

          return SafeArea(
            top: false,
            child: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: AppColors.transparent,
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border)),
                ],
              ),
              body: Stack(children: [
                Container(
                    height: size.height * 0.6,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: AppColors.grey2),
                    child: CachedNetworkImage(
                      imageUrl: product.imgUrl,
                      fit: BoxFit.contain,
                    )),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.47),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(35))),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.w500),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: AppColors.yellow,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          product.averageRate.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ]),
                              BlocBuilder<ProductDetailsCubit,
                                  ProductDetailsState>(
                                bloc: cubit,
                                buildWhen: (previous, current) =>
                                    current is QuantityChanged,
                                builder: (context, state) {
                                  if (state is QuantityChanged) {
                                    final counter = state.quantity;
                                    return CounterWidget(
                                      cubit: cubit,
                                      counter: counter,
                                    );
                                  } else {
                                    return CounterWidget(
                                      cubit: cubit,
                                      counter: 1,
                                    );
                                  }
                                },
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Size",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: ProductSize.values
                                .map((size) => BlocBuilder<ProductDetailsCubit,
                                        ProductDetailsState>(
                                      bloc: cubit,
                                      buildWhen: (previous, current) =>
                                          current is SizeChanged,
                                      builder: (context, state) {
                                        if (state is SizeChanged) {
                                          final selectedSize = state.size;
                                          return Padding(
                                            padding: const EdgeInsetsDirectional
                                                .only(end: 7),
                                            child: InkWell(
                                              onTap: () =>
                                                  cubit.changeSize(size),
                                              child: CircleAvatar(
                                                radius: 23,
                                                backgroundColor:
                                                    selectedSize == size
                                                        ? AppColors.Primary
                                                        : AppColors.grey2,
                                                child: Center(
                                                    child: Text(
                                                  size.name,
                                                  style: TextStyle(
                                                    color: selectedSize == size
                                                        ? AppColors.white
                                                        : AppColors.black,
                                                  ),
                                                )),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding: const EdgeInsetsDirectional
                                                .only(end: 7),
                                            child: InkWell(
                                              onTap: () =>
                                                  cubit.changeSize(size),
                                              child: CircleAvatar(
                                                radius: 23,
                                                backgroundColor:
                                                    AppColors.grey2,
                                                child: Center(
                                                    child: Text(
                                                  size.name,
                                                )),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ))
                                .toList(),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            "Details",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            product.description,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.grey),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$ ${product.price}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.Primary),
                              ),
                              BlocConsumer<ProductDetailsCubit,
                                  ProductDetailsState>(
                                bloc: cubit,
                                buildWhen: (previous, current) =>
                                    current is AddingToCart ||
                                    current is AddedToCart ||
                                    current is AddToCartsError,
                                listener: (context, state) {

                                  if (state is AddToCartsError) {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>  AlertDialog(
                                        title: const Text("Alret"),
                                        content:const Text("you must select a size!") ,
                                        actions: [TextButton(onPressed: ()=> Navigator.pop(context), child: const Text("OK"))],
                                      ),
                                    );
                                  }                                //    print('${product.name}  }');
                                },
                                builder: (context, state) {
                                  if (state is AddingToCart) {
                                    return SizedBox(
                                        height: 50,
                                        child: ElevatedButton(
                                          onPressed: null,
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.Primary,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16))),
                                          child: const CircularProgressIndicator
                                              .adaptive(),
                                        ));
                                  } else if (state is AddedToCart) {
                                    return SizedBox(
                                        height: 50,
                                        child: ElevatedButton(
                                          onPressed: null,
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.Primary,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16))),
                                          child: Text("Added",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: AppColors.white)),
                                        ));
                                  } else {
                                    return SizedBox(
                                        height: 50,
                                        child: ElevatedButton(
                                          onPressed: () async =>
                                              await cubit.addToCart(product.id),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.Primary,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16))),
                                          child: Text("Add To Order",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: AppColors.white)),
                                        ));
                                  }
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text("Error Page"),
            ),
          );
        }
      },
    );
  }
}
