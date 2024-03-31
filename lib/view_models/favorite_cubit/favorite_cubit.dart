

// favorite_cubit.dart
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/view_models/favorite_cubit/favorite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
