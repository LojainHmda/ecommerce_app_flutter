import '../models/product_item_model.dart';
import '../utils/api_paths.dart';
import 'auth_servicses.dart';
import 'firestore_servicses.dart';

abstract class FavoriteServices {
  Future<List<ProductItemModel>> getFavorites(String uid);
  Future<void> addToFavorites(String uid, ProductItemModel product);
  Future<void> removeFromFavorites(String uid, ProductItemModel product);
}

class FavoriteServicesImpl implements FavoriteServices {
  final firestoreService = FirestoreService.instance;
  final authServices = AuthServicesImpl();

  @override
  Future<void> addToFavorites(String uid, ProductItemModel product) async {
    await firestoreService.setData(
        path: ApiPaths.favoriteItem(uid, product.id), data: product.toMap());
  }

 @override
Future<List<ProductItemModel>> getFavorites(String uid) async {
  return await firestoreService.getCollection(
    path: ApiPaths.favoriteItems(uid),
    builder: (data, documentId) => ProductItemModel.fromMap(data, documentId),
  );
}


  @override
  Future<void> removeFromFavorites(String uid, ProductItemModel product) async {
    await firestoreService.deleteData(
      path: ApiPaths.favoriteItem(uid, product.id),
    );
  }
}
