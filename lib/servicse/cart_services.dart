import '../models/cart_model_orders_models.dart';
import '../utils/api_paths.dart';
import 'auth_servicses.dart';
import 'firestore_servicses.dart';

abstract class CartServices {
  Future<List<CartOrderModel>> getCartItems(String uid);
  Future<void> updateCartItem(String uid, CartOrderModel cartOrder);

}

class CartServicesImpl implements CartServices {

  final firestore = FirestoreService.instance;
  final authServices = AuthServicesImpl();

  @override
  Future<List<CartOrderModel>> getCartItems(String uid) async {
    return await firestore.getCollection(
      path: ApiPaths.cartItems(uid),
      builder: (data, documentId) => CartOrderModel.fromMap(data),
    );
  }

  @override
  Future<void> updateCartItem(String uid, CartOrderModel cartOrder) async =>
      await firestore.setData(
          path: ApiPaths.cartItem(uid, cartOrder.id), data: cartOrder.toMap());
}
  