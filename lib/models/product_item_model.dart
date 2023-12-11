enum Size {S, M, L, XL}

class ProductItemModel{
  final String id;
  final String name;
  final String imgUrl;
  final bool isFavorite;
  final String description;
  final double price;
  final String category;
  final double rate;
  final double reviewCount;
  final Size? size;
  final int quantity;
  final double searchCount;
  final bool isAddedToCart;

  const ProductItemModel({
    required this.id, 
    required this.name, 
    required this.imgUrl, 
    this.isFavorite = false, 
    this.description = 'Lorem Ipsum is simply dummy text of the printing and typesetting industry, Lorem Ipsum has been the industry, Lorem Ipsum is simply dummy text of the printing and typesetting industry, Lorem Ipsum has been the industry, Lorem Ipsum is simply dummy text of the printing and typesetting industry, Lorem Ipsum has been the industry ', 
    required this.price, 
    required this.category,
    this.rate = 0,
    this.reviewCount = 0,
    this.size,
    this.quantity = 0,
    this.searchCount = 0.0,
    this.isAddedToCart = false,
  });

  ProductItemModel copyWith({
    String? id,
    String? name,
    String? imgUrl,
    bool? isFavorite,
    String? description,
    double? price,
    String? category,
    double? rate,
    double? reviewCount,
    Size? size,
    int? quantity,
    double? searchCount,
    bool? isAddedToCart,
  }){
    return ProductItemModel(
      id: id ?? this.id, 
      name: name ?? this.name, 
      imgUrl: imgUrl?? this.imgUrl, 
      isFavorite: isFavorite ?? this.isFavorite,
      description: description ?? this.description,
      price: price ?? this.price, 
      category: category ?? this.category,
      rate: rate ?? this.rate,
      reviewCount: reviewCount ?? this.reviewCount,
      size: size ?? this.size,
      quantity: quantity ?? this.quantity,
      searchCount: searchCount ?? this.searchCount,
      isAddedToCart: isAddedToCart ?? this.isAddedToCart,
    );
  }
}

//List<String> dummySizes = ['S','M','L','XL'];

List<ProductItemModel> dummyProducts = [
  const ProductItemModel(
    id: '1', 
    name: 'T-Shirt', 
    imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmXqovhVE0FRwNBkjpS-MXPW1Dm9KV6fm4Sw&usqp=CAU', 
    price: 10, 
    category: 'Clothes',
    rate: 4.8,
    reviewCount: 320,
    isAddedToCart: true,
    quantity: 3,
    size: Size.S,
    isFavorite: true,
  ),
  const ProductItemModel(
    id: '2', 
    name: 'Black Shoes', 
    imgUrl: 'https://images-eu.ssl-images-amazon.com/images/I/41urT22Rv6L.jpg', 
    price: 20, 
    category: 'Shoes',
    rate: 5.0,
    reviewCount: 500,
    isFavorite: true,
  ),
  const ProductItemModel(
    id: '3', 
    name: 'Chocolate Brown Trouser', 
    imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDd9vyaLMsXO4wj3D-XoZm8tKVYl-l0d9OnUkTtB1ONmjnaWgLC5REds32tkALXDCG348&usqp=CAU', 
    price: 30, 
    category: 'Clothes',
    rate: 4.0,
    reviewCount: 350,
    isAddedToCart: true,
    quantity: 2,
    size: Size.L
  ),
  const ProductItemModel(
    id: '4', 
    name: 'Fila Black Boats', 
    imgUrl: 'https://rukminim2.flixcart.com/image/850/1000/xif0q/shoe/d/i/w/9-11010799-9-fila-blk-slr-pwr-original-imagmeugpzghhzm3.jpeg?q=90', 
    price: 10, 
    category: 'Shoes',
    isFavorite: true,
  ),
  const ProductItemModel(
    id: '5', 
    name: 'MARK & KEITH Women Handbag', 
    imgUrl: 'https://m.media-amazon.com/images/I/41iUbL7vzbL.jpg', 
    price: 10, 
    category: 'Bags',
    isAddedToCart: true,
    quantity: 4,
    size: Size.XL
  ),
  const ProductItemModel(
    id: '6', 
    name: 'REAL BLUE PRO', 
    imgUrl: 'https://www.testberichte.de/imgs/p_imgs_370/1272868.jpg', 
    price: 10, 
    category: 'Electronics'
  ),
  const ProductItemModel(
    id: '7', 
    name: 'Classic Hat', 
    imgUrl: 'https://melaninapparel.com/wp-content/uploads/2021/08/classic-dad-hat-black-left-side-610adfe4b3b45.jpg', 
    price: 10, 
    category: 'Hats'
  ),
  const ProductItemModel(
    id: '8', 
    name: 'Apple iPhone 11', 
    imgUrl: 'https://kontorsenteret.no/wp-content/uploads/2019/09/1138900.jpg', 
    price: 10, 
    category: 'Electronics',
    isAddedToCart: true,
    quantity: 1,
    isFavorite: true,
  ),
  const ProductItemModel(
    id: '9', 
    name: 'Sweet Shirt', 
    imgUrl: 'https://img.kwcdn.com/product/Fancyalgo/VirtualModelMatting/eb145502841a3a2eb7d0e624c8670d2a.jpg', 
    price: 15, 
    category: 'Clothes'
  ),
  const ProductItemModel(
    id: '10', 
    name: 'Bag', 
    imgUrl: 'https://cuyana.com/cdn/shop/products/PDP_White_Hero_900x900_FA21_SystemTote13_Caramel_Hero_2977.jpg?v=1687316838', 
    price: 15, 
    category: 'Bags',
    isAddedToCart: true,
    quantity: 1,
    size: Size.M,
    isFavorite: true,
  ),
];