import 'package:ecommerce_appQ/servicse/auth_servicses.dart';
import 'package:ecommerce_appQ/servicse/product_details_Services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/product_item_model.dart';
import '../../models/cart_model_orders_models.dart';
part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());
  final productDetailsServices = ProductDetailsServicesImpl();
  final authServices=AuthServicesImpl();
  ProductSize? size;
  int counter = 1;

  Future<void> addToCart(String productId) async {
    emit(AddingToCart());
    try {
      final product = await productDetailsServices.getProduct(productId);
      DateTime now = DateTime.now();
      final cartOrder = CartOrderModel(
          id: now.toIso8601String(),
          product: product,
          totalprice: product.price * counter,
          quantity: counter,
          size: size!);
          final currentUser =await authServices.currentUser();
 await productDetailsServices.addToCart(currentUser!.uid, cartOrder);
     emit(AddedToCart());
    } catch (e) {
      emit(AddToCartsError(e.toString()));
    }
  }
  

  void getProductDetailsData(String productId) async {
    emit(ProductDetailsILoading());
    try {
      final product = await productDetailsServices.getProduct(productId);
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
