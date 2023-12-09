import 'package:flutter_ecommerce_app/models/product_item_model.dart';

class SearchItemModel{
  final String id;
  final ProductItemModel productItem;
  final String description;
  final int descriptionColor;

  SearchItemModel({
    required this.id,
    required this.productItem,
    required this.description,
    required this.descriptionColor,
  });
}

List<String> dummylastSearches = [
  'Electronics',
  'Pants',
  'Three Second',
  'Long Shirt',
];

List<SearchItemModel> dummyPopularSearches = [
  SearchItemModel(
    id: '1',
    productItem: ProductItemModel(
      id: '11', 
      name: 'Lunilo Hills jacket', 
      imgUrl: 'https://i.pinimg.com/564x/4d/01/69/4d016965f8e4214369df35c295baa243.jpg', 
      price: 150, 
      category: 'Clothes',
      searchCount: 1.6,
      ),
    description: 'Hot',
    descriptionColor: 0xffFF0000,
  ),
  SearchItemModel(
    id: '2',
    productItem: ProductItemModel(
      id: '12', 
      name: 'Denim Jeans', 
      imgUrl: 'https://i.pinimg.com/564x/89/bd/5f/89bd5fa8bf2127781a58bc5d7c165fb3.jpg', 
      price: 20, 
      category: 'Clothes',
      searchCount: 1,
      ),
    description: 'New',
    descriptionColor: 0xffFFA500,
  ),
  SearchItemModel(
    id: '3',
    productItem: ProductItemModel(
      id: '13', 
      name: 'Saddleback Leather Backpack', 
      imgUrl: 'https://i.pinimg.com/564x/e9/66/77/e96677d509e0198d5bbd1c65b4539f18.jpg', 
      price: 100, 
      category: 'Bags',
      searchCount: 1.23,
      ),
    description: 'Popular',
    descriptionColor: 0xff008000,
  ),
  SearchItemModel(
    id: '4',
    productItem: ProductItemModel(
      id: '14', 
      name: 'JBL Speakers', 
      imgUrl: 'https://i.pinimg.com/564x/ac/23/7f/ac237f901f52afd369df2ce53a7ed64e.jpg', 
      price: 100, 
      category: 'Bags',
      searchCount: 1.23,
      ),
    description: 'New',
    descriptionColor: 0xffFFA500,
  ),
];
