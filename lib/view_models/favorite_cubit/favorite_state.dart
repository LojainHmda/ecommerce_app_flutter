

import '../../models/product_item_model.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<ProductItemModel> favorites;

  FavoriteLoaded(this.favorites);
}

class FavoriteError extends FavoriteState {}