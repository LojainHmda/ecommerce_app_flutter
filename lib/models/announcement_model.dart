class AnnouncementModel {
  final String id;
  final String imgUrl;

  AnnouncementModel({required this.id, required this.imgUrl});
}

List<AnnouncementModel> dummyAnnouncements = [
  AnnouncementModel(
      id: " 1",
      imgUrl:
          "https://media.wired.com/photos/5c9040ee4950d24718d6da99/master/w_960,c_limit/shoppingcart-1066110386.jpg"),
  AnnouncementModel(
      id: " 4",
      imgUrl:
          "https://media.istockphoto.com/id/1405349457/vector/3d-shopping-online-with-mobile-phone-product-shipping-packing-shopping-bag-credit-card.jpg?s=612x612&w=0&k=20&c=a1fy2tYlCT3PaMlGxWgmsADDlW8OQdr5Ihv9iF9I2I4="),
  AnnouncementModel(
      id: " 2",
      imgUrl:
          "https://cdn.educba.com/academy/wp-content/uploads/2023/02/Essay-on-Online-Shopping.png"),
  AnnouncementModel(
      id: " 3",
      imgUrl:
          "https://media.istockphoto.com/id/1404553897/photo/3d-shopping-basket-and-credit-card-online-payment-for-purchases-concept-completed-order-and.jpg?s=612x612&w=0&k=20&c=WIMhEjm4SGXyBeTsACSkz7wn03XZSFSGIkOTmaeR_-I="),
];
