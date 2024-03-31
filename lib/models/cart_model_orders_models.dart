import 'package:ecommerce_app/models/product_item_model.dart';

class CartOrderModel {
  final String id;
  final ProductItemModel product;
  final double totalprice;
  final int quantity;
  final ProductSize? size;

  CartOrderModel(
      {required this.id,
      required this.product,
      required this.totalprice,
      required this.quantity,
      required this.size});
}

List<CartOrderModel> dummyCartOrder = [];
