import 'package:ecommerce_appQ/models/product_item_model.dart';
import 'package:ecommerce_appQ/servicse/firestore_servicses.dart';

import '../models/cart_model_orders_models.dart';
import '../utils/api_paths.dart';

abstract class ProductDetailsServices {
  Future<ProductItemModel> getProduct(String id);
  Future<void> addToCart(String uid, CartOrderModel cartOrder);
}

class ProductDetailsServicesImpl implements ProductDetailsServices {
  final firestoreService = FirestoreService.instance;
  @override
  Future<ProductItemModel> getProduct(String id) async {
    return await firestoreService.getDocument<ProductItemModel>(
        path: ApiPaths.product(id),
        builder: (data, documentId) =>
            ProductItemModel.fromMap(data, documentId));
  }

  @override
  Future<void> addToCart(String uid, CartOrderModel cartOrder) async =>
      await firestoreService.setData(
          path: ApiPaths.cartItem(uid, cartOrder.id), data: cartOrder.toMap());
}
