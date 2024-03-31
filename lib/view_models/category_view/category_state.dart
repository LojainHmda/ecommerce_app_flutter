import 'package:ecommerce_app/models/product_item_model.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<ProductItemModel> products;
  CategoryLoaded(this.products);
}

class CategoryError extends CategoryState {
  final String errorMessage;

  CategoryError(this.errorMessage);
}
