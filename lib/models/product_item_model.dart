enum ProductSize { S, M, L, XL, XXL ;
static ProductSize fromString(String size){
if (size.toUpperCase() == ProductSize.S.name) {
      return ProductSize.S;
    } else if (size.toUpperCase() == ProductSize.M.name) {
      return ProductSize.M;
    } else if (size.toUpperCase() == ProductSize.L.name) {
      return ProductSize.L;
    } else if (size.toUpperCase() == ProductSize.XL.name) {
      return ProductSize.XL;
    } else {
      return ProductSize.XXL;
    }
}}

class ProductItemModel {
  final String id;
   bool isFavorite;
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


      
Map<String, dynamic> toMap() {
  final result = <String, dynamic>{};
  result.addAll({'id': id});
  result.addAll({'isFavorite': isFavorite});
  result.addAll({'name': name});
  result.addAll({'price': price});
  result.addAll({'imgUrl': imgUrl});
  result.addAll({'description': description});
  result.addAll({'category': category});
  result.addAll({'averageRate': averageRate});
  return result;
}

factory ProductItemModel.fromMap(Map<String, dynamic> map,String documentId) {
  return ProductItemModel(
    id:documentId ,
    isFavorite: map['isFavorite'] ?? false,
    name: map['name'] ?? '',
    price: (map['price'] as num?)?.toDouble() ?? 0.0,
    imgUrl: map['imgUrl'] ?? '',
    description: map['description'] ?? '',
    category: map['category'] ?? '',
    averageRate: (map['averageRate'] as num?)?.toDouble() ?? 0.0,
  );
}

}


List<ProductItemModel> dummyProducts = [
  ProductItemModel(
    id: "QM8FuaGkFMq5SwfuzI6b",
    name: "Sport shoes",
    price: 120.00,
    imgUrl:
        "https://static.vecteezy.com/system/resources/previews/019/953/915/non_2x/shoes-isolated-on-transparent-background-free-png.png",
    category: "Shoes",
  ),
  // Shoes
  ProductItemModel(
    id: "9E38Ni4lDc9rzvh1hLIJ",
    name: "sport shoes",
    price: 180.00,
    imgUrl:
        "https://static.vecteezy.com/system/resources/previews/019/953/797/non_2x/shoes-isolated-on-transparent-background-free-png.png",
    category: "Shoes",
  ),
  
  // Groceries
  ProductItemModel(
    id: "m4S0wXR5LfTDyzOnbes",
    name: "Organic Grapes",
    price: 4.99,
    imgUrl:
        "https://static.vecteezy.com/system/resources/previews/025/065/156/non_2x/grape-with-ai-generated-free-png.png",
    category: "Groceries",
  ),
  // Smartphones
  ProductItemModel(
    id: "0AP2xGKwa9stIiJ8tHPe",
    name: "iPhone 13 Pro",
    price: 999.99,
    imgUrl:
        "https://econtent.o2.co.uk/o/econtent/media/get/43f82c83-69ec-480d-82b5-3fef330f2a0b",
    category: "Smartphones",
  ),
  // Fruits
  ProductItemModel(
    id: "Gooewn20ER7TfD4VECcp",
    name: "Organic Apples",
    price: 1.99,
    imgUrl:
        "https://static.vecteezy.com/system/resources/previews/015/100/023/non_2x/red-apples-transparent-background-free-png.png",
    category: "Fruits",
  ),
  // Clothes
  ProductItemModel(
    id: "yfBE8JMrmcubBvpGn2l6",
    name: "Jeans",
    price: 29.99,
    imgUrl:
        "https://static.vecteezy.com/system/resources/previews/036/391/990/non_2x/ai-generated-blue-jeans-folded-stack-on-transparent-background-free-png.png",
    category: "Clothes",
  ),
  // Groceries
  ProductItemModel(
    id: "mrnBl15kG4AIMHeazXl0",
    name: "Jacket",
    price: 6.99,
    imgUrl:
        "https://static.vecteezy.com/system/resources/previews/030/951/514/non_2x/front-of-basic-white-grey-bomber-jacket-ai-generative-free-png.png",
    category: "Clothes",
  ),
  // Smartphones
  ProductItemModel(
    id: "2OQ4Ms3bd82yr9qssG0Y",
    name: "Google Pixel 6 Pro",
    price: 899.99,
    imgUrl:
        "https://crdms.images.consumerreports.org/prod/products/cr/models/397170-smartphones-google-pixel-3-10001760.png",
    category: "Smartphones",
  ),
  // Fruits
  ProductItemModel(
    id: "0ELbRyuu30mEcxOTCq3K",
    name: "Organic Strawberries",
    price: 3.49,
    imgUrl:
        "https://i.pinimg.com/originals/eb/d4/de/ebd4deb64c74e2f1246626d5a290274d.png",
    category: "Fruits",
  ),
];
