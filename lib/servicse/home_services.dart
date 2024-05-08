import 'package:ecommerce_appQ/models/product_item_model.dart';
import 'package:ecommerce_appQ/servicse/firestore_servicses.dart';

import '../utils/api_paths.dart';

abstract class HomeServices {
  Future<List<ProductItemModel>> getProducts();
}

class HomeServicesImpl implements HomeServices {
  final firestoreService = FirestoreService.instance;
  @override
  Future<List<ProductItemModel>> getProducts() async {
  return  await firestoreService.getCollection<ProductItemModel>(
        path: ApiPaths.products(),
        builder: (data, documentId) => ProductItemModel.fromMap(data,documentId));
  }
}
