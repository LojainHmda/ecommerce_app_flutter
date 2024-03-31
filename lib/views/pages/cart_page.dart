import 'package:ecommerce_app/models/cart_model_orders_models.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(child: Text(dummyCartOrder.length.toString()),);
  }
}