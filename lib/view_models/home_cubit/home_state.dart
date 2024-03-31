part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<ProductItemModel> products;
  final List<AnnouncementModel> announcement;
  HomeLoaded(this.products, this.announcement);
}

final class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
