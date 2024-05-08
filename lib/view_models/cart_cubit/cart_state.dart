part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class QuantityCounterLoading extends CartState {}
final class QuantityCounterErorr extends CartState {
   final String message;

  QuantityCounterErorr({
    required this.message,
  });
}


final class QuantityCounterLoaded extends CartState {
  final int value;
  final String cartOrderId;

  QuantityCounterLoaded({
    required this.value,
    required this.cartOrderId,
  });
}

final class CartLoaded extends CartState {
  final List<CartOrderModel> cartItems;
  final double subtotal;

  CartLoaded({
    required this.cartItems,
    required this.subtotal,
  });
}

final class CartError extends CartState {
  final String message;

  CartError({
    required this.message,
  });
}
