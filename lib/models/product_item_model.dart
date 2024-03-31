enum ProductSize { S, M, L, XL, XXL }

class ProductItemModel {
  final String id;
  final bool isFavorite;
  final String name;
  final double price;
  final String imgUrl;
  final String description;
  final String category;
  final double averageRate;

  ProductItemModel(
      {required this.id,
      this.isFavorite = false,
      required this.name,
      required this.price,
      required this.imgUrl,
      this.description =
          "ndjsnvo ksjnvwjn bjnvajnvo vdnfvibnrva jn;aavnevna;v odnvjd jjk ijojndjsnvo ksjnvwjn bjnvajnvo vdnfvibnrva jn;aavnevna;v odnvjd jjk ijojndjsnvo ksjnvwjn bjnvajnvo vdnfvibnrva jn;aavnevna;v odnvjd jjk ijojndjsnvo ksjnvwjn bjnvajnvo vdnfvibnrva jn;aavnevna;v odnvjd jjk ijoj",
      required this.category,
      this.averageRate = 1});
}

List<ProductItemModel> dummyProducts = [
  ProductItemModel(
    id: "1",
    name: "Sport shoes",
    price: 120.00,
    imgUrl:
        "https://static.vecteezy.com/system/resources/previews/019/953/915/non_2x/shoes-isolated-on-transparent-background-free-png.png",
    category: "Shoes",
  ),
  // Shoes
  ProductItemModel(
    id: "2",
    name: "sport shoes",
    price: 180.00,
    imgUrl:
        "https://static.vecteezy.com/system/resources/previews/019/953/797/non_2x/shoes-isolated-on-transparent-background-free-png.png",
    category: "Shoes",
  ),
  ProductItemModel(
    id: "3",
    name: "T-Shirt",
    price: 19.99,
    imgUrl:
        "https://static.vecteezy.com/system/resources/previews/021/104/624/non_2x/isolated-blank-t-shirt-for-mock-up-free-png.png",
    category: "Clothes",
  ),
  // Groceries
  ProductItemModel(
    id: "4",
    name: "Organic Grapes",
    price: 4.99,
    imgUrl:
        "https://static.vecteezy.com/system/resources/previews/025/065/156/non_2x/grape-with-ai-generated-free-png.png",
    category: "Groceries",
  ),
  // Smartphones
  ProductItemModel(
    id: "5",
    name: "iPhone 13 Pro",
    price: 999.99,
    imgUrl:
        "https://econtent.o2.co.uk/o/econtent/media/get/43f82c83-69ec-480d-82b5-3fef330f2a0b",
    category: "Smartphones",
  ),
  // Fruits
  ProductItemModel(
    id: "6",
    name: "Organic Apples",
    price: 1.99,
    imgUrl:
        "https://static.vecteezy.com/system/resources/previews/015/100/023/non_2x/red-apples-transparent-background-free-png.png",
    category: "Fruits",
  ),
  // Clothes
  ProductItemModel(
    id: "7",
    name: "Jeans",
    price: 29.99,
    imgUrl:
        "https://static.vecteezy.com/system/resources/previews/036/391/990/non_2x/ai-generated-blue-jeans-folded-stack-on-transparent-background-free-png.png",
    category: "Clothes",
  ),
  // Groceries
  ProductItemModel(
    id: "8",
    name: "Jacket",
    price: 6.99,
    imgUrl:
        "https://static.vecteezy.com/system/resources/previews/030/951/514/non_2x/front-of-basic-white-grey-bomber-jacket-ai-generative-free-png.png",
    category: "Clothes",
  ),
  // Smartphones
  ProductItemModel(
    id: "9",
    name: "Google Pixel 6 Pro",
    price: 899.99,
    imgUrl:
        "https://crdms.images.consumerreports.org/prod/products/cr/models/397170-smartphones-google-pixel-3-10001760.png",
    category: "Smartphones",
  ),
  // Fruits
  ProductItemModel(
    id: "10",
    name: "Organic Strawberries",
    price: 3.49,
    imgUrl:
        "https://i.pinimg.com/originals/eb/d4/de/ebd4deb64c74e2f1246626d5a290274d.png",
    category: "Fruits",
  ),
];
