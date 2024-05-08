

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/product_item_model.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  List<ProductItemModel> favorites = [];

  FavoriteCubit() : super(FavoriteInitial());

  

  void addToFavorites(ProductItemModel product) {
    favorites.add(product);
    emit(FavoriteLoaded(favorites));
  }

  void removeFromFavorites(ProductItemModel product) {
    favorites.remove(product);
    emit(FavoriteLoaded(favorites));
  }
}
