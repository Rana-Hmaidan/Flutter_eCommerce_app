
class AddressItemModel{
  final String id;
  final String title;
  final String subTitle;
  final String imgUrl;
  final bool isSelected;

  AddressItemModel({
    required this.id, 
    required this.title, 
    required this.subTitle, 
    required this.imgUrl,
    this.isSelected = false,
  });

  AddressItemModel copyWith({
    String? id,
    String? title,
    String? subTitle,
    String? imgUrl,
    bool? isSelected,
  }){
    return AddressItemModel(
      id: id ?? this.id, 
      title: title ?? this.title,
      subTitle: subTitle?? this.subTitle, 
      imgUrl: imgUrl?? this.imgUrl, 
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

List<AddressItemModel> dummyAddresses = [
  AddressItemModel(
    id: '1',
    title: 'Los Angeles',
    subTitle: 'Los Angeles, United States',
    imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPL7dDkxZ63UO3PRKOKGb4RGsfGBg_aO81QliOqQNg5t8x4ZbGCNKeQI1NLkg3OoqprUI&usqp=CAU',
  ),
  AddressItemModel(
    id: '2',
    title: 'San Francisco',
    subTitle: 'San Francisco, United States',
    imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIZLR4NL3Qgtw1vvwWvNYWt5s4YCfiuNnHQw&usqp=CAU',
  ),
  AddressItemModel(
    id: '3',
    title: 'New York',
    subTitle: 'New York, United States',
    imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPL7dDkxZ63UO3PRKOKGb4RGsfGBg_aO81QliOqQNg5t8x4ZbGCNKeQI1NLkg3OoqprUI&usqp=CAU',
  ),
];