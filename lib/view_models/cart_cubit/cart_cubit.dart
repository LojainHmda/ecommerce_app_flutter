import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/cart_model_orders_models.dart';
import '../../servicse/auth_servicses.dart';
import '../../servicse/cart_services.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  final cartServices = CartServicesImpl();
  final authServices = AuthServicesImpl();

  Future<void> getCartItems() async {
    emit(CartLoading());
    try {
      final currentUser = await authServices.currentUser();

      final cartItems = await cartServices.getCartItems(currentUser!.uid);
      final subTotal = cartItems.fold<double>(
          0, (sum, item) => sum + (item.product.price * item.quantity));
      emit(CartLoaded(
        cartItems: cartItems,
        subtotal: subTotal,
      ));
    } catch (e) {
      emit(
        CartError(message: e.toString()),
      );
    }
  }


  Future<void> incrementCounter(CartOrderModel cartOder) async {
    emit(QuantityCounterLoading());
  try{  final currntUser = await authServices.currentUser();
    cartOder = cartOder.copyWith(quantity: cartOder.quantity + 1);
    await cartServices.updateCartItem(currntUser!.uid, cartOder);
    emit(
      QuantityCounterLoaded(
        value: cartOder.quantity,
        cartOrderId: cartOder.id,
      ),
    );}
    catch(e){
      emit(QuantityCounterErorr(message: e.toString()));
    }
  }

  Future<void> decrementCounter(CartOrderModel cartOder) async {
     emit(QuantityCounterLoading());
  try{  final currntUser = await authServices.currentUser();
    cartOder = cartOder.copyWith(quantity: cartOder.quantity - 1);
    await cartServices.updateCartItem(currntUser!.uid, cartOder);
    emit(
      QuantityCounterLoaded(
        value: cartOder.quantity,
        cartOrderId: cartOder.id,
      ),
    );}
    catch(e){
      emit(QuantityCounterErorr(message: e.toString()));
    }
  }
}