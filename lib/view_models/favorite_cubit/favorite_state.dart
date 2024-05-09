part of 'favorite_cubit.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class AddingToFavorites extends FavoriteState {}

class AddedToFavorites extends FavoriteState {}

class AddToFavoritesError extends FavoriteState {
  final String message;

  AddToFavoritesError(this.message);
}

class RemovingFromFavorites extends FavoriteState {}

class RemovedFromFavorites extends FavoriteState {}

class RemoveFromFavoritesError extends FavoriteState {
  final String message;

  RemoveFromFavoritesError(this.message);
}

class FavoritesLoading extends FavoriteState {}

class FavoritesLoaded extends FavoriteState {
  final List<ProductItemModel> favorites;

  FavoritesLoaded({required this.favorites});
}

class FavoritesError extends FavoriteState {
  final String message;

  FavoritesError(this.message);
}
