import 'package:flutter_ecommerce_app/models/product_item_model.dart';

enum  Description {All, Latest, MostPopular , Hot, New, Popular}

class SearchItemModel{
  final String id;
  final ProductItemModel productItem;
  final Description? description;

  SearchItemModel({
    required this.id,
    required this.productItem,
    this.description,
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
    productItem: const ProductItemModel(
      id: '11', 
      name: 'Lunilo Hills jacket', 
      imgUrl: 'https://i.pinimg.com/564x/4d/01/69/4d016965f8e4214369df35c295baa243.jpg', 
      price: 150, 
      category: 'Clothes',
      searchCount: 1.6,
      ),
    description: Description.Hot,
  ),
  SearchItemModel(
    id: '2',
    productItem: const ProductItemModel(
      id: '12', 
      name: 'Denim Jeans', 
      imgUrl: 'https://i.pinimg.com/564x/89/bd/5f/89bd5fa8bf2127781a58bc5d7c165fb3.jpg', 
      price: 20, 
      category: 'Clothes',
      searchCount: 1,
      ),
    description: Description.New,
  ),
  SearchItemModel(
    id: '3',
    productItem: const ProductItemModel(
      id: '13', 
      name: 'Saddleback Leather Backpack', 
      imgUrl: 'https://i.pinimg.com/564x/e9/66/77/e96677d509e0198d5bbd1c65b4539f18.jpg', 
      price: 100, 
      category: 'Bags',
      searchCount: 1.23,
      ),
    description: Description.Popular,
  ),
  SearchItemModel(
    id: '4',
    productItem: const ProductItemModel(
      id: '14', 
      name: 'JBL Speakers', 
      imgUrl: 'https://i.pinimg.com/564x/ac/23/7f/ac237f901f52afd369df2ce53a7ed64e.jpg', 
      price: 100, 
      category: 'Bags',
      searchCount: 1.23,
      ),
    description: Description.New,
  ),
];
