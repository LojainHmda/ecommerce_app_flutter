import 'package:ecommerce_app/models/product_item_model.dart';

class FavModel {
  final String id;
  final ProductItemModel product;

  FavModel({
    required this.id,
    required this.product,
  });
}

List<FavModel> fav = [];
