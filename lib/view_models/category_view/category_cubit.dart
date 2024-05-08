import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/product_item_model.dart';
import 'category_state.dart';


class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  void getHomeData() async {
    emit(CategoryLoading());
    try {
      final products = dummyProducts;
      await Future.delayed(const Duration(seconds: 2));
      emit(CategoryLoaded(products));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
