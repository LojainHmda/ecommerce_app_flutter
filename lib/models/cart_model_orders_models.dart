// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'product_item_model.dart';

class CartOrderModel {
  final String id;
  final ProductItemModel product;
  final double totalprice;
  final int quantity;
  final ProductSize size;

  CartOrderModel(
      {required this.id,
      required this.product,
      required this.totalprice,
      required this.quantity,
      required this.size});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'product': product.toMap(),
      'totalprice': totalprice,
      'quantity': quantity,
      'size': size.name,
    };
  }

  factory CartOrderModel.fromMap(Map<String, dynamic> map) {
    return CartOrderModel(
      id: map['id'] as String,
      product: ProductItemModel.fromMap(map['product'] as Map<String, dynamic>,
          map['product']['id'] as String),
      totalprice: map['totalprice'] as double,
      quantity: map['quantity'] as int,
      size: ProductSize.fromString(map['size']),
    );
  }

  CartOrderModel copyWith({
    String? id,
    ProductItemModel? product,
    double? totalprice,
    int? quantity,
    ProductSize? size,
  }) {
    return CartOrderModel(
      id: id ?? this.id,
      product: product ?? this.product,
      totalprice: totalprice ?? this.totalprice,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
    );
  }
}

List<CartOrderModel> dummyCartOrder = [];
