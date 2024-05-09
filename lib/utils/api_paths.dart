class ApiPaths {
  static String products() => "products/";
  static String product(String id) => "products/$id";
  static String user(String uid) => "users/$uid";
  static String cartItem(String uid, String cartItemId) =>
      "users/$uid/cartItems/$cartItemId";
  static String cartItems(String uid) => 'users/$uid/cartItems/';
  static String favoriteItem(String uid, String productId) =>
      "users/$uid/favoriteItems/$productId"; 
  static String favoriteItems(String uid) => 'users/$uid/favoriteItems/'; 
}
