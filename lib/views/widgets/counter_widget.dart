import 'package:flutter/material.dart';

import '../../models/cart_model_orders_models.dart';
import '../../view_models/cart_cubit/cart_cubit.dart';
import '../../view_models/product_details_view/product_details_cubit.dart';

class CounterWidget extends StatelessWidget {
  final dynamic cubit;
  final int counter;
  final bool isCart;
  final CartOrderModel? cartOder;

  const CounterWidget({
    Key? key,
    required this.cubit,
    required this.counter,
    this.isCart = false,
    this.cartOder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
final cartCubit = cubit is CartCubit ? cubit as CartCubit : cubit as ProductDetailsCubit;

return DecoratedBox(
  decoration: BoxDecoration(
    color: Colors.grey[100],
    borderRadius: BorderRadius.circular(24),
  ),
  child: isCart
      ? const CircularProgressIndicator.adaptive()
      : Row(
          children: [
            IconButton(
              onPressed: () async {
                if (cartOder != null) {
                  await (cartCubit as CartCubit).decrementCounter(cartOder!);
                } else {
                   (cartCubit as ProductDetailsCubit).decrementCounter();
                }
              },
              icon:const Icon(Icons.remove),
            ),
            Text(counter.toString()),
            IconButton(
              onPressed: () async {
                if (cartOder != null) {
                  await (cartCubit as CartCubit).incrementCounter(cartOder!);
                } else {
                   (cartCubit as ProductDetailsCubit).incrementCounter();
                }
              },
              icon:const Icon(Icons.add),
            ),
          ],
        ),
);

  }
}
