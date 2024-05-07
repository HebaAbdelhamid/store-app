class ProductModel{
  final int id;
 late    String title;
   late  dynamic price;
  late  String description;
  final RatingModel? rate;
  late  String image;
  final String category;

  ProductModel({ required this.id,required this.title, required this.price,required this.description, required this.image, required this.category,this.rate });
  factory ProductModel.fromJson(jsonData){
    return ProductModel(id: jsonData['id'], title: jsonData['title'], price: jsonData['price'], description: jsonData['description'], image: jsonData['image'], category: jsonData['category'],rate:jsonData['rating']!=null?RatingModel.fromJson(jsonData['rating']):null);
  }
}
class RatingModel {
  final dynamic rate;
  final int count;
  RatingModel({required this.rate,required this.count});
  factory RatingModel.fromJson(jsonData){
    return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
  }
}