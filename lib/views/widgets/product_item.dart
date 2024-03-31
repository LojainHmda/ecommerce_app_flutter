import 'package:ecommerce_app/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/product_item_model.dart';

class ProdectItem extends StatelessWidget {
  final ProductItemModel productItem;
  const ProdectItem({super.key, required this.productItem});
  @override
  Widget build(BuildContext context) {
    return Column(
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
                        shape: BoxShape.circle, color: Colors.white60),
                    child:
                        IconButton(
                      onPressed: () {
                        final productItemModel = 
                            BlocProvider.of<FavoriteCubit>(context,
                                    listen: false)
                                .addToFavorites(productItem);
                      },
                      icon: const Icon(Icons.favorite_border),
                    ))),
          ],
        ),
        Text(
          productItem.name,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          "${productItem.price}",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          productItem.category,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}