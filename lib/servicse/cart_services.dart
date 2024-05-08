import '../models/cart_model_orders_models.dart';
import '../utils/api_paths.dart';
import 'auth_servicses.dart';
import 'firestore_servicses.dart';

abstract class CartServices {
  Future<List<CartOrderModel>> getCartItems(String uid);
  Future<void> updateCartItem(String uid, CartOrderModel cartOrder);

  // Future<List<LocationModel>> getLocations();
  // Future<void> setLocationItem(LocationModel locationModel);
  // Future<void> unSetLocationItem(LocationModel locationModel);
  // // Future<List<LocationModel>> getPayments();
}

class CartServicesImpl implements CartServices {
  final firestoreService = FirestoreService.instance;

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
      await firestoreService.setData(
          path: ApiPaths.cartItem(uid, cartOrder.id), data: cartOrder.toMap());
}
  
  // @override
  // Future<List<LocationModel>> getLocations({bool hasQuery = false}) async {
  //   final currentUser = await authServices.getUser();
  //   return await firestore.getCollection(
  //     path: ApiPath.locations(currentUser!.uid),
  //     builder: (data, documentId) => LocationModel.fromMap(data, documentId),
  //     queryBuilder: hasQuery ? (query) => query.where('isSelected', isEqualTo: true) : null,
  //   );
  // }
  
  // @override
  // Future<void> setLocationItem(LocationModel locationModel) async {
  //   final currentUser = await authServices.getUser();
  //   await firestore.setData(
  //       path: ApiPath.location(currentUser!.uid, locationModel.id),
  //       data: locationModel.copyWith(isSelected: true).toMap(),
  //     );
  // }
  
  // @override
  // Future<void> unSetLocationItem(LocationModel locationModel) async {
  //   final currentUser = await authServices.getUser();
  //   await firestore.setData(
  //       path: ApiPath.location(currentUser!.uid, locationModel.id),
  //       data: locationModel.copyWith(isSelected: false).toMap(),
  //     );
  // }
