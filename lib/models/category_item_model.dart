class CategoryItemModel{
  final int id;
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
    id: 1, 
    name: 'New Arrivals', 
    imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCzvqy4roLm4pxSDTG8pyHZUqmMfo0EBokXA&usqp=CAU',
    productsCount: 208
  ),
   CategoryItemModel(
    id: 2, 
    name: 'Clothes', 
    imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBq1z9gD3GKt7N4QRZ23HrLln0g00zLjZ6wN5dXQ5LjSqraRiuCoOqkynwAj3y7AAOK8o&usqp=CAU',
    productsCount: 358
  ),
   CategoryItemModel(
    id: 3, 
    name: 'Bags', 
    imgUrl: 'https://t3.ftcdn.net/jpg/02/48/72/46/360_F_248724638_CmVOwxQz3VBwlp24cgYEIcLuD4CVZ9tb.jpg',
    productsCount: 160
  ),
   CategoryItemModel(
    id: 4, 
    name: 'Shoes', 
    imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEouTYWo5AEIrFo0U7ino0SySFxpnSuHRrV9Eh978G1GgJBU4CJRNXxx-IR8WimLPAOaw&usqp=CAU',
    productsCount: 230
  ),
  CategoryItemModel(
    id: 5, 
    name: 'Electronics',
    imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0Mz9GR52aOkxbJE4ZMiENzTFuVz59XEZ8McMYAMHXfQZtGyZQBUzf7nIStr2qS5ifOw&usqp=CAU', 
    productsCount: 170
  ),
];

 //imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRb05RwAVWedPaoDOjB2-QMTaLm1VFscUEKe9CFdHYaUhy0nlCJpKxevFiK7_BBEvKewDo&usqp=CAU',