import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/cart_model_orders_models.dart';
import '../../utils/app_colors.dart';
import '../../view_models/cart_cubit/cart_cubit.dart';
import 'counter_widget.dart';

class CartItemWidget extends StatelessWidget {
  final CartOrderModel addToCartItem;
  const CartItemWidget({
    super.key,
    
    required this.addToCartItem,
  });

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.grey.withOpacity(0.4),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: addToCartItem.product.imgUrl,
                      fit: BoxFit.cover,
                      height: 120,
                      width: 200,
                    ),
                  ),
                ),
                PositionedDirectional(
                  end: 8,
                  top: 8,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.red.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        size: 30,
                      ),
                      color: AppColors.red,
                      onPressed: () {},
                      // onPressed: () =>
                      //     cartCubit.removeFromCart(addToCartItem.id),
                    ),
                  ),
                ),
                PositionedDirectional(
                  start: 8,
                  bottom: 8,
                  child: BlocBuilder<CartCubit, CartState>(
                    bloc: cartCubit,
                    builder: (context, state) {
                      if (state is QuantityCounterLoaded) {
                        return CounterWidget(
                          key: Key(state.cartOrderId),
                          cubit: cartCubit,
                          counter: state.value,
                          cartOder: addToCartItem,
                        );
                      } else if (state is CartLoaded) {
                        return CounterWidget(
                          cubit: cartCubit,
                          cartOder: addToCartItem,
                          counter: state.cartItems
                              .firstWhere(
                                (item) => item.id == addToCartItem.id,
                              )
                              .quantity,
                        );
                      } else if (state is QuantityCounterLoading) {
                        return CounterWidget(
                          cubit: cartCubit,
                          cartOder: addToCartItem,
                          isCart: true,
                          counter: 1,
                        );
                      } else {
                        return CounterWidget(
                          cubit: cartCubit,
                          cartOder: addToCartItem,
                          counter: 1,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    addToCartItem.product.name,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Size: ',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.grey,
                          ),
                      children: [
                        TextSpan(
                          text: addToCartItem.size.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                '\$${addToCartItem.product.price * addToCartItem.quantity}',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
