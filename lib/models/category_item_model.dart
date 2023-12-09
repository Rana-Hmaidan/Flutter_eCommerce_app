class CategoryItemModel{
  final String id;
  final String name;
  final String imgUrl;
  final int productsCount;

  CategoryItemModel({
    required this.id,
    required this.name, 
    required this.imgUrl, 
    required this.productsCount,
  });
}

List<CategoryItemModel> dummyCategories =[
  CategoryItemModel(
    id: '1', 
    name: 'New Arrivals', 
    imgUrl: 'https://www.frankyfashion.com/cdn/shop/files/Home_Page-1600X600-Blazer_01-Darker_1200x.jpg?v=1650564400',
    productsCount: 208
  ),
   CategoryItemModel(
    id: '2', 
    name: 'Clothes', 
    imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBq1z9gD3GKt7N4QRZ23HrLln0g00zLjZ6wN5dXQ5LjSqraRiuCoOqkynwAj3y7AAOK8o&usqp=CAU',
    productsCount: 358
  ),
   CategoryItemModel(
    id: '3', 
    name: 'Bags', 
    imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGcJ8JtZpe39rwntIitcPhO1w2jjzB_736O8cCpB_PauGv0HrVlkX-s7MBkfmbVNduPBU&usqp=CAU',
    productsCount: 160
  ),
   CategoryItemModel(
    id: '4', 
    name: 'Shoes', 
    imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEouTYWo5AEIrFo0U7ino0SySFxpnSuHRrV9Eh978G1GgJBU4CJRNXxx-IR8WimLPAOaw&usqp=CAU',
    productsCount: 230
  ),
  CategoryItemModel(
    id: '5', 
    name: 'Electronics', 
    imgUrl:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGZQxMo-NM4pBIwq8kEeSKM9z-b9Mxt8yAIf-flAYx_1NcJRa-s0-WleZOxsgYuRnwaUk&usqp=CAU',
    productsCount: 170
  ),
];

 //imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRb05RwAVWedPaoDOjB2-QMTaLm1VFscUEKe9CFdHYaUhy0nlCJpKxevFiK7_BBEvKewDo&usqp=CAU',