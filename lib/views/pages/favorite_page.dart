// favorite_page.dart
import 'package:ecommerce_app/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:ecommerce_app/view_models/favorite_cubit/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
  builder: (context, state) {
    if (state is FavoriteInitial) {
      return Center(child: CircularProgressIndicator());
    } else if (state is FavoriteLoaded) {
      return ListView(
        children: state.favorites.map((item) => ListTile(title: Text(item.name))).toList(),
      );
    } else if (state is FavoriteError) {
      return Center(child: Text('Error loading favorites'));
    }
    // If none of the above states match, return an empty container or some default widget.
    return Container();
  },
)
,
    );
  }
}
