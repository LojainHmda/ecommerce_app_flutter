import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/product_item_model.dart';
import '../../view_models/favorite_cubit/favorite_cubit.dart';

class ProdectItem extends StatelessWidget {
  final ProductItemModel productItem;
  const ProdectItem({Key? key, required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 105,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.shade200,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.network(productItem.imgUrl, fit: BoxFit.contain),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white60,
                  ),
                  child: BlocConsumer<FavoriteCubit, FavoriteState>(
                    listener: (context, state) {
                      if (state is AddToFavoritesError) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Alert"),
                            content: const Text("Error occurred while adding to favorites"),
                            actions: [TextButton(onPressed: ()=> Navigator.pop(context), child: const Text("OK"))],
                          ),
                        );
                      } 
                    },
                    
                    builder: (context, state) {
                      final favoriteCubit = BlocProvider.of<FavoriteCubit>(context);
                    
                        return SizedBox(
                          height: 50,
                          child: IconButton(
                            onPressed: () {
                              productItem.isFavorite? favoriteCubit.removeFromFavorites(productItem):
                              favoriteCubit.addToFavorites(productItem);
                            },
                            icon: productItem.isFavorite? Icon(Icons.favorite, color: Colors.red):Icon(Icons.favorite, color: Colors.black),
                          ),
                        );
                      
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              productItem.name,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              "${productItem.price}",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            productItem.category,
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
