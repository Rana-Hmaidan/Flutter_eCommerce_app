class PaymentMethodModel{
  final String id;
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String ccvCard;
  final String imgUrl;
  final String name;

  PaymentMethodModel({
    this.id = '0', 
    required this.cardNumber, 
    required this.cardHolderName, 
    required this.expiryDate, 
    required this.ccvCard,
    this.name = 'Master Card',
    this.imgUrl ='https://images.fastcompany.net/image/upload/w_1200,c_limit,q_auto:best/wp-cms/uploads/2023/04/i-3-90885664-mastercard-logo.jpg',
  });
  
}

List<PaymentMethodModel> savedCards =[
  PaymentMethodModel(
    id: '1',
    cardNumber: '4567892251145',
    cardHolderName: 'Ahmed Mohammad',
    expiryDate: '01/28',
    ccvCard: '375',
  ),
  PaymentMethodModel(
    id:'2' ,
    cardNumber: '4567892261145',
    cardHolderName: 'Tala Mohammad',
    expiryDate: '01/25',
    ccvCard: '388',
  ),
  PaymentMethodModel(
    id: '3',
    cardNumber: '4567892271145',
    cardHolderName: 'Sami Mohammad',
    expiryDate: '01/26',
    ccvCard: '283',
  ),
];