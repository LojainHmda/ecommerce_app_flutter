import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/product_item_model.dart';
import '../../servicse/auth_servicses.dart';
import '../../servicse/favorite_services.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  final authServices = AuthServicesImpl();

  final FavoriteServices favoriteServices = FavoriteServicesImpl();

  String? uid;
  Future<void> addToFavorites(ProductItemModel product) async {
    emit(AddingToFavorites());
    try {
      final currentUser = await authServices.currentUser();
product.isFavorite=true;
      await favoriteServices.addToFavorites(currentUser!.uid, product);
      
      emit(AddedToFavorites());
    } catch (e) {
      emit(AddToFavoritesError(e.toString()));
    }
  }

  Future<void> removeFromFavorites(ProductItemModel product) async {
    emit(RemovingFromFavorites());
    try {
      final currentUser = await authServices.currentUser();
      product.isFavorite=true;

      await favoriteServices.removeFromFavorites(
          currentUser!.uid, product); // ا
      emit(RemovedFromFavorites());
    } catch (e) {
      emit(RemoveFromFavoritesError(e.toString()));
    }
  }

  Future<void> loadFavorites() async {
    emit(FavoritesLoading());
    try {
      final currentUser = await authServices.currentUser();

      final favorites = await favoriteServices.getFavorites(currentUser!.uid);
      emit(FavoritesLoaded(favorites: favorites));
    } catch (e) {
      emit(FavoritesError(e.toString()));
    }
  }
}
