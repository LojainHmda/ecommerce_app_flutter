import 'package:ecommerce_app/models/cart_model_orders_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/product_item_model.dart';
part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  ProductSize? size;
  int counter = 1;

  Future<void> addToCart(String productId) async {
    emit(AddingToCart());
    try {
      await Future.delayed(const Duration(seconds: 1));
      final product =
          dummyProducts.firstWhere((element) => element.id == productId);
      DateTime now = DateTime.now();
      final cartOrder = CartOrderModel(
          id: now.toIso8601String(),
          product: product,
          totalprice: product.price * counter,
          quantity: counter,
          size: size!);
      dummyCartOrder.add(cartOrder);
      emit(AddedToCart());
    } catch (e) {
      emit(AddToCartsError(e.toString()));
    }
  }

  void getProductDetailsData(String productId) async {
    emit(ProductDetailsILoading());
    try {
      final product =
          dummyProducts.firstWhere((element) => element.id == productId);
      await Future.delayed(const Duration(seconds: 1));
      emit(ProductDetailsILoaded(product));
    } catch (e) {
      emit(ProductDetailsError(e.toString()));
    }
  }

  void changeSize(ProductSize value) {
    size = value;
    emit(SizeChanged(size!));
  }

  void decrementCounter() {
    if (counter > 1) {
      counter--;
    }
    emit(QuantityChanged(counter));
  }

  void incrementCounter() {
    counter++;

    emit(QuantityChanged(counter));
  }
}
