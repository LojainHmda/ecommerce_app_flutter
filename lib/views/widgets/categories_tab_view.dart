import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_models/category_view/category_cubit.dart';
import '../../view_models/category_view/category_state.dart';

class CategoriesTabView extends StatelessWidget {
  const CategoriesTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoryLoaded) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ListTile(
                  title: Text(product.category),
                  leading: Image.network(product.imgUrl),
                );
              },
            );
          } else if (state is CategoryError) {
            return Center(
              child: Text('Error: ${state.errorMessage}'),
            );
          } else {
            return Center(
              child: Text('Unknown state'),
            );
          }
        },
      ),
    );
  }
}
