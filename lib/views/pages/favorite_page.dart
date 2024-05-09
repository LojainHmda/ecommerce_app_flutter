import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_models/favorite_cubit/favorite_cubit.dart';
import '../../models/product_item_model.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Products'),
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoritesLoading) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else if (state is FavoritesLoaded) {
            List<ProductItemModel> favorites = state.favorites;
            return RefreshIndicator(
              onRefresh: () => BlocProvider.of<FavoriteCubit>(context).loadFavorites(),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final product = favorites[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text(product.description),
                    trailing: IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: () {
                        context.read<FavoriteCubit>().removeFromFavorites(product);
                      },
                    ),
                  );
                },
              ),
            );
          } else if (state is FavoritesError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Center(child: Text('No favorites yet.'));
          }
        },
      ),
    );
  }
}
