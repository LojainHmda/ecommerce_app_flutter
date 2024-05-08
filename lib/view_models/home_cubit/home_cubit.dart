
import 'package:ecommerce_appQ/servicse/home_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/announcement_model.dart';
import '../../models/product_item_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

final homeServices = HomeServicesImpl();
  void getHomeData() async {
    emit(HomeLoading());
    try {
      final products = await homeServices.getProducts();
      final announcements = dummyAnnouncements;
      // await Future.delayed(const Duration(seconds: 2));
      emit(HomeLoaded(products, announcements));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
