part of 'product_details_cubit.dart';


sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsILoading extends ProductDetailsState {}

final class ProductDetailsILoaded extends ProductDetailsState {
  final ProductItemModel product;

  ProductDetailsILoaded(this.product);
}

final class ProductDetailsError extends ProductDetailsState {
  final String massge;

  ProductDetailsError(this.massge);
}



final class AddingToCart extends ProductDetailsState {}

final class AddedToCart extends ProductDetailsState {}

final class AddToCartsError extends ProductDetailsState {
  final String massge;

  AddToCartsError(this.massge);
}



final class SizeChanged extends ProductDetailsState  {
  final ProductSize size;
  SizeChanged(this.size);
}

final class QuantityChanged extends ProductDetailsState  {
  
  final int quantity;
  QuantityChanged (this.quantity);
}
